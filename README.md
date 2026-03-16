# Carzo

A premium car marketplace application built with Flutter, focusing on high performance and scalable architecture.

## Technical Stack & Architecture

- **Framework:** [Flutter](https://flutter.dev)
- **Language:** [Dart](https://dart.dev)
- **Architecture:** Clean Architecture (Domain, Data, Presentation)
- **UI Engine:** Custom design implementation with [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) for responsiveness.
- **Navigation:** Centralized Route Management system.

## Current Project Status

The project is currently in the **Core Setup & Initial UI** phase.

### Implemented Features:

- **Project Skeleton:** Established directory structure following Clean Architecture principles.
- **Core Module:** Centralized management for themes, colors, and routing helpers.
- **Get Started Flow:** Interactive onboarding experience using `PageView` and custom animations.
- **Responsive Design:** Fully adaptive UI components tailored for various screen sizes.

## Project Structure

```text
lib/
├── core/           # Universal constants, themes, and route management.
├── features/       # Feature-based modules (e.g., get_started).
│   └── data/       # Models, repositories, and data sources.
│   └── presentation/ # UI Screens, Controllers, and Widgets.
└── main.dart       # Application entry point.
```
