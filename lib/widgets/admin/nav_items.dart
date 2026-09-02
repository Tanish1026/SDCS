import 'package:flutter/material.dart';

/// Identifies each of the nine admin sections so the drawer/bottom nav can
/// highlight the current page.
enum AdminSection {
  dashboard,
  workers,
  bookings,
  allocation,
  forecast,
  heatmap,
  welfare,
  roles,
  auditLogs,
}

extension AdminSectionRoute on AdminSection {
  String get routeName {
    switch (this) {
      case AdminSection.dashboard:
        return '/admin/dashboard';
      case AdminSection.workers:
        return '/admin/workers';
      case AdminSection.bookings:
        return '/admin/bookings';
      case AdminSection.allocation:
        return '/admin/allocation';
      case AdminSection.forecast:
        return '/admin/forecast';
      case AdminSection.heatmap:
        return '/admin/heatmap';
      case AdminSection.welfare:
        return '/admin/welfare';
      case AdminSection.roles:
        return '/admin/roles';
      case AdminSection.auditLogs:
        return '/admin/audit-logs';
    }
  }
}

class NavItemData {
  final AdminSection section;
  final IconData icon;
  final String label;

  const NavItemData(this.section, this.icon, this.label);
}

/// Mirrors the drawer <ul> that appears identically (give or take a label)
/// on every one of the source HTML pages.
const List<NavItemData> kNavItems = [
  NavItemData(AdminSection.dashboard, Icons.dashboard_outlined, 'Dashboard'),
  NavItemData(AdminSection.workers, Icons.group_outlined, 'Workers'),
  NavItemData(AdminSection.bookings, Icons.event_available_outlined, 'Bookings'),
  NavItemData(AdminSection.allocation, Icons.psychology_outlined, 'Workforce Allocation'),
  NavItemData(AdminSection.forecast, Icons.trending_up, 'Demand Forecast'),
  NavItemData(AdminSection.heatmap, Icons.map_outlined, 'Map & Heatmap'),
  NavItemData(AdminSection.welfare, Icons.volunteer_activism_outlined, 'Worker Welfare'),
  NavItemData(AdminSection.roles, Icons.admin_panel_settings_outlined, 'Roles & Permissions'),
  NavItemData(AdminSection.auditLogs, Icons.history, 'Audit Logs'),
];
