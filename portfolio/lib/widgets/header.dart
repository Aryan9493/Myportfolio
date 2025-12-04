import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/breakpoints.dart';
import '../utils/theme.dart';
import '../providers/theme_provider.dart';

class PortfolioHeader extends ConsumerWidget {
  final VoidCallback? onMenuTap;
  final Function(String)? onNavItemTap;

  const PortfolioHeader({
    super.key,
    this.onMenuTap,
    this.onNavItemTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final isDark = themeMode == ThemeMode.dark;

    if (context.isMobile) {
      return _buildMobileHeader(context, ref, isDark);
    } else {
      return _buildDesktopHeader(context, ref, isDark);
    }
  }

  Widget _buildMobileHeader(BuildContext context, WidgetRef ref, bool isDark) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: isDark ? AppColors.deepNavy : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          _buildLogo(context),
          
          // Actions
          Row(
            children: [
              _buildThemeToggle(ref, isDark),
              const SizedBox(width: 12),
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: onMenuTap,
                color: isDark ? Colors.white : AppColors.deepNavy,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopHeader(BuildContext context, WidgetRef ref, bool isDark) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 48),
      decoration: BoxDecoration(
        color: isDark ? AppColors.deepNavy : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          _buildLogo(context),
          
          // Navigation
          Row(
            children: [
              _buildNavItem(context, 'About', () => onNavItemTap?.call('about')),
              const SizedBox(width: 32),
              _buildNavItem(context, 'Projects', () => onNavItemTap?.call('projects')),
              const SizedBox(width: 32),
              _buildNavItem(context, 'Experience', () => onNavItemTap?.call('experience')),
              const SizedBox(width: 32),
              _buildNavItem(context, 'Skills', () => onNavItemTap?.call('skills')),
              const SizedBox(width: 32),
              _buildNavItem(context, 'Contact', () => onNavItemTap?.call('contact')),
              const SizedBox(width: 32),
              _buildThemeToggle(ref, isDark),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.accentTeal, AppColors.warmGold],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          'AS',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }

  Widget _buildThemeToggle(WidgetRef ref, bool isDark) {
    return IconButton(
      icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
      onPressed: () {
        ref.read(themeModeProvider.notifier).toggleTheme();
      },
      tooltip: isDark ? 'Light Mode' : 'Dark Mode',
      color: isDark ? AppColors.warmGold : AppColors.accentTeal,
    );
  }
}
