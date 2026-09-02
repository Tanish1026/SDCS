import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../../widgets/admin/admin_scaffold.dart';
import '../../widgets/admin/nav_items.dart';

class RolesScreen extends StatefulWidget {
  const RolesScreen({super.key});

  @override
  State<RolesScreen> createState() => _RolesScreenState();
}

class _RolesScreenState extends State<RolesScreen> {
  // permissions[module][role] = granted?
  final Map<String, Map<String, bool>> _permissions = {
    'Worker Management': {'Manager': true, 'Deputy Manager': true, 'Worker Assistant': false},
    'Verification': {'Manager': true, 'Deputy Manager': false, 'Worker Assistant': false},
    'Allocation Approval': {'Manager': true, 'Deputy Manager': true, 'Worker Assistant': false},
  };

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      current: AdminSection.roles,
      title: 'Roles',
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
        children: [
          const Text('Manage role configurations and access control levels for all personnel within your organization.', style: TextStyle(color: AppColors.onSurfaceVariant)),
          const SizedBox(height: 20),
          const Text('Active Roles', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.primary)),
          const SizedBox(height: 12),
          _RoleCard(icon: Icons.admin_panel_settings_outlined, name: 'Manager', tag: 'Admin', users: 12),
          const SizedBox(height: 10),
          const _RoleCard(icon: Icons.manage_accounts_outlined, name: 'Deputy Manager', tag: 'Elevated', users: 34),
          const SizedBox(height: 10),
          const _RoleCard(icon: Icons.support_agent_outlined, name: 'Worker Assistant', tag: 'Standard', users: 128),
          const SizedBox(height: 24),
          const Text('Global Permissions Matrix', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.primary)),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(color: AppColors.surfaceContainerLowest, border: Border.all(color: AppColors.outlineVariant), borderRadius: BorderRadius.circular(12)),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: _permissions.entries.map((moduleEntry) {
                final isLast = moduleEntry.key == _permissions.keys.last;
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(border: isLast ? null : const Border(bottom: BorderSide(color: AppColors.outlineVariant))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(moduleEntry.key, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                      const SizedBox(height: 8),
                      ...moduleEntry.value.keys.map((role) {
                        final granted = moduleEntry.value[role]!;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(role, style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 13)),
                              Switch(
                                value: granted,
                                activeThumbColor: AppColors.primary,
                                onChanged: (v) => setState(() => moduleEntry.value[role] = v),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Changes saved')));
              },
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 16)),
              child: const Text('Save Changes'),
            ),
          ),
        ],
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  final IconData icon;
  final String name;
  final String tag;
  final int users;

  const _RoleCard({required this.icon, required this.name, required this.tag, required this.users});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.surfaceContainerLowest, border: Border.all(color: AppColors.outlineVariant), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [Icon(icon, color: AppColors.primary), const SizedBox(width: 8), Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.primary))]),
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: AppColors.surfaceVariant, borderRadius: BorderRadius.circular(20)), child: Text(tag, style: const TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant))),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Assigned Users', style: TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant)),
                  Text('$users', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(foregroundColor: AppColors.primary, side: const BorderSide(color: AppColors.outlineVariant)),
                child: const Text('Edit'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
