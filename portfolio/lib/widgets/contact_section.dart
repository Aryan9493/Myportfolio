import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/breakpoints.dart';
import '../utils/theme.dart';
import '../data/portfolio_data.dart';
import 'contact_form.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final personalInfo = PortfolioData.personalInfo;
    final socialLinks = PortfolioData.socialLinks;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.isMobile ? 24 : 48,
        vertical: context.isMobile ? 48 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Get In Touch',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 16),
          Text(
            'Have a project in mind? Let\'s work together!',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 48),
          
          // Two column layout on desktop
          if (context.isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: const ContactForm(),
                ),
                const SizedBox(width: 48),
                Expanded(
                  child: _buildContactInfo(context, personalInfo, socialLinks),
                ),
              ],
            )
          else
            Column(
              children: [
                const ContactForm(),
                const SizedBox(height: 48),
                _buildContactInfo(context, personalInfo, socialLinks),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context, PersonalInfo info, List<SocialLink> links) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: isDark ? AppColors.glassDark : AppColors.glassLight,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark ? AppColors.grey700 : AppColors.grey200,
        ),
        boxShadow: AppShadows.glassShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Information',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 24),
          
          _buildInfoItem(
            context,
            Icons.email,
            'Email',
            info.email,
            () => _launchUrl('mailto:${info.email}'),
          ),
          const SizedBox(height: 16),
          
          _buildInfoItem(
            context,
            Icons.phone,
            'Phone',
            info.phone,
            () => _launchUrl('tel:${info.phone}'),
          ),
          const SizedBox(height: 16),
          
          _buildInfoItem(
            context,
            Icons.location_on,
            'Location',
            info.location,
            null,
          ),
          
          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 24),
          
          Text(
            'Follow Me',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          
          // Social links
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: links.map((link) {
              return _buildSocialButton(context, link);
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(
    BuildContext context,
    IconData icon,
    String label,
    String value,
    VoidCallback? onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Icon(icon, color: AppColors.accentTeal, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    value,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            if (onTap != null)
              const Icon(Icons.arrow_forward, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(BuildContext context, SocialLink link) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: () => _launchUrl(link.url),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isDark ? AppColors.deepNavy : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.accentTeal.withOpacity(0.3),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _getSocialIcon(link.platform),
              color: AppColors.accentTeal,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              link.platform,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getSocialIcon(String platform) {
    switch (platform.toLowerCase()) {
      case 'linkedin':
        return Icons.business;
      case 'github':
        return Icons.code;
      case 'email':
        return Icons.email;
      default:
        return Icons.link;
    }
  }

  Future<void> _launchUrl(String urlString) async {
    final url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }
}
