# Flutter Portfolio App - Developer Notes

## 📦 Packages Used

### Core Dependencies
- **flutter_riverpod** (^2.5.1) - State management for theme toggle and app state
- **google_fonts** (^6.2.1) - Inter font family for professional typography
- **url_launcher** (^6.3.1) - Launch external URLs (LinkedIn, GitHub, email)
- **flutter_svg** (^2.0.10+1) - SVG icon support
- **animations** (^2.0.11) - Smooth page transitions and micro-interactions
- **responsive_framework** (^1.5.1) - Responsive layout utilities

## 🎨 Design System

### Color Palette
- **Deep Navy**: #0B132B (primary dark)
- **Accent Teal**: #00BFA6 (primary actions)
- **Warm Gold**: #FFB86B (secondary accent)
- **Neutral Greys**: #FAFAFA to #212121 (backgrounds and text)

### Typography
- **Headings**: Inter (700 weight)
- **Body**: Inter (400 weight)
- **Labels**: Inter (500-600 weight)

### Animations
- **Fast**: 150ms (hover states)
- **Normal**: 250ms (transitions)
- **Slow**: 300ms (page transitions)

### Shadows & Effects
- **Card Shadow**: 16px blur, 4px offset, 8% opacity
- **Hover Shadow**: 24px blur, 8px offset, 12% opacity
- **Glass Shadow**: 20px blur, 8px offset, 5% opacity
- **Glassmorphism**: 80% opacity backgrounds with blur

## 🏗️ Architecture

### State Management
- **Riverpod** for theme mode (light/dark toggle)
- **StatefulWidget** for local component state (forms, animations)
- **GlobalKeys** for scroll navigation

### Responsive Strategy
- **Breakpoints**: Desktop (≥1200px), Tablet (768-1199px), Mobile (<768px)
- **Context Extensions**: `context.isDesktop`, `context.isTablet`, `context.isMobile`
- **Conditional Rendering**: Different layouts per breakpoint

### Navigation
- **Single Page App**: All sections on one scrollable page
- **Smooth Scroll**: Animated scroll to sections via GlobalKeys
- **Header Navigation**: Desktop horizontal nav, mobile drawer

## 🚀 Build & Deploy

### Quick Commands

```bash
# Install dependencies
flutter pub get

# Run on Chrome (web)
flutter run -d chrome

# Build for web production
flutter build web --release

# Build for Android
flutter build apk --release

# Build for iOS (macOS only)
flutter build ios --release

# Analyze code
flutter analyze

# Run tests
flutter test
```

### Web Deployment

**Firebase Hosting** (Recommended)
```bash
flutter build web --release
firebase deploy
```

**Netlify**
1. Build: `flutter build web --release`
2. Deploy `build/web` folder

**Vercel**
```bash
flutter build web --release
vercel --prod
```

**GitHub Pages**
1. Build: `flutter build web --release`
2. Push `build/web` contents to `gh-pages` branch

### Mobile Deployment

**Android (Google Play)**
```bash
flutter build appbundle --release
# Upload to Google Play Console
```

**iOS (App Store)**
```bash
flutter build ios --release
# Open in Xcode and archive for App Store
```

## 🎯 Customization Guide

### 1. Update Personal Data
Edit `lib/data/portfolio_data.dart`:
- Change `PersonalInfo` fields
- Update `projects`, `experiences`, `skills`
- Modify social links

### 2. Change Theme Colors
Edit `lib/utils/theme.dart`:
- Update `AppColors` constants
- Modify `lightTheme` and `darkTheme`

### 3. Add Real Resume PDF
1. Place PDF in `assets/resume.pdf`
2. Update `pubspec.yaml` assets section
3. Implement download in `hero_section.dart` and `header.dart`

### 4. Replace Project Images
1. Add images to `assets/images/`
2. Update `imagePath` in `portfolio_data.dart`
3. Images will auto-load with error fallback

### 5. Add Icons
1. Place icons in `assets/icons/`
2. Update `iconPath` in skills/social data
3. Use `flutter_svg` for SVG icons or `Image.asset` for PNG

## 🐛 Known Limitations

1. **Resume Download**: Currently shows snackbar. Implement actual PDF download with `url_launcher` or web download.
2. **Contact Form**: Simulates submission. Integrate with backend API or email service (e.g., EmailJS, Firebase Functions).
3. **Project Images**: Using generated placeholders. Replace with actual screenshots.
4. **Icon Assets**: Using Material Icons. Add custom SVG icons for tech stack.

## 🔧 Troubleshooting

### Build Issues
```bash
# Clean build
flutter clean
flutter pub get
flutter build web --release
```

### Font Loading Issues
- Ensure `google_fonts` is in dependencies
- Check internet connection (fonts load from Google)
- For offline, download fonts and add to `pubspec.yaml`

### Image Not Loading
- Verify path in `pubspec.yaml` assets
- Check file exists in `assets/images/`
- Use lowercase filenames without spaces

### Responsive Layout Issues
- Test at exact breakpoints (768px, 1200px)
- Use Chrome DevTools responsive mode
- Check `breakpoints.dart` values

## 📊 Performance Tips

1. **Lazy Load Images**: Use `Image.asset` with `cacheWidth` and `cacheHeight`
2. **Optimize Images**: Compress PNGs and use WebP for web
3. **Code Splitting**: Use deferred loading for large features
4. **Tree Shaking**: Build with `--release` flag
5. **Web Renderer**: Use `--web-renderer canvaskit` for better performance

## 🎓 Learning Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Riverpod Documentation](https://riverpod.dev/)
- [Material Design 3](https://m3.material.io/)
- [Flutter Web Deployment](https://docs.flutter.dev/deployment/web)

## 📞 Support

For questions or issues:
- Check Flutter documentation
- Search Stack Overflow
- Open GitHub issue (if forked)

---

**Last Updated**: December 2024
**Flutter Version**: 3.10.0+
**Dart Version**: 3.10.0+
