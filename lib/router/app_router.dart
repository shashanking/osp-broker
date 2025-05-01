import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:osp_broker/features/authentication/presentations/login_page.dart';
import 'package:osp_broker/features/authentication/presentations/signup_page.dart';
import 'package:osp_broker/features/home/presentation/home_page.dart';
import 'package:osp_broker/features/about-us/presentation/about_us_page.dart';
import 'package:osp_broker/features/membership/presentation/membership_herosection.dart';
import 'package:osp_broker/features/contactUs/presentations/contact_us_page.dart';
import 'package:osp_broker/features/rfp/presentations/rfp_page.dart';
import 'package:osp_broker/features/menu/presentation/menu_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignupPage(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutUsPage(),
    ),
    GoRoute(
      path: '/membership',
      builder: (context, state) => const MembershipHeroSection(),
    ),
    GoRoute(
      path: '/contact',
      builder: (context, state) => const ContactUsPage(),
    ),
    GoRoute(
      path: '/rfp',
      builder: (context, state) => const RfpPage(),
    ),
    GoRoute(
      path: '/menu',
      builder: (context, state) => const MenuPage(),
    ),
  ],
);
