# Ripple Animation Flutter App

![Ripple Animation](https://github.com/user-attachments/assets/45002b6e-c46f-43a6-ac56-4aa1d68dc8c9)

## Overview

This Flutter application demonstrates a ripple animation effect using a custom clipper. The app displays two images that transition between each other with a circular reveal effect when tapped.

## Features

- **Ripple Animation**: A custom clipper creates a ripple effect that expands from the tap location.
- **Image Transition**: The app toggles between two images with a smooth animation.
- **Responsive Design**: The animation and layout adapt to different screen sizes.

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart: Included with Flutter

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/NijatNaghiyev/ripple_animation_flutter.git
   cd ripple_animation_flutter
   ```

2. **Install dependencies:**

   ```bash
   flutter pub get
   ```

3. **Run the app:**

   ```bash
   flutter run
   ```

## Project Structure

- **lib/screens/my_home_screen.dart**: Contains the main screen with the ripple animation.
- **lib/helpers/ripple_animation.dart**: Defines the custom clipper for the ripple effect.
- **lib/data/images.dart**: Holds the image URLs used in the app.
- **lib/mixins/my_home_screen_mixin.dart**: Provides animation functionality and state management for the home screen.

## Usage

- Tap on the image to trigger the ripple animation.
- The animation will reveal the second image and then revert back to the first image.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request for any improvements or bug fixes.


## Acknowledgments

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
