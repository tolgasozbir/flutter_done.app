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
    ClosedFullRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
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
          child: GoalDetailView(key: args.key, goal: args.goal));
    },
    ClosedGoalsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ClosedGoalsView());
    },
    ClosedGoalDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ClosedGoalDetailRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ClosedGoalDetailView(key: args.key, goal: args.goal));
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
          RouteConfig(ClosedFullRoute.name,
              path: 'closedFullRoute',
              parent: DashboardRoute.name,
              children: [
                RouteConfig('#redirect',
                    path: '',
                    parent: ClosedFullRoute.name,
                    redirectTo: 'closedGoals',
                    fullMatch: true),
                RouteConfig(ClosedGoalsRoute.name,
                    path: 'closedGoals', parent: ClosedFullRoute.name),
                RouteConfig(ClosedGoalDetailRoute.name,
                    path: 'closedGoalDetail', parent: ClosedFullRoute.name)
              ]),
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
/// [EmptyRouterPage]
class ClosedFullRoute extends PageRouteInfo<void> {
  const ClosedFullRoute({List<PageRouteInfo>? children})
      : super(ClosedFullRoute.name,
            path: 'closedFullRoute', initialChildren: children);

  static const String name = 'ClosedFullRoute';
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
  GoalDetailRoute({Key? key, required Goal goal})
      : super(GoalDetailRoute.name,
            path: 'goalDetail',
            args: GoalDetailRouteArgs(key: key, goal: goal));

  static const String name = 'GoalDetailRoute';
}

class GoalDetailRouteArgs {
  const GoalDetailRouteArgs({this.key, required this.goal});

  final Key? key;

  final Goal goal;

  @override
  String toString() {
    return 'GoalDetailRouteArgs{key: $key, goal: $goal}';
  }
}

/// generated route for
/// [ClosedGoalsView]
class ClosedGoalsRoute extends PageRouteInfo<void> {
  const ClosedGoalsRoute() : super(ClosedGoalsRoute.name, path: 'closedGoals');

  static const String name = 'ClosedGoalsRoute';
}

/// generated route for
/// [ClosedGoalDetailView]
class ClosedGoalDetailRoute extends PageRouteInfo<ClosedGoalDetailRouteArgs> {
  ClosedGoalDetailRoute({Key? key, required Goal goal})
      : super(ClosedGoalDetailRoute.name,
            path: 'closedGoalDetail',
            args: ClosedGoalDetailRouteArgs(key: key, goal: goal));

  static const String name = 'ClosedGoalDetailRoute';
}

class ClosedGoalDetailRouteArgs {
  const ClosedGoalDetailRouteArgs({this.key, required this.goal});

  final Key? key;

  final Goal goal;

  @override
  String toString() {
    return 'ClosedGoalDetailRouteArgs{key: $key, goal: $goal}';
  }
}
