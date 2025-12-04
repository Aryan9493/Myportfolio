import 'package:flutter/material.dart';
import '../utils/breakpoints.dart';
import '../utils/theme.dart';
import '../data/portfolio_data.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.isMobile ? 24 : 48,
        vertical: context.isMobile ? 48 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 48),
          
          // Highlights grid
          _buildHighlightsGrid(context),
          
          const SizedBox(height: 48),
          
          // Timeline card
          _buildTimelineCard(context),
        ],
      ),
    );
  }

  Widget _buildHighlightsGrid(BuildContext context) {
    final highlights = PortfolioData.aboutHighlights;
    
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.isMobile ? 1 : context.isTablet ? 2 : 4,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: context.isMobile ? 3 : 1.2,
      ),
      itemCount: highlights.length,
      itemBuilder: (context, index) {
        return _buildHighlightCard(context, highlights[index]);
      },
    );
  }

  Widget _buildHighlightCard(BuildContext context, AboutHighlight highlight) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? AppColors.glassDark : AppColors.glassLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.grey700 : AppColors.grey200,
          width: 1,
        ),
        boxShadow: AppShadows.glassShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            highlight.icon,
            style: const TextStyle(fontSize: 32),
          ),
          const SizedBox(height: 12),
          Text(
            highlight.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            highlight.description,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineCard(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final experiences = PortfolioData.experiences;
    
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: isDark ? AppColors.glassDark : AppColors.glassLight,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark ? AppColors.grey700 : AppColors.grey200,
          width: 1,
        ),
        boxShadow: AppShadows.glassShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Career Journey',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 24),
          
          // Simple timeline
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline indicator
        Column(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: AppColors.accentTeal,
                shape: BoxShape.circle,
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 60,
                color: AppColors.grey400,
                margin: const EdgeInsets.symmetric(vertical: 4),
              ),
          ],
        ),
        
        const SizedBox(width: 16),
        
        // Content
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exp.role,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  '${exp.company} • ${exp.duration}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.accentTeal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
