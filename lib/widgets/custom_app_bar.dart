import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/app_colors.dart';
import '../app/content.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(44);

  void _handleLogin(BuildContext context) {
    context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 768;

    return AppBar(
      backgroundColor: AppColors.surface,
      elevation: 1,
      titleSpacing: 24,
      title: Row(
        children: [
          SizedBox(
            width: 36,
            height: 36,
            child: Image.asset(
              logoAssetPath,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'SDCS',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
      actions: [
        if (isDesktop)
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryContainer,
                  foregroundColor: AppColors.onSecondaryContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  minimumSize: const Size(112, 36),
                ),
                onPressed: () => _handleLogin(context),
                child: const Text(
                  'Login/Sign-up', 
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        else
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: const Icon(Icons.person, color: AppColors.primary, size: 26),
                onPressed: () => _handleLogin(context),
              ),
            ),
          )
      ],
    );
  }
}