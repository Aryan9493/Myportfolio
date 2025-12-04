import 'package:flutter/material.dart';
import 'breakpoints.dart';

/// Responsive widget that builds different layouts based on screen size
class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    if (context.isDesktop && desktop != null) {
      return desktop!;
    } else if (context.isTablet && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}

/// Responsive builder with explicit breakpoint values
class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, BoxConstraints constraints) builder;

  const ResponsiveBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: builder,
    );
  }
}
