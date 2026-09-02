import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../../widgets/admin/admin_scaffold.dart';
import '../../widgets/admin/nav_items.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      current: AdminSection.bookings,
      title: 'Bookings',
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 96),
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search booking ID, customer, service...',
              prefixIcon: const Icon(Icons.search, color: AppColors.outline),
              filled: true,
              fillColor: AppColors.surface,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.outlineVariant)),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 36,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                _StatusPill('All', selected: true),
                SizedBox(width: 8),
                _StatusPill('Assigned'),
                SizedBox(width: 8),
                _StatusPill('En Route'),
                SizedBox(width: 8),
                _StatusPill('Completed'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Tracking #BK-9021', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.primary)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: AppColors.surfaceContainer, borderRadius: BorderRadius.circular(6)),
                      child: const Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.bolt, size: 14, color: AppColors.onSurfaceVariant), SizedBox(width: 4), Text('Electrical', style: TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant))]),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 76,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      _TimelineNode(label: 'Requested', time: '08:00', state: _NodeState.done, icon: Icons.check),
                      _TimelineNode(label: 'Confirmed', time: '08:15', state: _NodeState.done, icon: Icons.check),
                      _TimelineNode(label: 'Assigned', time: 'Current', state: _NodeState.current, icon: Icons.person),
                      _TimelineNode(label: 'En Route', time: '-', state: _NodeState.pending, icon: Icons.local_shipping),
                      _TimelineNode(label: 'Arrived', time: '-', state: _NodeState.pending, icon: Icons.location_on),
                      _TimelineNode(label: 'Started', time: '-', state: _NodeState.pending, icon: Icons.engineering),
                      _TimelineNode(label: 'Completed', time: '-', state: _NodeState.pending, icon: Icons.done_all),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: AppColors.surfaceBright, border: Border.all(color: AppColors.outlineVariant), borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.info_outline, color: AppColors.secondary, size: 20),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Worker Assigned: John Doe', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.primary)),
                            SizedBox(height: 2),
                            Text('Estimated arrival window: 14:00 - 15:00.', style: TextStyle(fontSize: 13, color: AppColors.onSurfaceVariant)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text("Today's Queue", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.onSurface)),
          const SizedBox(height: 8),
          const _QueueCard(
            id: '#BK-9021',
            title: 'Electrical Panel Inspect',
            time: '14:30',
            timeHighlighted: true,
            person: 'Amit Roy',
            location: '142 Sector V, Salt Lake',
            statusLabel: 'Assigned',
            statusColor: AppColors.secondary,
            accentBorder: true,
          ),
          const SizedBox(height: 10),
          const _QueueCard(
            id: '#BK-9022',
            title: 'HVAC Maintenance',
            time: '15:45',
            person: 'Sarah Jenkins',
            location: '88 Tech Park Blvd',
            statusLabel: 'Pending Assignment',
            statusColor: AppColors.tertiaryFixedDim,
            statusTextColor: AppColors.onTertiaryContainer,
          ),
          const SizedBox(height: 10),
          const Opacity(
            opacity: 0.75,
            child: _QueueCard(
              id: '#BK-9018',
              title: 'Plumbing Leak Repair',
              time: '09:15',
              person: 'David Chen',
              location: 'Unit 4, Riverside Apts',
              statusLabel: 'Completed',
              statusColor: AppColors.outline,
              statusTextColor: AppColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  final String label;
  final bool selected;
  const _StatusPill(this.label, {this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? AppColors.primary : AppColors.surface,
        border: selected ? null : Border.all(color: AppColors.outlineVariant),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: TextStyle(color: selected ? Colors.white : AppColors.onSurfaceVariant, fontSize: 13, fontWeight: FontWeight.w500)),
    );
  }
}

enum _NodeState { done, current, pending }

class _TimelineNode extends StatelessWidget {
  final String label;
  final String time;
  final _NodeState state;
  final IconData icon;

  const _TimelineNode({required this.label, required this.time, required this.state, required this.icon});

  @override
  Widget build(BuildContext context) {
    final bool active = state != _NodeState.pending;
    return Container(
      width: 84,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: active ? AppColors.secondary : AppColors.surface,
              border: active ? null : Border.all(color: AppColors.outlineVariant, width: 2),
              boxShadow: state == _NodeState.current ? [BoxShadow(color: AppColors.secondaryContainer, blurRadius: 0, spreadRadius: 4)] : null,
            ),
            child: Icon(icon, size: 16, color: active ? Colors.white : AppColors.outlineVariant),
          ),
          const SizedBox(height: 6),
          Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 11, fontWeight: state == _NodeState.current ? FontWeight.bold : FontWeight.normal, color: state == _NodeState.current ? AppColors.primary : AppColors.onSurface)),
          Text(time, style: const TextStyle(fontSize: 10, color: AppColors.outline)),
        ],
      ),
    );
  }
}

class _QueueCard extends StatelessWidget {
  final String id;
  final String title;
  final String time;
  final bool timeHighlighted;
  final String person;
  final String location;
  final String statusLabel;
  final Color statusColor;
  final Color? statusTextColor;
  final bool accentBorder;

  const _QueueCard({
    required this.id,
    required this.title,
    required this.time,
    this.timeHighlighted = false,
    required this.person,
    required this.location,
    required this.statusLabel,
    required this.statusColor,
    this.statusTextColor,
    this.accentBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
        border: accentBorder
            ? const Border(
                left: BorderSide(color: AppColors.secondary, width: 4),
                top: BorderSide(color: AppColors.outlineVariant),
                right: BorderSide(color: AppColors.outlineVariant),
                bottom: BorderSide(color: AppColors.outlineVariant),
              )
            : Border.all(color: AppColors.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(color: AppColors.surfaceContainer, borderRadius: BorderRadius.circular(4)),
                      child: Text(id, style: const TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant)),
                    ),
                    const SizedBox(height: 6),
                    Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.primary)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: timeHighlighted ? AppColors.secondaryContainer : AppColors.surfaceContainer, borderRadius: BorderRadius.circular(6)),
                child: Row(mainAxisSize: MainAxisSize.min, children: [const Icon(Icons.schedule, size: 13, color: AppColors.onSurfaceVariant), const SizedBox(width: 4), Text(time, style: TextStyle(fontSize: 12, fontWeight: timeHighlighted ? FontWeight.bold : FontWeight.normal, color: timeHighlighted ? AppColors.onSecondaryContainer : AppColors.onSurfaceVariant))]),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [const Icon(Icons.person_outline, size: 16, color: AppColors.onSurfaceVariant), const SizedBox(width: 6), Text(person, style: const TextStyle(fontSize: 13, color: AppColors.onSurfaceVariant))]),
                  const SizedBox(height: 4),
                  Row(children: [const Icon(Icons.location_on_outlined, size: 16, color: AppColors.onSurfaceVariant), const SizedBox(width: 6), Flexible(child: Text(location, style: const TextStyle(fontSize: 13, color: AppColors.onSurfaceVariant)))]),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(width: 8, height: 8, decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle)),
                  const SizedBox(width: 6),
                  Text(statusLabel, style: TextStyle(fontSize: 12, color: statusTextColor ?? statusColor, fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
