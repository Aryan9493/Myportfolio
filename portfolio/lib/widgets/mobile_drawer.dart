import 'package:flutter/material.dart';
import '../utils/theme.dart';
import '../data/portfolio_data.dart';

class MobileDrawer extends StatelessWidget {
  final Function(String)? onNavItemTap;

  const MobileDrawer({
    super.key,
    this.onNavItemTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Drawer(
      backgroundColor: isDark ? AppColors.deepNavy : Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.accentTeal,
                    child: Text(
                      'AS',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    PortfolioData.personalInfo.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    PortfolioData.personalInfo.title,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            
            const Divider(),
            
            // Navigation items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _buildDrawerItem(context, Icons.person, 'About', 'about'),
                  _buildDrawerItem(context, Icons.work, 'Projects', 'projects'),
                  _buildDrawerItem(context, Icons.business_center, 'Experience', 'experience'),
                  _buildDrawerItem(context, Icons.code, 'Skills', 'skills'),
                  _buildDrawerItem(context, Icons.contact_mail, 'Contact', 'contact'),
                  const Divider(),
                  _buildDrawerItem(context, Icons.download, 'Resume', 'resume'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String label, String route) {
    return ListTile(
      leading: Icon(icon, color: AppColors.accentTeal),
      title: Text(
        label,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      onTap: () {
        Navigator.pop(context); // Close drawer
        onNavItemTap?.call(route);
      },
    );
  }
}
