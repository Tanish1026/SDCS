import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../../widgets/admin/admin_scaffold.dart';
import '../../widgets/admin/nav_items.dart';

class AllocationScreen extends StatelessWidget {
  const AllocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      current: AdminSection.allocation,
      title: 'Allocation',
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
        children: [
          const Text('Workforce Allocation', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.primary)),
          const SizedBox(height: 4),
          const Text('Review AI-suggested workforce transfers to resolve critical shortages.', style: TextStyle(color: AppColors.onSurfaceVariant)),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppColors.surfaceContainerLowest, border: Border.all(color: AppColors.outlineVariant), borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Zone A', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.onSurface)),
                    SizedBox(height: 2),
                    Text('CRITICAL SHORTAGE', style: TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant, letterSpacing: 1)),
                  ],
                ),
                Row(
                  children: [
                    const Column(children: [Text('12', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: AppColors.error)), Text('Available', style: TextStyle(fontSize: 12, color: AppColors.onSurfaceVariant))]),
                    Container(width: 1, height: 32, color: AppColors.outlineVariant, margin: const EdgeInsets.symmetric(horizontal: 16)),
                    const Column(children: [Text('25', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: AppColors.primary)), Text('Required', style: TextStyle(fontSize: 12, color: AppColors.onSurfaceVariant))]),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(color: AppColors.surfaceContainerLowest, border: Border.all(color: AppColors.primary), borderRadius: BorderRadius.circular(16)),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: AppColors.primary,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(children: [Icon(Icons.auto_awesome, size: 16, color: Colors.white), SizedBox(width: 8), Text('AI RECOMMENDATION', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 1))]),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: AppColors.tertiaryFixed, borderRadius: BorderRadius.circular(20)),
                        child: const Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.person, size: 12, color: AppColors.onTertiaryFixed), SizedBox(width: 4), Text('Approval Required', style: TextStyle(fontSize: 10, color: AppColors.onTertiaryFixed))]),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Transfer 5 available plumbers from Zone B to Zone A', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: AppColors.primary)),
                      const SizedBox(height: 8),
                      const Text('This action balances the critical deficit in Zone A while keeping Zone B within operational safety margins.', style: TextStyle(color: AppColors.onSurfaceVariant, height: 1.4)),
                      const SizedBox(height: 20),
                      const Text('WHY THIS RECOMMENDATION?', style: TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant, letterSpacing: 1)),
                      const SizedBox(height: 8),
                      const _CheckLine('100% Skill match (Plumbers)'),
                      const _CheckLine('Optimal Travel Distance (2.4 miles)'),
                      const _CheckLine('Maintains Fair Distribution in Zone B'),
                      const SizedBox(height: 20),
                      const Text('SUGGESTED PERSONNEL', style: TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant, letterSpacing: 1)),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(border: Border.all(color: AppColors.outlineVariant), borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: const [
                            _PersonRow(initials: 'RD', name: 'Rahul Das', role: 'Senior Plumber', match: '92% Match'),
                            Divider(height: 1),
                            _PersonRow(initials: 'AR', name: 'Amit Roy', role: 'Plumber', match: '89% Match'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextButton(onPressed: () {}, child: const Text('View 3 more workers')),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: const BoxDecoration(color: AppColors.surface, border: Border(top: BorderSide(color: AppColors.outlineVariant))),
                  // FIX: OverflowBar dynamically stacks buttons if the screen is too narrow
                  child: OverflowBar(
                    alignment: MainAxisAlignment.end,
                    spacing: 12,
                    overflowSpacing: 12,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.error, 
                          side: const BorderSide(color: AppColors.error),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                        child: const Text('Reject'),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.onSurface, 
                          side: const BorderSide(color: AppColors.outlineVariant),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                        child: const Text('Modify'),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary, 
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                        icon: const Icon(Icons.check, size: 18),
                        label: const Text('Approve'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CheckLine extends StatelessWidget {
  final String text;
  const _CheckLine(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(children: [const Icon(Icons.check_circle, size: 18, color: AppColors.secondary), const SizedBox(width: 8), Expanded(child: Text(text, style: const TextStyle(color: AppColors.onSurface, fontSize: 14)))]),
    );
  }
}

class _PersonRow extends StatelessWidget {
  final String initials;
  final String name;
  final String role;
  final String match;

  const _PersonRow({required this.initials, required this.name, required this.role, required this.match});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 16, backgroundColor: AppColors.primaryContainer, child: Text(initials, style: const TextStyle(color: AppColors.onPrimaryContainer, fontSize: 12, fontWeight: FontWeight.w700))),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.onSurface)),
                  Text(role, style: const TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant)),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(color: AppColors.secondaryContainer, borderRadius: BorderRadius.circular(6)),
            child: Text(match, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.onSecondaryContainer)),
          ),
        ],
      ),
    );
  }
}