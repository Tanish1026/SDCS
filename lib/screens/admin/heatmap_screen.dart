import 'dart:ui';
import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../../widgets/admin/admin_scaffold.dart';
import '../../widgets/admin/nav_items.dart';

class HeatmapScreen extends StatelessWidget {
  const HeatmapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      current: AdminSection.heatmap,
      title: 'Heatmaps',
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
        children: [
          const Text('Map & Heatmap', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.onSurface)),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.32,
              color: AppColors.surfaceContainer,
              child: Stack(
                children: [
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.surface.withValues(alpha: 0.85),
                        border: Border.all(color: AppColors.outlineVariant),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text('Region East District', style: TextStyle(fontSize: 11)),
                    ),
                  ),
                  const _HeatSpot(top: 0.20, left: 0.30, size: 80, color: Colors.red),
                  const _HeatSpot(top: 0.25, left: 0.38, size: 60, color: Colors.red),
                  const _HeatSpot(top: 0.55, left: 0.68, size: 60, color: Colors.amber),
                  const _HeatSpot(top: 0.40, left: 0.55, size: 90, color: Colors.green),
                  const _HeatSpot(top: 0.65, left: 0.18, size: 90, color: Colors.green),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppColors.surfaceContainerLowest, border: Border.all(color: AppColors.outlineVariant), borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Legend', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                const Divider(height: 20),
                const _LegendRow(color: Colors.red, label: 'High Demand'),
                const SizedBox(height: 10),
                const _LegendRow(color: Colors.amber, label: 'Moderate Demand'),
                const SizedBox(height: 10),
                const _LegendRow(color: AppColors.secondary, label: 'Low Demand / Available'),
                const Divider(height: 20),
                const Row(children: [Icon(Icons.warning_amber, color: AppColors.error, size: 18), SizedBox(width: 8), Text('Shortage Alert', style: TextStyle(color: AppColors.error, fontSize: 13, fontWeight: FontWeight.w600))]),
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
                const Text('Zone Summary', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                const Divider(height: 20),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(10),
                    border: const Border(left: BorderSide(color: Colors.red, width: 4)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Zone A', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(color: AppColors.errorContainer, borderRadius: BorderRadius.circular(20)),
                            child: const Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.trending_up, size: 13, color: AppColors.onErrorContainer), SizedBox(width: 4), Text('High Demand', style: TextStyle(fontSize: 11, color: AppColors.onErrorContainer))]),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Row(children: [Icon(Icons.warning_amber, color: AppColors.error, size: 16), SizedBox(width: 6), Text('Shortage: 13 Workers', style: TextStyle(fontSize: 12, color: AppColors.error, fontWeight: FontWeight.w600))]),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(10),
                    border: const Border(left: BorderSide(color: Colors.amber, width: 4)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Zone B', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(color: AppColors.surfaceVariant, borderRadius: BorderRadius.circular(20)),
                            child: const Text('Moderate Demand', style: TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Row(children: [Icon(Icons.check_circle_outline, color: AppColors.onSurfaceVariant, size: 16), SizedBox(width: 6), Text('Adequately Staffed', style: TextStyle(fontSize: 12, color: AppColors.onSurfaceVariant))]),
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

class _HeatSpot extends StatelessWidget {
  final double top;
  final double left;
  final double size;
  final Color color;

  const _HeatSpot({required this.top, required this.left, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment(left * 2 - 1, top * 2 - 1),
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color.withValues(alpha: 0.55)),
          ),
        ),
      ),
    );
  }
}

class _LegendRow extends StatelessWidget {
  final Color color;
  final String label;
  const _LegendRow({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(children: [Container(width: 14, height: 14, decoration: BoxDecoration(color: color, shape: BoxShape.circle)), const SizedBox(width: 10), Text(label, style: const TextStyle(fontSize: 14))]);
  }
}
