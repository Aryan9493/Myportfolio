import 'package:flutter/material.dart';
import '../utils/breakpoints.dart';
import '../utils/theme.dart';
import '../data/portfolio_data.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = PortfolioData.skills;
    final categories = skills.map((s) => s.category).toSet().toList();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.isMobile ? 24 : 48,
        vertical: context.isMobile ? 48 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills & Technologies',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 48),
          
          // Skills by category
          ...categories.map((category) {
            final categorySkills = skills.where((s) => s.category == category).toList();
            return _buildCategorySection(context, category, categorySkills);
          }),
        ],
      ),
    );
  }

  Widget _buildCategorySection(BuildContext context, String category, List<Skill> skills) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 24),
        
        // Skills grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.isMobile ? 1 : context.isTablet ? 2 : 3,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: context.isMobile ? 5 : 4,
          ),
          itemCount: skills.length,
          itemBuilder: (context, index) {
            return _buildSkillCard(context, skills[index]);
          },
        ),
        
        const SizedBox(height: 48),
      ],
    );
  }

  Widget _buildSkillCard(BuildContext context, Skill skill) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              // Icon placeholder
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.accentTeal.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.code,
                  color: AppColors.accentTeal,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  skill.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Text(
                '${(skill.proficiency * 100).toInt()}%',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.accentTeal,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: skill.proficiency,
              backgroundColor: isDark ? AppColors.grey700 : AppColors.grey300,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.accentTeal),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}
