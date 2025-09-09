// import 'dart:convert';
// import 'dart:typed_data';
// import 'dart:ui_web' as ui;

// import 'package:flutter/widgets.dart';
// import 'package:universal_html/html.dart' as html;

// class VisitorPhotoProvider extends ChangeNotifier {
//   html.VideoElement? videoElement;
//   html.CanvasElement? canvasElement;
//   html.ImageElement? capturedImage;
//   html.MediaStream? mediaStream;
//   Uint8List? uint8Image;

//   get platformViewRegistry => null;

//   void registerViewFactories() {
//     if (videoElement != null) {
//       ui.platformViewRegistry.registerViewFactory(
//         'videoElement',
//         (int viewId) => videoElement!,
//       );
//     }

//     if (capturedImage != null) {
//       ui.platformViewRegistry.registerViewFactory(
//         'capturedImage',
//         (int viewId) => capturedImage!,
//       );
//     }
//   }

//   Future<void> initializeCamera() async {
//     // Get the camera stream
//     mediaStream = await html.window.navigator.mediaDevices?.getUserMedia({
//       'video': true, // Request video feed
//     });

//     // Create a video element and set the camera stream as the source
//     videoElement = html.VideoElement()
//       ..autoplay = true
//       ..srcObject = mediaStream;

//     // Create a canvas element to capture the photo
//     canvasElement = html.CanvasElement();
//     registerViewFactories();
//     notifyListeners();
//   }

//   Future<void> capturePhoto() async {
//     if (videoElement == null || canvasElement == null) return;

//     // Set the canvas size to match the video size
//     canvasElement!.width = videoElement!.videoWidth;
//     canvasElement!.height = videoElement!.videoHeight;

//     // Draw the current video frame to the canvas
//     canvasElement!.context2D.drawImage(videoElement!, 0, 0);

//     // Convert the canvas to a data URL (base64 encoded image)
//     String imageData = canvasElement!.toDataUrl();

//     // Remove the prefix ("data:image/png;base64,") to get the base64 string
//     String base64Image = imageData.split(',').last;

//     // Convert base64 string to Uint8List
//     uint8Image = base64Decode(base64Image);

//     stopCamera(mediaStream);
//     notifyListeners();
//   }

//   void stopCamera(html.MediaStream? mediaStream) {
//     videoElement!.remove();
//     videoElement = null;
//     if (mediaStream != null) {
//       // Stop all tracks in the media stream
//       mediaStream.getTracks().forEach((track) {
//         track.stop();
//       });
//       mediaStream = null;
//     }
//   }
// }

import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';

class VisitorPhotoProvider extends ChangeNotifier {
  CameraController? _cameraController;
  XFile? _capturedPhoto;
  Uint8List? uint8Image;

  CameraController? get cameraController => _cameraController;

  Future<void> initializeCamera() async {
    // Get the list of available cameras
    final cameras = await availableCameras();
    print('cameras: $cameras');
    if (cameras.isNotEmpty) {
      // Initialize the camera controller with the first available camera
      _cameraController = CameraController(
        cameras.last,
        ResolutionPreset.high,
        enableAudio: false,
      );

      // Initialize the controller
      await _cameraController?.initialize();
      notifyListeners();
    }
  }

  Future<void> capturePhoto() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      throw Exception("Camera is not initialized");
    }

    // Capture the photo
    _capturedPhoto = await _cameraController!.takePicture();

    // Convert the captured photo to Uint8List
    uint8Image = await _capturedPhoto?.readAsBytes();
    disposeCamera();
    notifyListeners();
  }

  void disposeCamera() {
    _cameraController?.dispose();
    _cameraController = null;
  }
}
