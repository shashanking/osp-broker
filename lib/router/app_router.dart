import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:osp_broker/features/authentication/presentations/login_page.dart';
import 'package:osp_broker/features/authentication/presentations/signup_page.dart';
import 'package:osp_broker/features/forum/domain/entities/category.dart';
import 'package:osp_broker/features/forum/domain/entities/thread.dart';
import 'package:osp_broker/features/forum/presentation/forum_page.dart';
import 'package:osp_broker/features/forum/presentation/thread_list_page.dart';
import 'package:osp_broker/features/forum/presentation/thread_page.dart';
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
      path: '/thread-list',
      builder: (context, state) => ThreadListPage(
        category: Category(id: 'auctions', name: 'Auctions & Bidding'),
        threads: const [],
      ),
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
    // Forum main page
    GoRoute(
      path: '/forums',
      builder: (context, state) => const ForumPage(),
      routes: [
        // Thread list for a category
        GoRoute(
          path: ':categoryId',
          builder: (context, state) {
            final categoryId = state.pathParameters['categoryId']!;
            // TODO: Fetch category and threads by categoryId
            // Pass dummy data for now
            return ThreadListPage(
              category: Category(id: categoryId, name: categoryId),
              threads: const [],
            );
          },
          routes: [
            // Single thread page
            GoRoute(
              path: 'thread/:threadId',
              builder: (context, state) {
                final threadId = state.pathParameters['threadId']!;
                // TODO: Fetch thread and comments by threadId
                // Pass dummy data for now
                return ThreadPage(
                  thread: Thread(
                    id: threadId,
                    title: 'Thread Title',
                    body: 'Thread body here...',
                    snippet: '',
                    categoryId: '',
                    author: 'Author',
                    createdAt: DateTime.now(),
                  ),
                  comments: const [],
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
