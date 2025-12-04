/// Portfolio data models and sample data

class PersonalInfo {
  final String name;
  final String title;
  final String headline;
  final String subtitle;
  final String email;
  final String phone;
  final String linkedin;
  final String github;
  final String location;
  final String avatarPath;

  PersonalInfo({
    required this.name,
    required this.title,
    required this.headline,
    required this.subtitle,
    required this.email,
    required this.phone,
    required this.linkedin,
    required this.github,
    required this.location,
    required this.avatarPath,
  });
}

class AboutHighlight {
  final String icon;
  final String title;
  final String description;

  AboutHighlight({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class Project {
  final String id;
  final String title;
  final String description;
  final String role;
  final List<String> techStack;
  final String imagePath;
  final List<String> screenshots;
  final String? liveUrl;
  final String? githubUrl;
  final bool isFeatured;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.role,
    required this.techStack,
    required this.imagePath,
    required this.screenshots,
    this.liveUrl,
    this.githubUrl,
    this.isFeatured = false,
  });
}

class Experience {
  final String company;
  final String role;
  final String duration;
  final String startDate;
  final String endDate;
  final String description;
  final List<String> achievements;
  final String? logoPath;

  Experience({
    required this.company,
    required this.role,
    required this.duration,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.achievements,
    this.logoPath,
  });
}

class Skill {
  final String name;
  final String iconPath;
  final double proficiency; // 0.0 to 1.0
  final String category;

  Skill({
    required this.name,
    required this.iconPath,
    required this.proficiency,
    required this.category,
  });
}

class SocialLink {
  final String platform;
  final String url;
  final String iconPath;

  SocialLink({
    required this.platform,
    required this.url,
    required this.iconPath,
  });
}

/// Sample portfolio data
class PortfolioData {
  static final personalInfo = PersonalInfo(
    name: 'Aryan Sontakke',
    title: 'Junior Flutter & Android Developer',
    headline: 'Hi — I\'m Aryan Sontakke,\nJunior Flutter & Android Developer.',
    subtitle: 'Building performant mobile & web apps with Flutter, Dart and clean architecture.',
    email: 'aryan.sontakke@example.com',
    phone: '+91 98765 43210',
    linkedin: 'https://www.linkedin.com/in/aryan-sontakke',
    github: 'https://github.com/aryansontakke',
    location: 'Mumbai, India',
    avatarPath: 'assets/images/avatar.png',
  );

  static final aboutHighlights = [
    AboutHighlight(
      icon: '🎯',
      title: '2+ Years Experience',
      description: 'Building cross-platform mobile applications with Flutter and native Android development',
    ),
    AboutHighlight(
      icon: '📱',
      title: 'Mobile-First Approach',
      description: 'Specialized in creating responsive, performant apps with clean architecture patterns',
    ),
    AboutHighlight(
      icon: '🚀',
      title: 'Fast Learner',
      description: 'Continuously exploring new technologies including Golang, MongoDB, and modern backend solutions',
    ),
    AboutHighlight(
      icon: '💡',
      title: 'Problem Solver',
      description: 'Passionate about writing clean, maintainable code and solving complex technical challenges',
    ),
  ];

  static final projects = [
    Project(
      id: 'p1',
      title: 'E-Commerce Mobile App',
      description: 'A full-featured e-commerce application with product browsing, cart management, payment integration, and order tracking. Built with Flutter and Firebase backend.',
      role: 'Lead Flutter Developer',
      techStack: ['Flutter', 'Dart', 'Firebase', 'Stripe', 'Provider'],
      imagePath: 'assets/images/project1.png',
      screenshots: [
        'assets/images/project1_screen1.png',
        'assets/images/project1_screen2.png',
        'assets/images/project1_screen3.png',
      ],
      githubUrl: 'https://github.com/aryansontakke/ecommerce-app',
      isFeatured: true,
    ),
    Project(
      id: 'p2',
      title: 'Fitness Tracker',
      description: 'A comprehensive fitness tracking app with workout logging, progress charts, nutrition tracking, and social features. Integrated with wearable devices.',
      role: 'Flutter Developer',
      techStack: ['Flutter', 'Riverpod', 'SQLite', 'Charts', 'Health Kit'],
      imagePath: 'assets/images/project2.png',
      screenshots: [
        'assets/images/project2_screen1.png',
        'assets/images/project2_screen2.png',
      ],
      liveUrl: 'https://play.google.com/store/apps/fitness-tracker',
      githubUrl: 'https://github.com/aryansontakke/fitness-tracker',
      isFeatured: true,
    ),
    Project(
      id: 'p3',
      title: 'Task Management Dashboard',
      description: 'A productivity app for teams with task assignment, kanban boards, time tracking, and real-time collaboration features.',
      role: 'Full Stack Flutter Developer',
      techStack: ['Flutter', 'MongoDB', 'Node.js', 'WebSockets', 'BLoC'],
      imagePath: 'assets/images/project3.png',
      screenshots: [
        'assets/images/project3_screen1.png',
        'assets/images/project3_screen2.png',
      ],
      liveUrl: 'https://taskmanager-demo.web.app',
      githubUrl: 'https://github.com/aryansontakke/task-manager',
      isFeatured: true,
    ),
    Project(
      id: 'p4',
      title: 'Weather Forecast App',
      description: 'Beautiful weather app with hourly and weekly forecasts, weather alerts, and location-based recommendations.',
      role: 'Flutter Developer',
      techStack: ['Flutter', 'REST API', 'Geolocator', 'Animations'],
      imagePath: 'assets/images/project4.png',
      screenshots: [
        'assets/images/project4_screen1.png',
      ],
      githubUrl: 'https://github.com/aryansontakke/weather-app',
      isFeatured: false,
    ),
  ];

  static final experiences = [
    Experience(
      company: 'TechStart Solutions',
      role: 'Junior Flutter Developer',
      duration: '1 year 6 months',
      startDate: 'Jul 2023',
      endDate: 'Present',
      description: 'Developing cross-platform mobile applications for clients in e-commerce and fintech sectors.',
      achievements: [
        'Built and deployed 3 production Flutter apps with 50K+ combined downloads',
        'Reduced app load time by 40% through code optimization and lazy loading',
        'Implemented CI/CD pipeline using GitHub Actions and Fastlane',
        'Mentored 2 junior developers in Flutter best practices',
      ],
      logoPath: 'assets/images/company1.png',
    ),
    Experience(
      company: 'InnovateLabs',
      role: 'Flutter Development Intern',
      duration: '6 months',
      startDate: 'Jan 2023',
      endDate: 'Jun 2023',
      description: 'Internship focused on mobile app development and learning industry best practices.',
      achievements: [
        'Developed UI components for 2 client projects',
        'Integrated REST APIs and implemented state management with Provider',
        'Participated in code reviews and agile development processes',
        'Learned Firebase integration and cloud functions',
      ],
      logoPath: 'assets/images/company2.png',
    ),
  ];

  static final skills = [
    // Mobile Development
    Skill(
      name: 'Flutter',
      iconPath: 'assets/icons/flutter.png',
      proficiency: 0.9,
      category: 'Mobile',
    ),
    Skill(
      name: 'Dart',
      iconPath: 'assets/icons/dart.png',
      proficiency: 0.9,
      category: 'Mobile',
    ),
    Skill(
      name: 'Android',
      iconPath: 'assets/icons/android.png',
      proficiency: 0.75,
      category: 'Mobile',
    ),
    
    // State Management
    Skill(
      name: 'Riverpod',
      iconPath: 'assets/icons/riverpod.png',
      proficiency: 0.8,
      category: 'State Management',
    ),
    Skill(
      name: 'Provider',
      iconPath: 'assets/icons/provider.png',
      proficiency: 0.85,
      category: 'State Management',
    ),
    Skill(
      name: 'BLoC',
      iconPath: 'assets/icons/bloc.png',
      proficiency: 0.7,
      category: 'State Management',
    ),
    
    // Backend & Tools
    Skill(
      name: 'Firebase',
      iconPath: 'assets/icons/firebase.png',
      proficiency: 0.8,
      category: 'Backend',
    ),
    Skill(
      name: 'MongoDB',
      iconPath: 'assets/icons/mongodb.png',
      proficiency: 0.6,
      category: 'Backend',
    ),
    Skill(
      name: 'Postman',
      iconPath: 'assets/icons/postman.png',
      proficiency: 0.85,
      category: 'Tools',
    ),
    Skill(
      name: 'Git',
      iconPath: 'assets/icons/git.png',
      proficiency: 0.85,
      category: 'Tools',
    ),
    
    // Learning
    Skill(
      name: 'Golang',
      iconPath: 'assets/icons/golang.png',
      proficiency: 0.4,
      category: 'Learning',
    ),
    Skill(
      name: 'Node.js',
      iconPath: 'assets/icons/nodejs.png',
      proficiency: 0.5,
      category: 'Backend',
    ),
  ];

  static final socialLinks = [
    SocialLink(
      platform: 'LinkedIn',
      url: 'https://www.linkedin.com/in/aryan-sontakke',
      iconPath: 'assets/icons/linkedin.png',
    ),
    SocialLink(
      platform: 'GitHub',
      url: 'https://github.com/aryansontakke',
      iconPath: 'assets/icons/github.png',
    ),
    SocialLink(
      platform: 'Email',
      url: 'mailto:aryan.sontakke@example.com',
      iconPath: 'assets/icons/email.png',
    ),
  ];
}
