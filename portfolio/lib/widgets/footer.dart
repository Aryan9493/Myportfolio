import 'package:flutter/material.dart';
import '../utils/breakpoints.dart';
import '../utils/theme.dart';
import '../data/portfolio_data.dart';

class PortfolioFooter extends StatelessWidget {
  final Function(String)? onNavItemTap;

  const PortfolioFooter({
    super.key,
    this.onNavItemTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final personalInfo = PortfolioData.personalInfo;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.isMobile ? 24 : 48,
        vertical: 48,
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.deepNavy : AppColors.grey100,
        border: Border(
          top: BorderSide(
            color: isDark ? AppColors.grey700 : AppColors.grey300,
          ),
        ),
      ),
      child: Column(
        children: [
          if (!context.isMobile)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo and tagline
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [AppColors.accentTeal, AppColors.warmGold],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'AS',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            personalInfo.name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        personalInfo.title,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                
                // Quick links
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quick Links',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 12),
                      _buildFooterLink(context, 'About', () => onNavItemTap?.call('about')),
                      _buildFooterLink(context, 'Projects', () => onNavItemTap?.call('projects')),
                      _buildFooterLink(context, 'Experience', () => onNavItemTap?.call('experience')),
                      _buildFooterLink(context, 'Contact', () => onNavItemTap?.call('contact')),
                    ],
                  ),
                ),
                
                // Contact
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        personalInfo.email,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        personalInfo.location,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            )
          else
            Column(
              children: [
                // Logo
                Container(
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
                ),
                const SizedBox(height: 16),
                Text(
                  personalInfo.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  personalInfo.email,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          
          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 24),
          
          // Copyright
          Text(
            '© ${DateTime.now().year} ${personalInfo.name}. All rights reserved.',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Built with Flutter 💙',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.accentTeal,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLink(BuildContext context, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
