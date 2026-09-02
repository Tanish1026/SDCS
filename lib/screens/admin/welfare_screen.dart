import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../../widgets/admin/admin_scaffold.dart';
import '../../widgets/admin/nav_items.dart';

class WelfareScreen extends StatelessWidget {
  const WelfareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      current: AdminSection.welfare,
      title: 'Welfare',
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
        children: [
          const Text('Worker Welfare', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.onBackground)),
          const SizedBox(height: 4),
          const Text('Monitor compliance and support programs.', style: TextStyle(color: AppColors.onSurfaceVariant)),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppColors.surfaceContainerLowest, border: Border.all(color: AppColors.outlineVariant), borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('WORKERS COVERED', style: TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant, letterSpacing: 1)),
                    Icon(Icons.shield_outlined, color: AppColors.secondary, size: 20),
                  ],
                ),
                const SizedBox(height: 6),
                const Text('1,240', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: AppColors.primary)),
                const SizedBox(height: 4),
                const Row(children: [Icon(Icons.trending_up, size: 16, color: AppColors.secondary), SizedBox(width: 4), Text('+4% this month', style: TextStyle(fontSize: 12, color: AppColors.secondary))]),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: AppColors.surfaceContainerLowest, border: Border.all(color: AppColors.outlineVariant), borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('ACTIVE INSURANCE', style: TextStyle(fontSize: 10, color: AppColors.onSurfaceVariant, letterSpacing: 1)),
                      const SizedBox(height: 6),
                      const Text('98%', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.primary)),
                      const SizedBox(height: 8),
                      ClipRRect(borderRadius: BorderRadius.circular(4), child: const LinearProgressIndicator(value: 0.98, minHeight: 4, backgroundColor: AppColors.surfaceVariant, valueColor: AlwaysStoppedAnimation(AppColors.secondary))),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: AppColors.errorContainer, borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Expanded(child: Text('NEEDS ATTENTION', style: TextStyle(fontSize: 10, color: AppColors.onErrorContainer, letterSpacing: 1))),
                          Icon(Icons.warning_amber, color: AppColors.error, size: 18),
                        ],
                      ),
                      const SizedBox(height: 6),
                      const Text('15', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.onErrorContainer)),
                      const Text('Expiring policies', style: TextStyle(fontSize: 11, color: AppColors.onErrorContainer)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text('Action Required', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(color: AppColors.surfaceContainerLowest, border: Border.all(color: AppColors.outlineVariant), borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: const [
                _ActionRow(initials: 'RD', color: AppColors.tertiaryFixedDim, name: 'Rahul Das', note: 'Insurance: 12 days left', noteColor: AppColors.tertiaryContainer, noteIcon: Icons.schedule),
                Divider(height: 1),
                _ActionRow(initials: 'AM', color: AppColors.tertiaryFixed, name: 'Amit Mishra', note: 'Visa: Expiring tomorrow', noteColor: AppColors.error, noteIcon: Icons.error_outline),
                Divider(height: 1),
                _ActionRow(initials: 'SK', color: AppColors.surfaceContainerHigh, name: 'Sunil Kumar', note: 'Training: 14 days left', noteColor: AppColors.tertiaryContainer, noteIcon: Icons.schedule, isLast: true),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text('Program Summaries', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppColors.surfaceContainerLowest, border: Border.all(color: AppColors.outlineVariant), borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Container(width: 32, height: 32, decoration: BoxDecoration(color: AppColors.primaryContainer, borderRadius: BorderRadius.circular(6)), child: const Icon(Icons.account_balance_outlined, color: AppColors.onPrimaryContainer, size: 18)),
                  const SizedBox(width: 10),
                  const Text('Contributions', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.primary)),
                ]),
                const SizedBox(height: 12),
                _SummaryLine('YTD Provident Fund', '\$45,200'),
                const Divider(height: 20),
                _SummaryLine('Pending Transfers', '3 Batches', valueColor: AppColors.tertiaryContainer),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppColors.surfaceContainerLowest, border: Border.all(color: AppColors.outlineVariant), borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Container(width: 32, height: 32, decoration: BoxDecoration(color: AppColors.secondaryContainer, borderRadius: BorderRadius.circular(6)), child: const Icon(Icons.medical_services_outlined, color: AppColors.onSecondaryContainer, size: 18)),
                  const SizedBox(width: 10),
                  const Text('Benefits & Health', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.primary)),
                ]),
                const SizedBox(height: 12),
                _SummaryLine('Claims Processed', '142'),
                const Divider(height: 20),
                _SummaryLine('Upcoming Health Camps', 'Site B (Nov 12)'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionRow extends StatelessWidget {
  final String initials;
  final Color color;
  final String name;
  final String note;
  final Color noteColor;
  final IconData noteIcon;
  final bool isLast;

  const _ActionRow({
    required this.initials,
    required this.color,
    required this.name,
    required this.note,
    required this.noteColor,
    required this.noteIcon,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 18, backgroundColor: color, child: Text(initials, style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.onTertiaryFixed))),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 2),
                  Row(children: [Icon(noteIcon, size: 13, color: noteColor), const SizedBox(width: 4), Text(note, style: TextStyle(fontSize: 12, color: noteColor))]),
                ],
              ),
            ],
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(foregroundColor: AppColors.primary, side: const BorderSide(color: AppColors.outlineVariant), padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6)),
            child: const Text('View', style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}

class _SummaryLine extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;
  const _SummaryLine(this.label, this.value, {this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 13)),
        Text(value, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: valueColor ?? AppColors.onBackground)),
      ],
    );
  }
}
