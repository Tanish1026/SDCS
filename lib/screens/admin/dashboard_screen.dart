import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/theme.dart';
import '../../widgets/admin/admin_scaffold.dart';
import '../../widgets/admin/nav_items.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      current: AdminSection.dashboard,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
        children: [
          const Text(
            'Good morning, Union Head',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.primary),
          ),
          const SizedBox(height: 4),
          const Text(
            'Here is the current operational status for Region East.',
            style: TextStyle(color: AppColors.onSurfaceVariant),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 118,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                  onTap: () => context.go('/admin/bookings'),
                  child: const _KpiCard(label: 'Total Workers', icon: Icons.group_outlined, value: '1,240', trend: '+24 this week', trendIcon: Icons.arrow_upward, trendColor: AppColors.secondary),
                ),
                const SizedBox(width: 12),
                InkWell(
                  onTap: () => context.go('/admin/workers'),
                  child: const _KpiCard(label: 'Active Jobs', icon: Icons.business_center_outlined, value: '86', trend: 'Steady', trendIcon: Icons.trending_flat, trendColor: AppColors.onSurfaceVariant),
                ),
                const SizedBox(width: 12),
                InkWell(
                  onTap: () => context.go('/admin/workers'),
                  child: const _KpiCard(label: 'Pending Verification', icon: Icons.pending_actions_outlined, value: '12', trend: 'Action needed', trendIcon: Icons.priority_high, trendColor: AppColors.onTertiaryContainer, valueColor: AppColors.onTertiaryContainer),
                ),
                const SizedBox(width: 12),
                InkWell(
                  onTap: () => context.go('/admin/bookings'),
                  child: const _KpiCard(label: "Today's Bookings", icon: Icons.event_available_outlined, value: '45', trend: '+5 from avg', trendIcon: Icons.arrow_upward, trendColor: AppColors.secondary),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const _AiInsightCard(),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Recent Bookings', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.primary)),
              TextButton(onPressed: () => context.go('/admin/bookings'), child: const Text('View All')),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLowest,
              border: Border.all(color: AppColors.outlineVariant),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: const [
                _BookingRow(id: '#BK-9021', service: 'Plumbing', icon: Icons.plumbing, statusLabel: 'Completed', statusColor: AppColors.secondaryContainer, statusTextColor: AppColors.onSecondaryContainer, statusIcon: Icons.check_circle),
                Divider(height: 1),
                _BookingRow(id: '#BK-9022', service: 'Electrical', icon: Icons.electrical_services, statusLabel: 'In Progress', statusColor: AppColors.surfaceVariant, statusTextColor: AppColors.onSurfaceVariant, statusIcon: Icons.autorenew),
                Divider(height: 1),
                _BookingRow(id: '#BK-9023', service: 'Carpentry', icon: Icons.carpenter, statusLabel: 'In Progress', statusColor: AppColors.surfaceVariant, statusTextColor: AppColors.onSurfaceVariant, statusIcon: Icons.autorenew, isLast: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _KpiCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final String value;
  final String trend;
  final IconData trendIcon;
  final Color trendColor;
  final Color? valueColor;

  const _KpiCard({
    required this.label,
    required this.icon,
    required this.value,
    required this.trend,
    required this.trendIcon,
    required this.trendColor,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        border: Border.all(color: AppColors.outlineVariant),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(label, style: const TextStyle(fontSize: 12, color: AppColors.onSurfaceVariant, fontWeight: FontWeight.w500)),
              ),
              Icon(icon, size: 18, color: AppColors.onSurfaceVariant),
            ],
          ),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: valueColor ?? AppColors.primary)),
          const Spacer(),
          Row(
            children: [
              Icon(trendIcon, size: 14, color: trendColor),
              const SizedBox(width: 4),
              Expanded(child: Text(trend, style: TextStyle(fontSize: 12, color: trendColor, fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis)),
            ],
          ),
        ],
      ),
    );
  }
}

class _AiInsightCard extends StatelessWidget {
  const _AiInsightCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primaryContainer, AppColors.primary],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -10,
            top: -10,
            child: Icon(Icons.memory, size: 100, color: Colors.white.withValues(alpha: 0.08)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.auto_awesome, color: AppColors.inversePrimary, size: 18),
                  const SizedBox(width: 8),
                  Text('CALCULATED INSIGHT', style: TextStyle(color: AppColors.inversePrimary, fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 1)),
                ],
              ),
              const SizedBox(height: 12),
              const Text('Workforce shortage predicted', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Text(
                'Historical data suggests a 15% deficit in skilled labor for Zone A - Plumbing starting next Tuesday due to overlapping large-scale projects.',
                style: TextStyle(color: AppColors.primaryFixedDim, height: 1.4),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => context.go('/admin/forecast'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryFixed,
                  foregroundColor: AppColors.onPrimaryFixed,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                ),
                icon: const Text('Review Recommendation'),
                label: const Icon(Icons.arrow_forward, size: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BookingRow extends StatelessWidget {
  final String id;
  final String service;
  final IconData icon;
  final String statusLabel;
  final Color statusColor;
  final Color statusTextColor;
  final IconData statusIcon;
  final bool isLast;

  const _BookingRow({
    required this.id,
    required this.service,
    required this.icon,
    required this.statusLabel,
    required this.statusColor,
    required this.statusTextColor,
    required this.statusIcon,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(id, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.primary)),
              const SizedBox(height: 4),
              Row(children: [Icon(icon, size: 16, color: AppColors.onSurfaceVariant), const SizedBox(width: 4), Text(service, style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 14))]),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(color: statusColor, borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(statusIcon, size: 12, color: statusTextColor),
                const SizedBox(width: 4),
                Text(statusLabel, style: TextStyle(fontSize: 11, color: statusTextColor, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
