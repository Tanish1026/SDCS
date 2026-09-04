import 'dart:async';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app/content.dart';
import '../app/theme.dart';
import '../core/services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _showComingSoon(BuildContext context, String label) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$label — coming soon'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _goToLogin(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _TopBar(
        onLogoTap: () => _showComingSoon(context, 'Menu'),
        onSearchTap: () => _showComingSoon(context, 'Search'),
        onLoginTap: () => _goToLogin(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HeroSlider(),
            CategoryChipsSection(
              onCategoryTap: (label) => _showComingSoon(context, label),
            ),
            const HowItWorksSection(),
            const WhyCooperativeSection(),
            const FooterSection(),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onLogoTap;
  final VoidCallback onSearchTap;
  final VoidCallback onLoginTap;

  const _TopBar({
    required this.onLogoTap,
    required this.onSearchTap,
    required this.onLoginTap,
  });

  static const double _barHeight = 52;

  @override
  Size get preferredSize => const Size.fromHeight(_barHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.surface,
      elevation: 0.5,
      shadowColor: Colors.black12,
      toolbarHeight: _barHeight,
      titleSpacing: 12,
      title: Row(
        children: [
          GestureDetector(
            onTap: onLogoTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                logoUrl,
                height: 28,
                width: 28,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    color: AppColors.primaryContainer,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(Icons.handyman, color: Colors.white, size: 14),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'SDCS',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 16),
          ),
        ],
      ),
      actions: [
        IconButton(
          tooltip: 'Search services',
          onPressed: onSearchTap,
          iconSize: 20,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
          icon: const Icon(Icons.search, color: AppColors.onSurfaceVariant),
        ),
        const SizedBox(width: 4),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: TextButton.icon(
            onPressed: onLoginTap,
            style: TextButton.styleFrom(
              backgroundColor: AppColors.secondaryContainer,
              foregroundColor: AppColors.onSecondaryContainer,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            icon: const Icon(Icons.person_outline, size: 15),
            label: const Text('Login', style: TextStyle(fontSize: 13)),
          ),
        ),
      ],
    );
  }
}

class HeroSlider extends StatefulWidget {
  const HeroSlider({super.key});

  @override
  State<HeroSlider> createState() => _HeroSliderState();
}

class _HeroSliderState extends State<HeroSlider> {
  final PageController _controller = PageController();
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (!_controller.hasClients) return;
      final next = (_currentPage + 1) % heroSlides.length;
      _controller.animateToPage(
        next,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void _goTo(int index) {
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    _startAutoPlay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: heroSlides.length,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, index) => _HeroSlideCard(slide: heroSlides[index]),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(heroSlides.length, (index) {
                final active = index == _currentPage;
                return GestureDetector(
                  onTap: () => _goTo(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: active ? AppColors.secondary : Colors.white.withValues(alpha: 0.5),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroSlideCard extends StatelessWidget {
  final HeroSlide slide;
  const _HeroSlideCard({required this.slide});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          slide.imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(color: AppColors.surfaceVariant),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                AppColors.primaryContainer.withValues(alpha: 0.8),
                Colors.transparent,
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      slide.tag,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    slide.title,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    slide.subtitle,
                    style: const TextStyle(color: Colors.white70, fontSize: 15, height: 1.5),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondaryContainer,
                      foregroundColor: AppColors.onSecondaryContainer,
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                      elevation: 3,
                    ),
                    child: Text(
                      slide.ctaLabel,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryChipsSection extends StatelessWidget {
  final void Function(String label) onCategoryTap;
  const CategoryChipsSection({super.key, required this.onCategoryTap});

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
              onTap: () => onCategoryTap(category.label),
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: 92,
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLowest,
                  border: Border.all(color: AppColors.surfaceVariant),
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

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
            style: TextStyle(color: AppColors.onSurfaceVariant),
          ),
          const SizedBox(height: 24),
          const _StepCard(
            icon: Icons.search,
            iconBg: AppColors.primaryContainer,
            iconColor: AppColors.onPrimaryContainer,
            title: '1. Search & Select',
            description:
                'Find the service you need using our voice-enabled search or category browse.',
          ),
          const SizedBox(height: 16),
          const _StepCard(
            icon: Icons.verified_user_outlined,
            iconBg: AppColors.secondaryContainer,
            iconColor: AppColors.onSecondaryContainer,
            title: '2. Match with Verified Members',
            description:
                'We connect you with a cooperative member whose skills and background have '
                'been thoroughly verified via Aadhaar and internal checks.',
            trailingChip: _AadhaarChip(),
          ),
          const SizedBox(height: 16),
          const _StepCard(
            icon: Icons.handshake_outlined,
            iconBg: Colors.white24,
            iconColor: Colors.white,
            title: '3. Service Delivered',
            description:
                'The professional completes the task. Payment is secure and goes directly '
                'to support the cooperative community.',
            dark: true,
          ),
        ],
      ),
    );
  }
}

class _StepCard extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String description;
  final Widget? trailingChip;
  final bool dark;

  const _StepCard({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    required this.description,
    this.trailingChip,
    this.dark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: dark ? AppColors.primary : AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: dark ? AppColors.primary : AppColors.surfaceVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: dark ? Colors.white : AppColors.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              color: dark ? Colors.white70 : AppColors.onSurfaceVariant,
              height: 1.4,
            ),
          ),
          if (trailingChip != null) ...[
            const SizedBox(height: 16),
            trailingChip!,
          ],
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
        color: AppColors.surfaceBright,
        border: Border.all(color: AppColors.outlineVariant),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: const BoxDecoration(color: AppColors.tertiaryFixed, shape: BoxShape.circle),
            child: const Icon(Icons.check, size: 12, color: AppColors.onTertiaryFixedVariant),
          ),
          const SizedBox(width: 6),
          const Text('Aadhaar Verified', style: TextStyle(fontSize: 12, color: AppColors.onSurfaceVariant)),
        ],
      ),
    );
  }
}

class WhyCooperativeSection extends StatelessWidget {
  const WhyCooperativeSection({super.key});

  static const _benefits = [
    (
      icon: Icons.groups_outlined,
      title: 'Fair Compensation',
      description:
          "Unlike traditional aggregators, Sahyog ensures the lion's share of your "
          'payment goes directly to the worker, fostering economic stability.',
    ),
    (
      icon: Icons.shield_outlined,
      title: 'Government Backed Security',
      description:
          'Every professional is thoroughly vetted. The platform operates under strict '
          'government cooperative guidelines for your safety.',
    ),
    (
      icon: Icons.trending_up,
      title: 'Community Growth',
      description:
          'By choosing Sahyog, you are directly investing in the upskilling and welfare '
          'of local service professionals.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                teamPhotoUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(color: AppColors.surfaceVariant),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'THE SHRAMIK DISHA ADVANTAGE',
            style: TextStyle(
              color: AppColors.secondary,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Why Choose a Cooperative Platform?',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 24),
          ),
          const SizedBox(height: 20),
          for (final benefit in _benefits)
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      color: AppColors.surfaceContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(benefit.icon, color: AppColors.primary, size: 22),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          benefit.title,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          benefit.description,
                          style: const TextStyle(color: AppColors.onSurfaceVariant, height: 1.4),
                        ),
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

  static const _links = [
    'About Us',
    'Terms of Service',
    'Privacy Policy',
    'Contact Support',
    'Aadhaar Verification',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surfaceContainerHigh,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        children: [
          Text(
            'SHRAMIK DISHA',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 8),
          const Text(
            '© 2024 SHRAMIK DISHA Cooperative. A Government-Backed Initiative.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: AppColors.onSurfaceVariant),
          ),
          const SizedBox(height: 20),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 8,
            children: _links
                .map((link) => InkWell(
                      onTap: () {},
                      child: Text(
                        link,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.onSurfaceVariant,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void _comingSoon(BuildContext context, String label) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$label — coming soon')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          const Positioned(
            top: -120,
            right: -80,
            child: _BlurCircle(color: AppColors.secondaryFixed, size: 320),
          ),
          const Positioned(
            bottom: -140,
            left: -100,
            child: _BlurCircle(color: AppColors.primaryFixed, size: 380),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLowest,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.outlineVariant),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: double.infinity,
                          color: AppColors.primary,
                          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  loginLogoUrl,
                                  height: 72,
                                  fit: BoxFit.contain,
                                  errorBuilder: (_, __, ___) => const Icon(
                                    Icons.handyman,
                                    color: Colors.white,
                                    size: 48,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Secure Access Portal',
                                style: TextStyle(color: Colors.white.withValues(alpha: 0.9), fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Login or Sign-up',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 22),
                              ),
                              const SizedBox(height: 24),
                              _AuthOptionButton(
                                icon: Icons.call_outlined,
                                label: 'Continue with Phone Number',
                                filled: true,
                                onPressed: () => _comingSoon(context, 'Phone login'),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Row(
                                  children: [
                                    Expanded(child: Divider(color: AppColors.outlineVariant)),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 16),
                                      child: Text(
                                        'OR',
                                        style: TextStyle(
                                          color: AppColors.onSurfaceVariant,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Expanded(child: Divider(color: AppColors.outlineVariant)),
                                  ],
                                ),
                              ),
                              _AuthOptionButton(
                                icon: Icons.mail_outline,
                                label: 'Continue with Email',
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_) => const EmailLoginPage()),
                                  );
                                },
                              ),
                              const SizedBox(height: 12),
                              _AuthOptionButton(
                                icon: Icons.account_circle_outlined,
                                label: 'Continue with Google',
                                onPressed: () => _comingSoon(context, 'Google login'),
                              ),
                              const SizedBox(height: 24),
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 12, height: 1.5),
                                  children: [
                                    const TextSpan(text: 'By continuing, you agree to our '),
                                    TextSpan(
                                      text: 'Terms of Service',
                                      style: const TextStyle(color: AppColors.secondary, decoration: TextDecoration.underline),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => _comingSoon(context, 'Terms of Service'),
                                    ),
                                    const TextSpan(text: ' and '),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: const TextStyle(color: AppColors.secondary, decoration: TextDecoration.underline),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => _comingSoon(context, 'Privacy Policy'),
                                    ),
                                    const TextSpan(text: '.'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BlurCircle extends StatelessWidget {
  final Color color;
  final double size;
  const _BlurCircle({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withValues(alpha: 0.5),
          ),
        ),
      ),
    );
  }
}

class _AuthOptionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool filled;

  const _AuthOptionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 20, color: filled ? AppColors.primary : AppColors.onSurface),
      label: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: filled ? AppColors.primary : AppColors.onSurface,
        ),
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        side: BorderSide(
          color: filled ? AppColors.primary : AppColors.outlineVariant,
          width: filled ? 2 : 1,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class EmailLoginPage extends StatefulWidget {
  const EmailLoginPage({super.key});

  @override
  State<EmailLoginPage> createState() => _EmailLoginPageState();
}

class _EmailLoginPageState extends State<EmailLoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _submitting = false;
  bool _isSignUp = false;
  UserRole _role = UserRole.customer;
  final _authService = const AuthService();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _submitting = true);

    try {
      final user = _isSignUp
          ? await _authService.signUp(email: _emailController.text.trim(), password: _passwordController.text, role: _role)
          : await _authService.signIn(email: _emailController.text.trim(), password: _passwordController.text, role: _role);
      if (!mounted) return;
      setState(() => _submitting = false);
      context.go(user.role == UserRole.admin ? '/admin/dashboard' : '/customer');
    } on ArgumentError catch (error) {
      if (!mounted) return;
      setState(() => _submitting = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.message?.toString() ?? 'Unable to continue')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0.5,
        title: const Text('Continue with Email'),
        foregroundColor: AppColors.onSurface,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      _isSignUp ? 'Create your account' : 'Welcome back',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 24),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Log in to book services and manage your requests.',
                      style: TextStyle(color: AppColors.onSurfaceVariant),
                    ),
                    const SizedBox(height: 32),
                    DropdownButtonFormField<UserRole>(
                      initialValue: _role,
                      isExpanded: true,
                      itemHeight: 48,
                      decoration: const InputDecoration(
                        labelText: 'Account type',
                        prefixIcon: Icon(Icons.badge_outlined, size: 20),
                        border: OutlineInputBorder(),
                        isDense: true,
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: UserRole.customer,
                          child: Text('Customer', overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 13)),
                        ),
                        DropdownMenuItem(
                          value: UserRole.admin,
                          child: Text('Administrator', overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 13)),
                        ),
                      ],
                      onChanged: (value) => setState(() => _role = value ?? UserRole.customer),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [AutofillHints.email],
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.mail_outline),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      autofillHints: const [AutofillHints.password],
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock_outline),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Forgot password — coming soon')),
                          );
                        },
                        child: const Text('Forgot password?'),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: _submitting ? null : _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondaryContainer,
                        foregroundColor: AppColors.onSecondaryContainer,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                      ),
                      child: _submitting
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(_isSignUp ? 'Create account' : 'Login', style: const TextStyle(fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_isSignUp ? 'Already have an account?' : "Don't have an account?", style: const TextStyle(color: AppColors.onSurfaceVariant)),
                        TextButton(
                          onPressed: () => setState(() => _isSignUp = !_isSignUp),
                          child: Text(_isSignUp ? 'Login' : 'Sign up'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
