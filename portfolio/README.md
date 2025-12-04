# Flutter Portfolio App

A professional, modern, and responsive portfolio application built with Flutter, showcasing mobile and web development skills.

## 🎨 Features

- **Responsive Design**: Adapts seamlessly to desktop (≥1200px), tablet (768-1199px), and mobile (<768px) screens
- **Material3 Design**: Modern UI with custom color palette and glassmorphism effects
- **Dark Mode**: Toggle between light and dark themes
- **Smooth Animations**: 150-300ms micro-interactions and page transitions
- **Sections**:
  - Hero section with animated entrance
  - About section with career highlights
  - Featured projects with detail modals
  - Experience timeline
  - Skills with progress indicators
  - Contact form with validation
  - Responsive footer

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.10.0 or higher)
- Dart SDK
- A code editor (VS Code, Android Studio, or IntelliJ IDEA)

### Installation

1. Clone or download this repository
2. Navigate to the project directory:
   ```bash
   cd portfolio
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

### Running the App

#### Web (Recommended for portfolio preview)
```bash
flutter run -d chrome
```

#### Desktop
```bash
# macOS
flutter run -d macos

# Windows
flutter run -d windows

# Linux
flutter run -d linux
```

#### Mobile
```bash
# iOS (requires macOS and Xcode)
flutter run -d ios

# Android
flutter run -d android
```

## 📦 Building for Production

### Web
```bash
flutter build web --release
```
The output will be in `build/web/` directory. Deploy this folder to any static hosting service (Firebase Hosting, Netlify, Vercel, GitHub Pages, etc.).

### Desktop
```bash
# macOS
flutter build macos --release

# Windows
flutter build windows --release

# Linux
flutter build linux --release
```

### Mobile
```bash
# Android APK
flutter build apk --release

# Android App Bundle (for Play Store)
flutter build appbundle --release

# iOS (requires macOS and Xcode)
flutter build ios --release
```

## 🎨 Customization

### Update Personal Information

Edit `lib/data/portfolio_data.dart` to customize:
- Personal info (name, email, LinkedIn, GitHub)
- About highlights
- Projects
- Experience
- Skills
- Social links

### Update Theme Colors

Edit `lib/utils/theme.dart` to change:
- Color palette
- Typography
- Button styles
- Input decoration

### Add Project Images

Place your project images in `assets/images/` and update the `imagePath` in `portfolio_data.dart`.

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point
├── app.dart                  # Main app widget
├── data/
│   └── portfolio_data.dart   # Portfolio data models and sample data
├── pages/
│   └── home_page.dart        # Main home page
├── providers/
│   └── theme_provider.dart   # Theme state management
├── utils/
│   ├── breakpoints.dart      # Responsive breakpoints
│   ├── responsive_widget.dart # Responsive wrapper
│   └── theme.dart            # Theme configuration
└── widgets/
    ├── about_section.dart
    ├── contact_form.dart
    ├── contact_section.dart
    ├── experience_section.dart
    ├── footer.dart
    ├── header.dart
    ├── hero_section.dart
    ├── mobile_drawer.dart
    ├── project_card.dart
    ├── project_detail_modal.dart
    ├── projects_section.dart
    └── skills_section.dart
```

## 📦 Dependencies

- `flutter_riverpod` - State management
- `google_fonts` - Typography (Inter font)
- `url_launcher` - Open external links
- `flutter_svg` - SVG support
- `animations` - Page transitions
- `responsive_framework` - Responsive utilities

## 🌐 Deployment

### Firebase Hosting
```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login

# Initialize Firebase in your project
firebase init hosting

# Build and deploy
flutter build web --release
firebase deploy
```

### Netlify
1. Build the web app: `flutter build web --release`
2. Drag and drop the `build/web` folder to Netlify
3. Or connect your Git repository for automatic deployments

### GitHub Pages
1. Build the web app: `flutter build web --release`
2. Copy contents of `build/web` to your GitHub Pages repository
3. Push to GitHub

## 🎯 Browser Support

- Chrome (recommended)
- Firefox
- Safari
- Edge

## 📱 Mobile Support

- iOS 11.0+
- Android 5.0+ (API level 21+)

## 🤝 Contributing

This is a personal portfolio project, but feel free to fork and customize it for your own use!

## 📄 License

This project is open source and available under the MIT License.

## 👤 Author

**Aryan Sontakke**
- Email: aryan.sontakke@example.com
- LinkedIn: [linkedin.com/in/aryan-sontakke](https://www.linkedin.com/in/aryan-sontakke)
- GitHub: [github.com/aryansontakke](https://github.com/aryansontakke)

---

Built with Flutter 💙
