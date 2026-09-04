import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/hero_slider.dart';
import '../widgets/category_grid.dart';
import '../widgets/landing_sections.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  void _showComingSoon(BuildContext context, String label) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$label - coming soon')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              const HeroSlider(),
              CategoryGrid(
                onCategoryTap: (label) => _showComingSoon(context, label),
              ),
              HowItWorksSection(),
              const WhyCooperativeSection(),
              const FooterSection(),
              const SizedBox(height: 0),
            ],
        ),
      ),
    );
  }
}