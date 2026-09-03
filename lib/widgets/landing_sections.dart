import 'package:flutter/material.dart';
import '../app/content.dart';
import '../core/app_colors.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'How SHRAMIK DISHA Works',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          const Text(
            'A transparent, reliable process connecting you with skilled professionals.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF44474E)),
          ),
          const SizedBox(height: 24),
          const _StepCard(
            icon: Icons.search,
            iconBackground: Color(0xFF002147),
            iconColor: Color(0xFF708AB5),
            title: '1. Search & Select',
            description: 'Find the service you need using our voice-enabled search or category browse.',
          ),
          const SizedBox(height: 16),
          const _StepCard(
            icon: Icons.verified_user_outlined,
            iconBackground: Color(0xFFFE9832),
            iconColor: Color(0xFF683700),
            title: '2. Match with Verified Members',
            description: 'We connect you with a cooperative member whose skills and background have been thoroughly verified via Aadhaar and internal checks.',
            trailing: _AadhaarChip(),
          ),
          const SizedBox(height: 16),
          const _StepCard(
            icon: Icons.handshake_outlined,
            iconBackground: Colors.white24,
            iconColor: Colors.white,
            title: '3. Service Delivered',
            description: 'The professional completes the task. Payment is secure and goes directly to support the cooperative community.',
            dark: true,
          ),
        ],
      ),
    );
  }
}

class _StepCard extends StatelessWidget {
  final IconData icon;
  final Color iconBackground;
  final Color iconColor;
  final String title;
  final String description;
  final Widget? trailing;
  final bool dark;

  const _StepCard({
    required this.icon,
    required this.iconBackground,
    required this.iconColor,
    required this.title,
    required this.description,
    this.trailing,
    this.dark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: dark ? AppColors.primary : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: dark ? AppColors.primary : const Color(0xFFE0E3E6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(color: iconBackground, shape: BoxShape.circle),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: dark ? Colors.white : const Color(0xFF191C1E),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              color: dark ? Colors.white70 : const Color(0xFF44474E),
              height: 1.4,
            ),
          ),
          if (trailing != null) ...[const SizedBox(height: 16), trailing!],
        ],
      ),
    );
  }
}

class _AadhaarChip extends StatelessWidget {
  const _AadhaarChip();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FC),
        border: Border.all(color: const Color(0xFFC4C6CF)),
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle, size: 18, color: Color(0xFF035300)),
          SizedBox(width: 6),
          Text('Aadhaar Verified', style: TextStyle(fontSize: 12, color: Color(0xFF44474E))),
        ],
      ),
    );
  }
}

class WhyCooperativeSection extends StatelessWidget {
  const WhyCooperativeSection({super.key});

  @override
  Widget build(BuildContext context) {
    const benefits = [
      (Icons.groups_outlined, 'Fair Compensation', "Unlike traditional aggregators, Sahyog ensures the lion's share of your payment goes directly to the worker, fostering economic stability."),
      (Icons.shield_outlined, 'Government Backed Security', 'Every professional is thoroughly vetted. The platform operates under strict government cooperative guidelines for your safety.'),
      (Icons.trending_up, 'Community Growth', 'By choosing Sahyog, you are directly investing in the upskilling and welfare of local service professionals.'),
    ];

    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: 1.5,
              child: Image.network(
                teamPhotoUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(color: const Color(0xFFE0E3E6)),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'THE SHRAMIK DISHA ADVANTAGE',
            style: TextStyle(color: AppColors.secondary, fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 1.2),
          ),
          const SizedBox(height: 8),
          Text('Why Choose a Cooperative Platform?', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 20),
          for (final benefit in benefits)
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(color: Color(0xFFECEEF1), shape: BoxShape.circle),
                    child: Icon(benefit.$1, color: AppColors.primary, size: 22),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(benefit.$2, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 4),
                        Text(benefit.$3, style: const TextStyle(color: Color(0xFF44474E), height: 1.4)),
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

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    const links = ['About Us', 'Terms of Service', 'Privacy Policy', 'Contact Support', 'Aadhaar Verification'];

    return Container(
      color: const Color(0xFFE6E8EB),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        children: [
          Text('SHRAMIK DISHA', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20)),
          const SizedBox(height: 8),
          const Text(
            '© 2026 SHRAMIK DISHA Cooperative Service. A Government-Backed Initiative.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Color(0xFF44474E)),
          ),
          const SizedBox(height: 20),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 8,
            children: links.map((link) => Text(link, style: const TextStyle(fontSize: 14, color: Color(0xFF44474E), decoration: TextDecoration.underline))).toList(),
          ),
        ],
      ),
    );
  }
}
