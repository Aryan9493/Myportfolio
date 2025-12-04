import 'package:flutter/material.dart';
import '../utils/breakpoints.dart';
import '../utils/theme.dart';
import '../data/portfolio_data.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback? onViewProjects;

  const HeroSection({
    super.key,
    this.onViewProjects,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final personalInfo = PortfolioData.personalInfo;

    if (context.isMobile) {
      return _buildMobileHero(context, personalInfo);
    } else {
      return _buildDesktopHero(context, personalInfo);
    }
  }

  Widget _buildDesktopHero(BuildContext context, PersonalInfo info) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 80),
      child: Row(
        children: [
          // Left: Text content
          Expanded(
            flex: 3,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      info.headline,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      info.subtitle,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: widget.onViewProjects,
                          child: const Text('View Projects'),
                        ),
                        const SizedBox(width: 16),
                        OutlinedButton.icon(
                          onPressed: _downloadResume,
                          icon: const Icon(Icons.download),
                          label: const Text('Download Resume'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          const SizedBox(width: 80),
          
          // Right: Avatar with animated background
          Expanded(
            flex: 2,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: _buildAvatarSection(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileHero(BuildContext context, PersonalInfo info) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Column(
            children: [
              // Avatar
              _buildAvatarSection(context),
              const SizedBox(height: 32),
              
              // Text content
              Text(
                info.headline,
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                info.subtitle,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              
              // Buttons
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: widget.onViewProjects,
                    child: const Text('View Projects'),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: _downloadResume,
                    icon: const Icon(Icons.download),
                    label: const Text('Download Resume'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatarSection(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Animated background shape
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(seconds: 2),
          builder: (context, value, child) {
            return Transform.scale(
              scale: 0.8 + (value * 0.2),
              child: Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.accentTeal.withOpacity(0.3),
                      AppColors.warmGold.withOpacity(0.3),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            );
          },
        ),
        
        // Avatar
        Container(
          width: 240,
          height: 240,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [AppColors.accentTeal, AppColors.warmGold],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: AppShadows.glassShadow,
          ),
          child: Center(
            child: Text(
              'AS',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 72,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _downloadResume() async {
    // In a real app, this would open the PDF
    // For now, we'll show a snackbar
    if (!mounted) return;
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Resume download started...'),
        duration: Duration(seconds: 2),
      ),
    );
    
    // TODO: Implement actual PDF download
    // final url = Uri.parse('assets/resume.pdf');
    // if (await canLaunchUrl(url)) {
    //   await launchUrl(url);
    // }
  }
}
