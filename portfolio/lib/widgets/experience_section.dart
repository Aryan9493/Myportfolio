import 'package:flutter/material.dart';
import '../utils/breakpoints.dart';
import '../utils/theme.dart';
import '../data/portfolio_data.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final experiences = PortfolioData.experiences;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.isMobile ? 24 : 48,
        vertical: context.isMobile ? 48 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Experience',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 48),
          
          // Timeline
          ...experiences.asMap().entries.map((entry) {
            final isLast = entry.key == experiences.length - 1;
            return _buildTimelineItem(
              context,
              entry.value,
              isLast: isLast,
            );
          }),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(BuildContext context, Experience exp, {bool isLast = false}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline indicator
        Column(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: isDark ? AppColors.glassDark : AppColors.glassLight,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.accentTeal,
                  width: 3,
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.work,
                  color: AppColors.accentTeal,
                  size: 24,
                ),
              ),
            ),
            if (!isLast)
              Container(
                width: 3,
                height: 120,
                color: AppColors.grey400,
                margin: const EdgeInsets.symmetric(vertical: 8),
              ),
          ],
        ),
        
        const SizedBox(width: 24),
        
        // Content
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 40),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: isDark ? AppColors.glassDark : AppColors.glassLight,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isDark ? AppColors.grey700 : AppColors.grey200,
              ),
              boxShadow: AppShadows.glassShadow,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            exp.role,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            exp.company,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: AppColors.accentTeal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.warmGold.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.warmGold.withOpacity(0.3),
                        ),
                      ),
                      child: Text(
                        exp.duration,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.warmGold,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 8),
                
                Text(
                  '${exp.startDate} - ${exp.endDate}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                
                const SizedBox(height: 16),
                
                Text(
                  exp.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                
                const SizedBox(height: 16),
                
                // Achievements
                ...exp.achievements.map((achievement) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Icon(
                            Icons.check_circle,
                            size: 16,
                            color: AppColors.accentTeal,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            achievement,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
