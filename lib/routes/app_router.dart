import 'package:auto_route/auto_route.dart';
import 'package:done_app/screens/dashboard/closed/closed_goal_detail_view.dart';
import 'package:done_app/screens/dashboard/closed/closed_goals_view.dart';
import 'package:done_app/screens/dashboard/dashboard_view.dart';
import 'package:done_app/screens/dashboard/goals/goal_detail_view.dart';
import 'package:done_app/screens/dashboard/goals/goals_view.dart';
import 'package:done_app/screens/dashboard/stats/stats_view.dart';
import 'package:done_app/screens/splash/splash_view.dart';
import 'package:done_app/screens/dashboard/timer/timer_view.dart';
import 'package:flutter/material.dart';
import '../models/goal_model.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(              
  replaceInRouteName: 'View,Route',              
  routes: <AutoRoute>[  
    AutoRoute(
      initial: true,
      page: SplashView,
      path: '/splash',
    ),
    AutoRoute(
      page: DashboardView,
      path: '/dashboard',
      children: [
        AutoRoute(
          page: EmptyRouterPage,
          name: 'goalFullRoute',
          path: 'goalFullRoute',
          children: [
            AutoRoute(
              initial: true,
              page: GoalsView,
              path: 'goals',
            ),
            AutoRoute(
              page: GoalDetailView,
              path: 'goalDetail',
            )
          ]
        ),
        AutoRoute(
          page: EmptyRouterPage,
          name: 'closedFullRoute',
          path: 'closedFullRoute',
          children: [
            AutoRoute(
              initial: true,
              page: ClosedGoalsView,
              path: 'closedGoals',
            ),
            AutoRoute(
              page: ClosedGoalDetailView,
              path: 'closedGoalDetail',
            )
          ]
        ),
        AutoRoute(
          page: TimerView,
          path: 'timer',
        ),
        AutoRoute(
          page: StatsView,
          path: 'stats',
        )
      ]
    ),
  ],
)

class AppRouter extends _$AppRouter{}