import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/breakpoints.dart';
import '../utils/theme.dart';
import '../data/portfolio_data.dart';

class ProjectDetailModal extends StatelessWidget {
  final Project project;

  const ProjectDetailModal({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(context.isMobile ? 16 : 48),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 900),
        decoration: BoxDecoration(
          color: isDark ? AppColors.deepNavy : Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: AppShadows.cardShadowHover,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isDark ? AppColors.grey700 : AppColors.grey200,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      project.title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            
            // Content
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Project image
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.accentTeal.withOpacity(0.3),
                            AppColors.warmGold.withOpacity(0.3),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.image,
                          size: 80,
                          color: isDark ? Colors.white54 : Colors.black26,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Role
                    Text(
                      'Role: ${project.role}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.accentTeal,
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Description
                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      project.description,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Tech stack
                    Text(
                      'Tech Stack',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: project.techStack.map((tech) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.accentTeal.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: AppColors.accentTeal.withOpacity(0.3),
                            ),
                          ),
                          child: Text(
                            tech,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.accentTeal,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    
                    const SizedBox(height: 32),
                    
                    // Action buttons
                    Row(
                      children: [
                        if (project.liveUrl != null)
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () => _launchUrl(project.liveUrl!),
                              icon: const Icon(Icons.open_in_new),
                              label: const Text('View Live'),
                            ),
                          ),
                        if (project.liveUrl != null && project.githubUrl != null)
                          const SizedBox(width: 16),
                        if (project.githubUrl != null)
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () => _launchUrl(project.githubUrl!),
                              icon: const Icon(Icons.code),
                              label: const Text('View Code'),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }
}
