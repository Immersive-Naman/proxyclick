import 'package:go_router/go_router.dart';
import 'package:proxyclick/core/routes/route_name.dart';
import 'package:proxyclick/presentation/views/agreement/view/agreement_screen.dart';
import 'package:proxyclick/presentation/views/home/view/home_screen.dart';
import 'package:proxyclick/presentation/views/login/view/login_screen.dart';
import 'package:proxyclick/presentation/views/passkey/view/passkey_screen.dart';
import 'package:proxyclick/presentation/views/profile_setting/view/profile_setting_screen.dart';
import 'package:proxyclick/presentation/views/signup/view/signup_screen.dart';
import 'package:proxyclick/presentation/views/splash/view/splash_screen.dart';
import 'package:proxyclick/presentation/views/thankyou/view/thankyou_screen.dart';
import 'package:proxyclick/presentation/views/visiting_name/view/visiting_name_screen.dart';
import 'package:proxyclick/presentation/views/visitor_details/view/visitor_details_screen.dart';
import 'package:proxyclick/presentation/views/visitor_name/view/visitor_name_screen.dart';
import 'package:proxyclick/presentation/views/visitor_photo/view/visitor_photo_screen.dart';
import 'package:proxyclick/presentation/views/visitor_profile/view/visitor_profile.dart';

import '../../presentation/views/welcome/view/welcome_screen.dart';

class MyRouter {
  static final goRouter = GoRouter(
    // routerNeglect: true,
    routes: [
      GoRoute(
        name: RouteName.SplashScreen,
        path: RouteName.SplashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: RouteName.Initial,
        path: RouteName.Initial,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: RouteName.LoginScreen,
        name: RouteName.LoginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteName.SignupScreen,
        name: RouteName.SignupScreen,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: RouteName.PasskeyScreen,
        name: RouteName.PasskeyScreen,
        builder: (context, state) => const PasskeyScreen(),
      ),
      GoRoute(
        path: RouteName.HomeScreen,
        name: RouteName.HomeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: RouteName.VisitorNameScreen,
        name: RouteName.VisitorNameScreen,
        builder: (context, state) => const VisitorNameScreen(),
      ),
      GoRoute(
        path: RouteName.VisitingNameScreen,
        name: RouteName.VisitingNameScreen,
        builder: (context, state) => const VisitingNameScreen(),
      ),
      GoRoute(
        path: RouteName.VisitorPhotoScreen,
        name: RouteName.VisitorPhotoScreen,
        builder: (context, state) => const VisitorPhotoScreen(),
      ),
      GoRoute(
        path: RouteName.VisitorDetailScreen,
        name: RouteName.VisitorDetailScreen,
        builder: (context, state) {
          return VisitorDetailScreen(
            firstName: state.uri.queryParameters['firstName'] ?? '',
            lastName: state.uri.queryParameters['lastName'] ?? '',
          );
        },
      ),
      GoRoute(
        path: RouteName.AgreementScreen,
        name: RouteName.AgreementScreen,
        builder: (context, state) => AgreementScreen(),
      ),
      GoRoute(
        path: RouteName.VisitorProfileScreen,
        name: RouteName.VisitorProfileScreen,
        builder: (context, state) => const VisitorProfileScreen(),
      ),
      GoRoute(
        path: RouteName.ThankyouScreen,
        name: RouteName.ThankyouScreen,
        builder: (context, state) => const ThankyouScreen(),
      ),
      GoRoute(
        path: RouteName.ProfileSettingScreen,
        name: RouteName.ProfileSettingScreen,
        builder: (context, state) => const ProfileSettingScreen(),
      ),
    ],
  );
}
