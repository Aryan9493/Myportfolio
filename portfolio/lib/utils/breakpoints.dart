import 'package:flutter/material.dart';

/// Responsive breakpoint constants
class Breakpoints {
  // Desktop breakpoint (≥1200px)
  static const double desktop = 1200;
  
  // Tablet breakpoint (768-1199px)
  static const double tablet = 768;
  
  // Mobile breakpoint (<768px)
  static const double mobile = 0;
}

/// Extension to check current breakpoint
extension ResponsiveContext on BuildContext {
  bool get isDesktop => MediaQuery.of(this).size.width >= Breakpoints.desktop;
  bool get isTablet => MediaQuery.of(this).size.width >= Breakpoints.tablet && 
                       MediaQuery.of(this).size.width < Breakpoints.desktop;
  bool get isMobile => MediaQuery.of(this).size.width < Breakpoints.tablet;
  
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
}
