import 'package:flutter_forms/presentation/screens/home_screen.dart';
import 'package:flutter_forms/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [
  GoRoute(path: '/', builder: (c, s) => const HomeScreen()),
  GoRoute(path: '/cubits', builder: (c, s) => const CubitCounterScreen()),
  GoRoute(path: '/counter-bloc', builder: (c, s) => const CubitCounterScreen()),

]);