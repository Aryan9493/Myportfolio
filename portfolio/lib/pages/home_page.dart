import 'package:flutter/material.dart';
import '../utils/breakpoints.dart';
import '../widgets/header.dart';
import '../widgets/mobile_drawer.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  
  // Section keys for smooth scrolling
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: context.isMobile
          ? MobileDrawer(onNavItemTap: _scrollToSection)
          : null,
      body: Column(
        children: [
          // Header
          PortfolioHeader(
            onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
            onNavItemTap: _scrollToSection,
          ),
          
          // Main content
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  // Hero section
                  HeroSection(
                    onViewProjects: () => _scrollToSection('projects'),
                  ),
                  
                  // About section
                  Container(
                    key: _aboutKey,
                    child: const AboutSection(),
                  ),
                  
                  // Projects section
                  Container(
                    key: _projectsKey,
                    child: const ProjectsSection(),
                  ),
                  
                  // Experience section
                  Container(
                    key: _experienceKey,
                    child: const ExperienceSection(),
                  ),
                  
                  // Skills section
                  Container(
                    key: _skillsKey,
                    child: const SkillsSection(),
                  ),
                  
                  // Contact section
                  Container(
                    key: _contactKey,
                    child: const ContactSection(),
                  ),
                  
                  // Footer
                  PortfolioFooter(
                    onNavItemTap: _scrollToSection,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _scrollToSection(String section) {
    GlobalKey? targetKey;
    
    switch (section) {
      case 'about':
        targetKey = _aboutKey;
        break;
      case 'projects':
        targetKey = _projectsKey;
        break;
      case 'experience':
        targetKey = _experienceKey;
        break;
      case 'skills':
        targetKey = _skillsKey;
        break;
      case 'contact':
        targetKey = _contactKey;
        break;
      case 'resume':
        _downloadResume();
        return;
    }
    
    if (targetKey?.currentContext != null) {
      final RenderBox renderBox = targetKey!.currentContext!.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero).dy;
      final offset = _scrollController.offset + position - 80; // Subtract header height
      
      _scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  void _downloadResume() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Resume download started...'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
