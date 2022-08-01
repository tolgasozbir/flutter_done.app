// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SplashView());
    },
    DashboardRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const DashboardView());
    },
    GoalFullRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    ClosedGoalsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ClosedGoalsView());
    },
    TimerRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const TimerView());
    },
    StatsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const StatsView());
    },
    GoalsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const GoalsView());
    },
    GoalDetailRoute.name: (routeData) {
      final args = routeData.argsAs<GoalDetailRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: GoalDetailView(key: args.key, task: args.task));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/splash', fullMatch: true),
        RouteConfig(SplashRoute.name, path: '/splash'),
        RouteConfig(DashboardRoute.name, path: '/dashboard', children: [
          RouteConfig(GoalFullRoute.name,
              path: 'goalFullRoute',
              parent: DashboardRoute.name,
              children: [
                RouteConfig('#redirect',
                    path: '',
                    parent: GoalFullRoute.name,
                    redirectTo: 'goals',
                    fullMatch: true),
                RouteConfig(GoalsRoute.name,
                    path: 'goals', parent: GoalFullRoute.name),
                RouteConfig(GoalDetailRoute.name,
                    path: 'goalDetail', parent: GoalFullRoute.name)
              ]),
          RouteConfig(ClosedGoalsRoute.name,
              path: 'closedGoals', parent: DashboardRoute.name),
          RouteConfig(TimerRoute.name,
              path: 'timer', parent: DashboardRoute.name),
          RouteConfig(StatsRoute.name,
              path: 'stats', parent: DashboardRoute.name)
        ])
      ];
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/splash');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [DashboardView]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(DashboardRoute.name,
            path: '/dashboard', initialChildren: children);

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [EmptyRouterPage]
class GoalFullRoute extends PageRouteInfo<void> {
  const GoalFullRoute({List<PageRouteInfo>? children})
      : super(GoalFullRoute.name,
            path: 'goalFullRoute', initialChildren: children);

  static const String name = 'GoalFullRoute';
}

/// generated route for
/// [ClosedGoalsView]
class ClosedGoalsRoute extends PageRouteInfo<void> {
  const ClosedGoalsRoute() : super(ClosedGoalsRoute.name, path: 'closedGoals');

  static const String name = 'ClosedGoalsRoute';
}

/// generated route for
/// [TimerView]
class TimerRoute extends PageRouteInfo<void> {
  const TimerRoute() : super(TimerRoute.name, path: 'timer');

  static const String name = 'TimerRoute';
}

/// generated route for
/// [StatsView]
class StatsRoute extends PageRouteInfo<void> {
  const StatsRoute() : super(StatsRoute.name, path: 'stats');

  static const String name = 'StatsRoute';
}

/// generated route for
/// [GoalsView]
class GoalsRoute extends PageRouteInfo<void> {
  const GoalsRoute() : super(GoalsRoute.name, path: 'goals');

  static const String name = 'GoalsRoute';
}

/// generated route for
/// [GoalDetailView]
class GoalDetailRoute extends PageRouteInfo<GoalDetailRouteArgs> {
  GoalDetailRoute({Key? key, required Task task})
      : super(GoalDetailRoute.name,
            path: 'goalDetail',
            args: GoalDetailRouteArgs(key: key, task: task));

  static const String name = 'GoalDetailRoute';
}

class GoalDetailRouteArgs {
  const GoalDetailRouteArgs({this.key, required this.task});

  final Key? key;

  final Task task;

  @override
  String toString() {
    return 'GoalDetailRouteArgs{key: $key, task: $task}';
  }
}
