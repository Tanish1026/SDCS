import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 768;

    return AppBar(
      backgroundColor: AppColors.surface,
      elevation: 1,
      title: Row(
        children: [
          const Icon(Icons.shield, color: AppColors.primary, size: 32),
          const SizedBox(width: 12),
          const Text(
            'SDCS',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          if (isDesktop) ...[
            const Spacer(),
            Expanded(
              flex: 2,
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'What service do you need?',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.mic, color: AppColors.primary),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ],
      ),
      actions: [
        if (isDesktop)
          Padding(
            padding: const EdgeInsets.only(right: 24.0, top: 12, bottom: 12),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryContainer,
                foregroundColor: AppColors.onSecondaryContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                elevation: 0,
              ),
              onPressed: () {
                context.push('/login');
              },
              child: const Text('Login/Sign-up', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          )
        else
          IconButton(
            icon: const Icon(Icons.person, color: AppColors.primary),
            onPressed: () {},
          )
      ],
    );
  }
}