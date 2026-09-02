import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../../widgets/admin/admin_scaffold.dart';
import '../../widgets/admin/nav_items.dart';

class WorkersScreen extends StatelessWidget {
  const WorkersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      current: AdminSection.workers,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Workers Management', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.primary)),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                icon: const Icon(Icons.add, size: 18),
                label: const Text('Add'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              border: Border.all(color: AppColors.outlineVariant),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search workers by name or ID...',
                    prefixIcon: const Icon(Icons.search, color: AppColors.outline),
                    filled: true,
                    fillColor: AppColors.surfaceBright,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: AppColors.outlineVariant)),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 36,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      _FilterChip('Skill'),
                      SizedBox(width: 8),
                      _FilterChip('Availability'),
                      SizedBox(width: 8),
                      _FilterChip('Verification'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const _WorkerCard(
            name: 'Rahul Das',
            role: 'Plumber • ID: WK-2849',
            badgeLabel: 'Verified',
            badgeColor: AppColors.secondaryContainer,
            badgeTextColor: AppColors.onSecondaryContainer,
            badgeIcon: Icons.check_circle,
            availability: 'Available Today',
            availabilityIcon: Icons.event_available,
            availabilityColor: AppColors.secondary,
            workloadPercent: 0.4,
            workloadLabel: 'Moderate',
            workloadColor: AppColors.primary,
            primaryActionLabel: 'Assign Work',
          ),
          const SizedBox(height: 12),
          const _WorkerCard(
            name: 'Sarah Jenkins',
            role: 'Electrician • ID: WK-2850',
            badgeLabel: 'Pending',
            badgeColor: AppColors.errorContainer,
            badgeTextColor: AppColors.onErrorContainer,
            badgeIcon: Icons.error,
            availability: 'Unavailable (On Site)',
            availabilityIcon: Icons.event_busy,
            availabilityColor: AppColors.onSurfaceVariant,
            workloadPercent: 0.85,
            workloadLabel: 'Heavy',
            workloadColor: AppColors.error,
            primaryActionLabel: 'Verify',
            primaryFilled: true,
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  const _FilterChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        border: Border.all(color: AppColors.outlineVariant),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: const TextStyle(fontSize: 13, color: AppColors.onSurface)),
          const SizedBox(width: 4),
          const Icon(Icons.expand_more, size: 16, color: AppColors.onSurface),
        ],
      ),
    );
  }
}

class _WorkerCard extends StatelessWidget {
  final String name;
  final String role;
  final String badgeLabel;
  final Color badgeColor;
  final Color badgeTextColor;
  final IconData badgeIcon;
  final String availability;
  final IconData availabilityIcon;
  final Color availabilityColor;
  final double workloadPercent;
  final String workloadLabel;
  final Color workloadColor;
  final String primaryActionLabel;
  final bool primaryFilled;

  const _WorkerCard({
    required this.name,
    required this.role,
    required this.badgeLabel,
    required this.badgeColor,
    required this.badgeTextColor,
    required this.badgeIcon,
    required this.availability,
    required this.availabilityIcon,
    required this.availabilityColor,
    required this.workloadPercent,
    required this.workloadLabel,
    required this.workloadColor,
    required this.primaryActionLabel,
    this.primaryFilled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.outlineVariant),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(10)),
                child: const Icon(Icons.person, color: AppColors.onSurfaceVariant, size: 28),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.primary))),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(color: badgeColor, borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(badgeIcon, size: 12, color: badgeTextColor),
                              const SizedBox(width: 4),
                              Text(badgeLabel, style: TextStyle(fontSize: 11, color: badgeTextColor, fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(role, style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 13)),
                    const SizedBox(height: 8),
                    Row(children: [Icon(availabilityIcon, size: 16, color: availabilityColor), const SizedBox(width: 6), Text(availability, style: TextStyle(color: availabilityColor == AppColors.secondary ? AppColors.onSurface : AppColors.onSurfaceVariant, fontSize: 13))]),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Workload (${(workloadPercent * 100).round()}%)', style: const TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant)),
                        Text(workloadLabel, style: TextStyle(fontSize: 11, color: workloadColor == AppColors.error ? AppColors.error : AppColors.onSurface)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: workloadPercent,
                        minHeight: 6,
                        backgroundColor: AppColors.surfaceContainerHighest,
                        valueColor: AlwaysStoppedAnimation(workloadColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(side: const BorderSide(color: AppColors.outlineVariant), foregroundColor: AppColors.onSurface),
                  child: const Text('View Profile'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: primaryFilled
                    ? ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white),
                        child: Text(primaryActionLabel),
                      )
                    : ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.surfaceVariant, foregroundColor: AppColors.primary, elevation: 0),
                        child: Text(primaryActionLabel, style: const TextStyle(fontWeight: FontWeight.w600)),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
