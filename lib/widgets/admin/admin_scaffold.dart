import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sdcs/app/content.dart'; // Ensure this matches your actual path
import '../../app/theme.dart';
import '../../core/services/auth_service.dart';
import 'nav_items.dart';

class AdminScaffold extends StatelessWidget {
  final AdminSection current;
  final String title;
  final Widget body;
  final Widget? floatingActionButton;

  const AdminScaffold({
    super.key,
    required this.current,
    required this.body,
    this.title = 'SDCS Admin',
    this.floatingActionButton,
  });

  void _goTo(BuildContext context, AdminSection section) {
    if (section == current) return;
    context.go(section.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppColors.outlineVariant),
        ),
        titleSpacing: 4,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                logoUrl, // Ensure logoUrl is defined in your content.dart
                height: 28,
                width: 28,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 28,
                  width: 28,
                  color: AppColors.primaryContainer,
                  child: const Icon(Icons.handyman, color: Colors.white, size: 16),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(title, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700, fontSize: 18)),
          ],
        ),
        iconTheme: const IconThemeData(color: AppColors.primary),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          const SizedBox(width: 4),
        ],
      ),
      drawer: Drawer(
        backgroundColor: AppColors.surfaceBright,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: AppColors.primary,
                padding: const EdgeInsets.all(24),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        logoUrl,
                        height: 48,
                        width: 48,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const CircleAvatar(
                          radius: 24,
                          child: Icon(Icons.person),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Union Administrator',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(height: 2),
                          Text('Region East', style: TextStyle(color: Colors.white70, fontSize: 13)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  children: kNavItems.map((item) {
                    final selected = item.section == current;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Material(
                        color: selected ? AppColors.secondaryContainer : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        child: ListTile(
                        leading: Icon(
                          item.icon,
                          color: selected ? AppColors.onSecondaryContainer : AppColors.onSurfaceVariant,
                        ),
                        title: Text(
                          item.label,
                          style: TextStyle(
                            color: selected ? AppColors.onSecondaryContainer : AppColors.onSurfaceVariant,
                            fontWeight: selected ? FontWeight.bold : FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        onTap: () {
                          // FIX: Close the drawer before attempting to navigate
                          Navigator.pop(context);
                          _goTo(context, item.section);
                        },
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.logout, color: AppColors.error),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    color: AppColors.error,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  await const AuthService().signOut();
                  if (context.mounted) context.go('/');
                },
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(child: body),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: _BottomNav(current: current, onTap: (s) => _goTo(context, s)),
    );
  }
}

class _BottomNav extends StatelessWidget {
  final AdminSection current;
  final void Function(AdminSection) onTap;

  const _BottomNav({required this.current, required this.onTap});

  @override
  Widget build(BuildContext context) {
    const primaryStops = [AdminSection.dashboard, AdminSection.workers, AdminSection.heatmap];
    final activeIndex = primaryStops.indexOf(current);

    return BottomAppBar(
      color: AppColors.surface,
      height: 64,
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          _NavButton(
            icon: Icons.dashboard,
            label: 'Dashboard',
            selected: activeIndex == 0,
            onTap: () => onTap(AdminSection.dashboard),
          ),
          _NavButton(
            icon: Icons.group,
            label: 'Workers',
            selected: activeIndex == 1,
            onTap: () => onTap(AdminSection.workers),
          ),
          _NavButton(
            icon: Icons.map,
            label: 'Heatmaps',
            selected: activeIndex == 2,
            onTap: () => onTap(AdminSection.heatmap),
          ),
          _NavButton(
            icon: Icons.more_horiz,
            label: 'More',
            selected: activeIndex == -1,
            onTap: () => Scaffold.of(context).openDrawer(),
          ),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _NavButton({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.primary : AppColors.onSurfaceVariant;
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 2),
            Text(label, style: TextStyle(color: color, fontSize: 11, fontWeight: selected ? FontWeight.bold : FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}