import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'intro.dart';
import 'quiz.dart';
import 'result.dart';
import 'timer.dart';

//final MyTimerState myTimerState;
final myTimerState = MyTimerState();

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return IntroPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'quiz',
          builder: (BuildContext context, GoRouterState state) {
            return QuizPage();
          },
          // routes: <RouteBase>[
          //   GoRoute(
          //     path: 'result',
          //     builder: (BuildContext context, GoRouterState state) {
          //      // return const ResultPage();
          //     },
          //   ),
          // ],
        ),
      ],
    ),
  ],
);
class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Quiz App',
    );
  }
}