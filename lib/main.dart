import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:permission_handler/permission_handler.dart';
//Providers
import 'package:provider/provider.dart';
import 'package:proxyclick/core/routes/router.dart';
import 'package:proxyclick/core/themes/theme.dart';
import 'package:proxyclick/presentation/views/home/view_model/home_provider.dart';
import 'package:proxyclick/presentation/views/login/view_model/login_provider.dart';
import 'package:proxyclick/presentation/views/passkey/view_model/passkey_provider.dart';
import 'package:proxyclick/presentation/views/profile_setting/view_model/profile_setting_view_model.dart';
import 'package:proxyclick/presentation/views/signup/view_model/signup_provider.dart';
import 'package:proxyclick/presentation/views/visitor_photo/view_model/visitor_photo_provider.dart';
import 'package:proxyclick/presentation/views/welcome/view_model/welcome_provider.dart';

void main() async {
  // Set the Path URL strategy to remove '#'
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  if (kIsWeb) {
    setUrlStrategy(PathUrlStrategy());
  }
  await [Permission.camera, Permission.microphone].request();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WelcomeProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => SignupProvider()),
        ChangeNotifierProvider(create: (context) => PasskeyProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => VisitorPhotoProvider()),
        ChangeNotifierProvider(create: (context) => ProfileSettingProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: MyRouter.goRouter,
        theme: AppTheme.darkTheme,
      ),
    );
  }
}
