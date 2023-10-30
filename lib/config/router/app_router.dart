import 'package:cardio_hit/src/presentation/screens/actual_velocity_screen.dart';
import 'package:cardio_hit/src/presentation/screens/home_screen.dart';
import 'package:cardio_hit/src/presentation/screens/select_level_screen.dart';
import 'package:cardio_hit/src/presentation/screens/summary_hit_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/select-level/:time',
      builder: (context, state) => SelectLevelScreen(time: state.pathParameters['time'] ?? 'no time'),
    ),
    GoRoute(
      path: '/summary-hit/:levelValue/:hitValue',
      builder: (context, state) => SummaryHitScreen(
        levelValue: state.pathParameters['levelValue'] ?? 'no levelValue', 
        hitValue: state.pathParameters['hitValue']  ?? 'no hitValue'
      ),
    ),
    GoRoute(
      path: '/actual-velocity/:levelValue/:hitValue',
      builder: (context, state) => ActualVelocityScreen(
        levelValue: state.pathParameters['levelValue'] ?? 'no levelValue', 
        hitValue: state.pathParameters['hitValue']  ?? 'no hitValue'
      ),
    ),
  ]
);