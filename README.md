# Polartern Assignment - Flutter

## Overview

This Flutter project is developed as part of the Polartern Coding Challenge. The application showcases a home screen with an event-themed layout, including a carousel slider, event details, RSVP functionality, and a feature to capture and share screenshots.

## Features

- **Carousel Slider**: Displays images in a carousel format at the top of the home screen.
- **Event Details**: Includes event title, date, time, cost, location, and a brief description.
- **RSVP Functionality**: Allows users to RSVP for the event using a slide button.
- **Screenshot and Share**: Users can capture the screen and share it directly from the app.

## Technologies Used

- **Flutter**: The app is built using the Flutter framework.
- **screenshot**: To capture the screen content.
- **share_plus**: To share the captured screenshot via different apps.
- **path_provider**: To store the captured screenshot temporarily before sharing.

## Snapshots


https://github.com/user-attachments/assets/cfe796d2-14a1-40db-ad3f-8ccfc3f857e5




## Installation and Setup

### Prerequisites

- Ensure that you have Flutter installed on your system. If not, follow the [official installation guide](https://flutter.dev/docs/get-started/install).

### Steps to Setup

1. **Clone the Repository and Navigate to the project directory**

   ```bash
   git clone https://github.com/YasinzHyper/Polartern-Assignment.git
   cd polartern_assignment
   ```

2. **Install Dependencies**

   Navigate to the project directory and run the following command to install the required dependencies:

   ```bash
   flutter pub get
   ```

3. **Run the App**

   You can run the app using the following command:

   ```bash
   flutter run
   ```

   Alternatively, you can open the project in your preferred IDE (like Android Studio or VSCode) and use the built-in Flutter tools to run the app on an emulator or physical device.

## Project Structure

```plaintext
polartern_assignment/
│
├── assets/
│   ├── images/
│   │   └── avatar.png
│   └── ... (other assets)
│
├── lib/
│   ├── src/
│   │   ├── widgets/
│   │   │   ├── CarouselSlider.dart
│   │   │   └── DetailCard.dart
│   │   └── screens/
│   │       └── HomeScreen.dart
│   └── main.dart
│
├── pubspec.yaml
└── README.md
```

### Key Files

- **`main.dart`**: Entry point of the application.
- **`HomeScreen.dart`**: Contains the main UI for the home screen, including the carousel slider, event details, and RSVP functionality.
- **`CarouselSlider.dart`**: Widget to display images in a carousel format.
- **`DetailCard.dart`**: Widget to display event details like date, time, cost, and location.

## Usage

- **RSVP**: Slide the button at the bottom to RSVP for the event.
- **Share**: Tap the share icon at the top right to capture the screen and share it using the available sharing options.

## Screenshots

Include any screenshots here to visually demonstrate the app's UI.

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests to improve the app.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contact

For any questions or inquiries, please contact [myasinzuhayr@gmail.com].

