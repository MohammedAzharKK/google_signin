import 'package:flutter_signin/screen/homescreen.dart';
import 'package:flutter_signin/screen/signin_page.dart';
import 'package:flutter_signin/screen/signup_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(initialLocation: "/signUpPage", routes: [
  GoRoute(
      path: "/signUpPage",
      builder: (context, state) => const SignUpPage(),
      name: "signup"),
  GoRoute(
      path: "/signin",
      builder: (context, state) => const SignInPage(),
      name: "signin"),
  GoRoute(
      name: "HomePage",
      path: "/loginpage",
      builder: (context, state) => const Homescreen()),
]);
