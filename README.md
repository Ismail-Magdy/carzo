# Carzo

A premium car marketplace application built with Flutter, focusing on high performance, clean architecture, and scalable design patterns.

## Technical Stack & Architecture

- **Framework:** [Flutter](https://flutter.dev)
- **Language:** [Dart](https://dart.dev)
- **Architecture:** Clean Architecture (Data, Manager, Presentation)
- **State Management:** [Flutter BLoC / Cubit](https://pub.dev/packages/flutter_bloc)
- **Networking:** [Dio](https://pub.dev/packages/dio) with robust Error Handling & API Models
- **Code Generation:** [Freezed](https://pub.dev/packages/freezed) for union states and immutable data classes
- **UI Engine:** Custom design implementation with [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) for pixel-perfect responsiveness.
- **Environments:** Flutter Flavors (Development & Production)
- **Distribution:** Firebase App Distribution

## Current Project Status

The project is currently in the **Active Development & Core Features** phase, moving rapidly towards full functionality.

### Implemented Features:

- **Advanced Architecture:** Established a robust directory structure using Clean Architecture principles and Dependency Injection (`get_it`).
- **Environment Setup:** Configured Flutter Flavors for isolated `development` and `production` environments, ensuring safe testing and deployment.
- **Network Layer:** Centralized API management, secure HTTP requests, and a comprehensive error-handling system (`ApiNetworkExceptions`).
- **State Management Setup:** Integrated Cubit to handle complex UI states seamlessly (Idle, Loading, Success, Failure).
- **Authentication UI:** Fully functional Login and Sign-Up interfaces with validation and state integration.
- **Complex Layouts & Navigation:** Dynamic `RootScreen` integrating a Bottom Navigation Bar alongside a fully functioning Custom Drawer without layout conflicts.
- **Dynamic Content Fetching:** "Recommend For You" feature that fetches live car data from the backend, handles loading states gracefully, and renders high-quality adaptive cards.

## Project Structure

```text
lib/
├── core/               # Universal constants, themes, networking config, DI, and route management.
├── features/           # Feature-based modules (e.g., login, root, recommend_for_you).
│   ├── data/           # Models, Repositories, and Data sources (API requests).
│   ├── manager/        # State Management logic (Cubits and Freezed States).
│   └── presentation/   # UI Screens, custom components, and widgets.
├── main_development.dart # Entry point for the Development flavor.
└── main_production.dart  # Entry point for the Production flavor.
```
