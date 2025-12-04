import 'package:flutter/material.dart';
import '../utils/theme.dart';
import '../data/portfolio_data.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  final VoidCallback? onTap;

  const ProjectCard({
    super.key,
    required this.project,
    this.onTap,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isDark ? AppColors.glassDark : AppColors.glassLight,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _isHovered 
                  ? AppColors.accentTeal 
                  : (isDark ? AppColors.grey700 : AppColors.grey200),
              width: _isHovered ? 2 : 1,
            ),
            boxShadow: _isHovered ? AppShadows.cardShadowHover : AppShadows.cardShadow,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project image
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                child: widget.project.imagePath.isNotEmpty
                    ? Image.asset(
                        widget.project.imagePath,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 200,
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
                            ),
                            child: Center(
                              child: Icon(
                                Icons.image,
                                size: 64,
                                color: isDark ? Colors.white54 : Colors.black26,
                              ),
                            ),
                          );
                        },
                      )
                    : Container(
                        height: 200,
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
                        ),
                        child: Center(
                          child: Icon(
                            Icons.image,
                            size: 64,
                            color: isDark ? Colors.white54 : Colors.black26,
                          ),
                        ),
                      ),
              ),
              
              // Content
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.title,
                      style: Theme.of(context).textTheme.titleLarge,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.project.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 16),
                    
                    // Tech stack chips
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.project.techStack.take(4).map((tech) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.accentTeal.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppColors.accentTeal.withOpacity(0.3),
                            ),
                          ),
                          child: Text(
                            tech,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.accentTeal,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Action buttons
                    Row(
                      children: [
                        if (widget.project.liveUrl != null)
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.open_in_new, size: 16),
                              label: const Text('Live'),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                              ),
                            ),
                          ),
                        if (widget.project.liveUrl != null && widget.project.githubUrl != null)
                          const SizedBox(width: 12),
                        if (widget.project.githubUrl != null)
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.code, size: 16),
                              label: const Text('GitHub'),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
