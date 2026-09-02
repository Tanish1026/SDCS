import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../app/content.dart';

class CategoryGrid extends StatelessWidget {
  final void Function(String label)? onCategoryTap;

  const CategoryGrid({super.key, this.onCategoryTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: SizedBox(
        height: 96,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: categories.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final category = categories[index];
            return InkWell(
              onTap: onCategoryTap == null
                  ? null
                  : () => onCategoryTap!(category.label),
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: 92,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFE0E3E6)),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(category.icon, color: AppColors.primary, size: 28),
                    const SizedBox(height: 8),
                    Text(
                      category.label,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}