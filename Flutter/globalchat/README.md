# 🌍 GlobalChat

A modern real-time chat application built with Flutter and Firebase, featuring a clean UI with dark/light theme support.

## ✨ Features

- 🔐 **Firebase Authentication** - Secure user authentication
- 💬 **Real-time Messaging** - Instant messaging powered by Cloud Firestore
- 🎨 **Theme Support** - Dynamic dark/light theme switching with persistent preferences
- 📱 **Cross-Platform** - Supports Android, iOS, Web, Windows, Linux, and macOS
- 🎥 **Video Support** - Integrated video player with Chewie
- 🎯 **Material 3 Design** - Modern UI with Material Design 3
- 🔤 **Custom Typography** - Poppins font family integration
- 📦 **State Management** - Provider pattern for efficient state management

## 🛠️ Tech Stack

- **Framework:** Flutter 3.x
- **Language:** Dart (SDK >=3.4.4 <4.0.0)
- **Backend:** Firebase (Authentication, Cloud Firestore)
- **State Management:** Provider
- **Local Storage:** Shared Preferences
- **Video Player:** Chewie & Video Player
- **HTTP Client:** Dio
- **UI:** Material 3 with custom Poppins font

## 📋 Prerequisites

Before you begin, ensure you have the following installed: 
- Flutter SDK (3.x or higher)
- Dart SDK (3.4.4 or higher)
- Android Studio / Xcode (for mobile development)
- A Firebase project set up

## 🚀 Getting Started

### 1. Clone the repository

```bash
cd Flutter/globalchat
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Firebase Setup

This project is already configured with Firebase.  The configuration files are located at:
- `lib/firebase_options.dart` - Firebase configuration for Android and iOS

If you want to use your own Firebase project: 
1. Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/)
2. Enable Authentication and Cloud Firestore
3. Run `flutterfire configure` to generate your own `firebase_options.dart`

### 4. Add Assets

Ensure you have the following assets in place:
- Place images in `assets/images/`
- Place the Poppins font file at `assets/fonts/poppins. ttf`

### 5. Run the app

```bash
flutter run
```

## 📁 Project Structure

```
lib/
├── controllers/     # Business logic and controllers
├── providers/       # State management providers (UserProvider, etc.)
├── screens/        # UI screens (SplashScreen, etc.)
├── widgets/        # Reusable widget components
├── firebase_options.dart  # Firebase configuration
└── main.dart       # Application entry point
```

## 🔑 Key Components

### Theme Management
The app supports dynamic theme switching between dark and light modes. Theme preference is persisted using Shared Preferences and managed through the `UserProvider`.

### Firebase Integration
- **Authentication:** User sign-in and sign-up
- **Cloud Firestore:** Real-time chat message storage and retrieval
- **Storage:** User data and chat history

### State Management
Uses Provider pattern for: 
- Theme mode management
- User state management
- Real-time data updates

## 📦 Dependencies

```yaml
dependencies:
  firebase_core: ^3.3.0
  firebase_auth: ^5.2.0
  cloud_firestore: ^5.3.0
  provider: ^6.1.2
  shared_preferences: ^2.3.2
  video_player: ^2.9.1
  dio: ^5.7.0
  chewie: ^1.8.4
  cupertino_icons: ^1.0.6
```

## 🎨 Customization

### Changing Theme
The app automatically applies the user's preferred theme (dark/light). The theme is managed through the `UserProvider` and persisted across app sessions.

### Adding Custom Fonts
The project uses Poppins font.  To add more fonts, update the `pubspec.yaml`:

```yaml
fonts:
  - family: YourFont
    fonts:
      - asset: assets/fonts/yourfont.ttf
```

## 🔧 Building for Production

### Android
```bash
flutter build apk --release
# or
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

### Desktop (Windows/Linux/macOS)
```bash
flutter build windows --release
flutter build linux --release
flutter build macos --release
```

## 🧪 Testing

Run tests with: 
```bash
flutter test
```

## 📱 Platform Support

| Platform | Status |
|----------|--------|
| Android  | ✅     |
| iOS      | ✅     |
| Web      | ✅     |
| Windows  | ✅     |
| Linux    | ✅     |
| macOS    | ✅     |

## 🤝 Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is private and not published to pub.dev. 

## 👤 Author

**f8th**

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for backend services
- Material Design for UI inspiration

---

**Note:** This is a Flutter project.  Make sure you have Flutter installed and configured properly before running the application.
