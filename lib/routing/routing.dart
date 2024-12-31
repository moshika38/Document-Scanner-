import 'package:flutter_application_1/features/auth/screen/sing_in_screen.dart';
import 'package:flutter_application_1/features/home/screen/home_screen.dart';
import 'package:flutter_application_1/features/on%20boarding/screen/on_boarding_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouting {
  static GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const SingInScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
       
    ],
  );
}
