import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../../widgets/admin/admin_scaffold.dart';
import '../../widgets/admin/nav_items.dart';
class AuditLogsScreen extends StatelessWidget {
  const AuditLogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      current: AdminSection.auditLogs,
      title: 'Audit Logs',
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
        children: [
          const Text('Audit Logs', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.primary)),
          const SizedBox(height: 4),
          const Text('System-wide chronological tracking of administrative actions and data modifications.', style: TextStyle(color: AppColors.onSurfaceVariant)),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _FilterDropdown(label: 'Filter by Module', icon: Icons.category_outlined, options: const ['All Modules', 'Workforce Allocation', 'User Management', 'Welfare'])),
              const SizedBox(width: 12),
              Expanded(child: _FilterDropdown(label: 'Filter by User', icon: Icons.person_outline, options: const ['All Users', 'Union Head', 'Manager', 'System Auto'])),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(color: AppColors.surfaceContainerLowest, border: Border.all(color: AppColors.outlineVariant), borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: const [
                _LogEntry(
                  icon: Icons.swap_horiz,
                  iconBg: AppColors.surfaceContainer,
                  iconColor: AppColors.primary,
                  actor: 'Union Head',
                  time: '10:42 AM',
                  description: 'Approved workforce allocation Zone B \u2192 Zone A',
                  moduleTag: 'Module: Allocation',
                  actionTag: 'Action: Approve',
                  actionTagColor: AppColors.secondaryContainer,
                  actionTagTextColor: AppColors.onSecondaryContainer,
                ),
                Divider(height: 1),
                _LogEntry(
                  icon: Icons.verified_user_outlined,
                  iconBg: AppColors.surfaceContainer,
                  iconColor: AppColors.primary,
                  actor: 'Manager',
                  time: '09:54 AM',
                  description: 'Verified worker identity credentials: Amit Roy',
                  moduleTag: 'Module: Workers',
                  actionTag: 'Action: Verify',
                  actionTagColor: AppColors.secondaryContainer,
                  actionTagTextColor: AppColors.onSecondaryContainer,
                ),
                Divider(height: 1),
                _LogEntry(
                  icon: Icons.warning_amber,
                  iconBg: AppColors.errorContainer,
                  iconColor: AppColors.error,
                  actor: 'System Auto',
                  time: '08:30 AM',
                  description: 'Flagged consecutive shift violation for Team Delta',
                  moduleTag: 'Module: Welfare',
                  actionTag: 'Action: Alert',
                  actionTagColor: AppColors.errorContainer,
                  actionTagTextColor: AppColors.onErrorContainer,
                  isLast: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterDropdown extends StatefulWidget {
  final String label;
  final IconData icon;
  final List<String> options;

  const _FilterDropdown({required this.label, required this.icon, required this.options});

  @override
  State<_FilterDropdown> createState() => _FilterDropdownState();
}

class _FilterDropdownState extends State<_FilterDropdown> {
  late String _value = widget.options.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: const TextStyle(fontSize: 12, color: AppColors.onSurface)),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(border: Border.all(color: AppColors.outlineVariant), borderRadius: BorderRadius.circular(8)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _value,
              isExpanded: true,
              icon: const Icon(Icons.expand_more, size: 18),
              items: widget.options.map((o) => DropdownMenuItem(value: o, child: Row(children: [Icon(widget.icon, size: 16, color: AppColors.outline), const SizedBox(width: 8), Flexible(child: Text(o, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13)))]))).toList(),
              onChanged: (v) => setState(() => _value = v!),
            ),
          ),
        ),
      ],
    );
  }
}

class _LogEntry extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String actor;
  final String time;
  final String description;
  final String moduleTag;
  final String actionTag;
  final Color actionTagColor;
  final Color actionTagTextColor;
  final bool isLast;

  const _LogEntry({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.actor,
    required this.time,
    required this.description,
    required this.moduleTag,
    required this.actionTag,
    required this.actionTagColor,
    required this.actionTagTextColor,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 20, backgroundColor: iconBg, child: Icon(icon, color: iconColor, size: 20)),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(actor, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.primary)),
                    Text(time, style: const TextStyle(fontSize: 11, color: AppColors.outline)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(description, style: const TextStyle(fontSize: 13, color: AppColors.onSurfaceVariant, height: 1.3)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: [
                    Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: AppColors.surfaceVariant, borderRadius: BorderRadius.circular(4)), child: Text(moduleTag, style: const TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant))),
                    Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: actionTagColor, borderRadius: BorderRadius.circular(4)), child: Text(actionTag, style: TextStyle(fontSize: 11, color: actionTagTextColor))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
