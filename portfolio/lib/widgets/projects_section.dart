import 'package:flutter/material.dart';
import '../utils/breakpoints.dart';
import '../data/portfolio_data.dart';
import 'project_card.dart';
import 'project_detail_modal.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  @override
  Widget build(BuildContext context) {
    final projects = PortfolioData.projects.where((p) => p.isFeatured).toList();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.isMobile ? 24 : 48,
        vertical: context.isMobile ? 48 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured Projects',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 16),
          Text(
            'A selection of my recent work',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 48),
          
          // Projects grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: context.isMobile ? 1 : context.isTablet ? 2 : 3,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: context.isMobile ? 0.85 : 0.75,
            ),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              return TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: Duration(milliseconds: 400 + (index * 100)),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, 20 * (1 - value)),
                      child: child,
                    ),
                  );
                },
                child: ProjectCard(
                  project: projects[index],
                  onTap: () => _showProjectDetail(context, projects[index]),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showProjectDetail(BuildContext context, Project project) {
    showDialog(
      context: context,
      builder: (context) => ProjectDetailModal(project: project),
    );
  }
}
