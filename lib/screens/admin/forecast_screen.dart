import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../../widgets/admin/admin_scaffold.dart';
import '../../widgets/admin/nav_items.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      current: AdminSection.forecast,
      title: 'Forecast',
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
        children: [
          const Text('Demand Forecast', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.primary)),
          const SizedBox(height: 4),
          const Text('Anticipated service requests for the upcoming week based on historical data and current trends.', style: TextStyle(color: AppColors.onSurfaceVariant)),
          const SizedBox(height: 16),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                _ServiceChip('All Services', selected: true),
                SizedBox(width: 8),
                _ServiceChip('Plumbing'),
                SizedBox(width: 8),
                _ServiceChip('Electrical'),
                SizedBox(width: 8),
                _ServiceChip('HVAC'),
                SizedBox(width: 8),
                _ServiceChip('Carpentry'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(
                child: _ForecastCard(
                  icon: Icons.plumbing,
                  service: 'Plumbing',
                  zone: 'Zone A',
                  value: '45',
                  trend: '+12% vs last week',
                  trendUp: true,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _ForecastCard(
                  icon: Icons.electrical_services,
                  service: 'Electrical',
                  zone: 'Zone B',
                  value: '62',
                  trend: '-5% vs last week',
                  trendUp: false,
                ),
              ),
            ],
          ),
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
                    Text('Weekly Trend Overview', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.primary)),
                    Icon(Icons.more_vert, color: AppColors.onSurfaceVariant),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(color: AppColors.secondaryContainer.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(8)),
                  child: const Row(children: [Icon(Icons.trending_up, color: AppColors.secondary, size: 18), SizedBox(width: 8), Expanded(child: Text('Demand increased by 23% compared with last week.', style: TextStyle(color: AppColors.secondary, fontSize: 13)))]),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 180,
                  child: CustomPaint(
                    painter: _TrendLinePainter(),
                    child: Container(
                      decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(8)),
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Mon', style: TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant)),
                          Text('Sun', style: TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant)),
                        ],
                      ),
                    ),
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

class _ServiceChip extends StatelessWidget {
  final String label;
  final bool selected;
  const _ServiceChip(this.label, {this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? AppColors.primary : AppColors.surface,
        border: selected ? null : Border.all(color: AppColors.outlineVariant),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: TextStyle(color: selected ? Colors.white : AppColors.onSurface, fontSize: 13)),
    );
  }
}

class _ForecastCard extends StatelessWidget {
  final IconData icon;
  final String service;
  final String zone;
  final String value;
  final String trend;
  final bool trendUp;

  const _ForecastCard({
    required this.icon,
    required this.service,
    required this.zone,
    required this.value,
    required this.trend,
    required this.trendUp,
  });

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
              Row(children: [Icon(icon, color: AppColors.primary, size: 18), const SizedBox(width: 6), Flexible(child: Text(service, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.onSurface)))]),
              Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: AppColors.surfaceContainerHigh, borderRadius: BorderRadius.circular(4)), child: Text(zone, style: const TextStyle(fontSize: 10, color: AppColors.onSurfaceVariant))),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(value, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: AppColors.primary)),
              const SizedBox(width: 6),
              const Padding(padding: EdgeInsets.only(bottom: 4), child: Text('predicted', style: TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant))),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(trendUp ? Icons.arrow_upward : Icons.arrow_downward, size: 14, color: trendUp ? AppColors.secondary : AppColors.error),
              const SizedBox(width: 4),
              Expanded(child: Text(trend, style: TextStyle(fontSize: 11, color: trendUp ? AppColors.secondary : AppColors.error), overflow: TextOverflow.ellipsis)),
            ],
          ),
        ],
      ),
    );
  }
}

/// Simple decorative trend line, standing in for the small inline SVG path
/// in the source HTML.
class _TrendLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(0, size.height * 0.8)
      ..quadraticBezierTo(size.width * 0.2, size.height * 0.7, size.width * 0.4, size.height * 0.5)
      ..quadraticBezierTo(size.width * 0.6, size.height * 0.35, size.width * 0.7, size.height * 0.3)
      ..quadraticBezierTo(size.width * 0.85, size.height * 0.2, size.width, size.height * 0.1);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
