import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// --- Shared & Customer Imports ---
import 'app/theme.dart';
import 'screens/landing_screen.dart'; // Where users choose to login
import 'screens/home_screen.dart';    // The customer facing UI

// --- Admin Imports ---
// Assuming you placed these inside lib/screens/admin/ as discussed
import 'screens/admin/dashboard_screen.dart';
import 'screens/admin/workers_screen.dart';
import 'screens/admin/bookings_screen.dart';
import 'screens/admin/allocation_screen.dart';
import 'screens/admin/forecast_screen.dart';
import 'screens/admin/heatmap_screen.dart';
import 'screens/admin/welfare_screen.dart';
import 'screens/admin/roles_screen.dart';
import 'screens/admin/audit_logs_screen.dart';

void main() {
  runApp(const SahyogApp());
}

// 1. Unified Router Configuration
final GoRouter _router = GoRouter(
  initialLocation: '/', // Start at the landing page
  routes: [
    // --- Public / Customer Routes ---
    GoRoute(
      path: '/',
      builder: (context, state) => const LandingScreen(),
    ),
    GoRoute(
      path: '/customer',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),

    // --- Admin Routes ---
    GoRoute(
      path: '/admin/dashboard',
      builder: (context, state) => const DashboardScreen(), //
    ),
    GoRoute(
      path: '/admin/workers',
      builder: (context, state) => const WorkersScreen(), //[cite: 2]
    ),
    GoRoute(
      path: '/admin/bookings',
      builder: (context, state) => const BookingsScreen(), //[cite: 2]
    ),
    GoRoute(
      path: '/admin/allocation',
      builder: (context, state) => const AllocationScreen(), //[cite: 2]
    ),
    GoRoute(
      path: '/admin/forecast',
      builder: (context, state) => const ForecastScreen(), //[cite: 2]
    ),
    GoRoute(
      path: '/admin/heatmap',
      builder: (context, state) => const HeatmapScreen(), //[cite: 2]
    ),
    GoRoute(
      path: '/admin/welfare',
      builder: (context, state) => const WelfareScreen(), //[cite: 2]
    ),
    GoRoute(
      path: '/admin/roles',
      builder: (context, state) => const RolesScreen(), //[cite: 2]
    ),
    GoRoute(
      path: '/admin/audit-logs',
      builder: (context, state) => const AuditLogsScreen(), //[cite: 2]
    ),
  ],
);

class SahyogApp extends StatelessWidget {
  const SahyogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SHRAMIK DISHA',
      debugShowCheckedModeBanner: false, //[cite: 2]
      // Use your primary theme for the whole app wrapper
      theme: buildAppTheme(), 
      routerConfig: _router,
      builder: (context, child) {
        return ColoredBox(
          color: AppColors.background,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 390),
              child: child,
            ),
          ),
        );
      },
    );
  }
}