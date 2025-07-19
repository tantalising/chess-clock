# Chess Clock App

A simple, elegant, and functional Chess Clock application built with Felgo (Qt Quick). This app provides two interactive timers for chess players, along with features for setting custom game times and resetting the match.

## Features

- **Two Player Clocks:** Dedicated timers for White and Black players.

- **Touch Interaction:** Tap on a player's clock to stop their timer and start the opponent's.

- **Customizable Time:** Set the total game time in minutes via a dedicated menu.

- **Move Counter:** Tracks the number of moves made by the White player.

- **Visual State Indication:** Clocks visually desaturate when paused or inactive.

- **Reset Functionality:** Easily reset the game timers and move count to start a new match.

- **Responsive Design:** Adapts to different screen sizes and orientations (portrait-focused).

## Technologies Used

- **Felgo SDK (Qt Quick / QML):** For cross-platform UI development.

- **Qt 6:** The underlying framework providing graphics, UI, and core functionalities.

- **Qt5Compat.GraphicalEffects:** Used for visual effects like desaturation.

## Project Structure

The project consists of the following QML components:

- `Main.qml`: The main application entry point, setting up the Felgo `App`, `NavigationStack`, and orchestrating the `ClockFace` and `ClockTimer` components. It also includes the logic for the time input dialog and reset button.

- `ClockFace.qml`: A reusable visual component representing a single player's clock. It displays minutes, seconds, and milliseconds, player name, and move count. It handles visual states like rotation and desaturation based on its `clockTimer`'s activity.

- `ClockTimer.qml`: A non-visual, reusable component that manages the core timer logic. It provides properties for minutes, seconds, and milliseconds, and methods to `start()`, `stop()`, `reset()`, and `resetOnTimeUp()`. It emits a `timeUp()` signal when the countdown finishes.

- `config.json`: The Felgo project configuration file, defining app title, identifier, orientation, and version.

## How to Run

1. **Install Felgo SDK:** If you don't have it already, download and install the Felgo SDK from the [official website](https://felgo.com/download "null").

2. **Open in Qt Creator:** Open the project folder in Qt Creator (which comes bundled with Felgo).

3. **Ensure Modules are Installed:** Verify that the `Qt5Compat.GraphicalEffects` module is installed for your Qt 6 version via the Felgo Maintenance Tool.

4. **Build and Run:** Select your desired kit (e.g., Desktop, Android, iOS) and click the "Run" button in Qt Creator.

## Usage

- **Start/Pause:** The clocks start counting down when the app launches. Tap on a player's clock to stop their timer and start the opponent's.

- **Reset Game:** Tap the "Replay" icon button (circular arrow) in the center bottom of the screen to reset both clocks to their initial time and clear the move count.

- **Change Time:**
  
  1. Tap the "Menu" (hamburger) icon in the top-right corner of the navigation bar.
  
  2. Select "Change Time" from the drawer.
  
  3. Enter a positive integer for the new game time in minutes.
  
  4. Tap "OK" to apply the new time and reset the game.

## Customization

- **Initial Time:** Modify the `totalTime` property on `mainPage` in `Main.qml` to change the default starting time.

- **Colors:** Adjust the `_whitePallete` and `_blackPallete` properties in `ClockFace.qml` to customize the clock face colors.

- **Icons:** Change `iconType` properties in `Main.qml` for buttons using Material Design icon names (e.g., "access_time", "replay", "menu", "info").

## Contribution

Feel free to fork this repository, suggest improvements, or submit pull requests.

**Note:** This project is a demonstration of QML and Felgo capabilities
