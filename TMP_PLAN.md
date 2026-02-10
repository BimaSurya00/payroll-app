# IMPLEMENATION PLAN: Animated Splash Screen

## 1. Overview
We will implement a modern, minimalist Splash Screen that serves as the entry point for the "Payroll App". This screen will feature a refined animation (Fade In + Scale Up) of the application logo/brand, lasting approximately 3 seconds before automatically transitioning to the Login Page.

## 2. Technical Analysis & Requirements

### 2.1 File Structure
The project follows a "Feature-First" architecture. We will add a new feature module:
`lib/features/splash/`
  ├── `presentation/`
  │   ├── `pages/`
  │   │   └── `splash_page.dart`  <-- The main widget

### 2.2 Dependencies
- **Flutter SDK**: Standard animations (`AnimationController`, `FadeTransition`, `ScaleTransition`).
- **Assets**: We need to identify if a logo asset exists in `assets/images/`. If not, we will use a minimalist `Icon` (e.g., `Icons.work_outline`) or a styled `Text` as a placeholder until the asset is provided.
- **Navigation**: Standard `Navigator` (pushReplacement) will be used since no third-party router (like GoRouter) was observed in `pubspec.yaml`.

### 2.3 Animation Logic
- **Controller**: Single `AnimationController` with a duration of ~2.0 seconds.
- **Curves**: `CurvedAnimation` with `Curves.easeOutBack` for a "pop" effect on scaling.
- **Sequence**:
  1.  **Start (0ms)**: Logo is invisible (opacity 0) and slightly smaller (scale 0.8).
  2.  **Animate (0-2000ms)**: Logo fades to opacity 1.0 and scales to 1.0.
  3.  **Hold (2000-3000ms)**: Brief pause to let the brand sink in.
  4.  **Navigate (3000ms+)**: Transition to `LoginPage`.

## 3. Step-by-Step Implementation

### Step 1: Create Splash Page Widget
**File**: `lib/features/splash/presentation/pages/splash_page.dart`
**Details**:
- Create a `StatefulWidget` named `SplashPage`.
- Initialize `AnimationController` in `initState`.
- Define `Animation<double>` for opacity and scale.
- Implement `dispose` to clean up the controller.

### Step 2: Implement Build Method (UI)
**Details**:
- **Background**: `Colors.white` (Clean, minimalist).
- **Content**:
  - Center: `ScaleTransition` wrapping a `FadeTransition`, which wraps the Logo/Icon.
  - **Logo**: If `assets/logo.png` exists, use `Image.asset`. Otherwise, use a huge `Icon(Icons.monitor_heart, size: 100, color: primaryColor)`.
  - **Footer** (Optional but recommended for "Modern" feel): A small text at the bottom "Empowering MSMEs" with `SafeArea`.

### Step 3: Implement Navigation Logic
**Details**:
- Use a `Timer` or listen to `AnimationController` status.
- **Critical**: Use `Navigator.of(context).pushReplacement(...)` to ensure the user cannot go back to the splash screen from the Login page.
- Target: `LoginPage` (which we just created).

### Step 4: Update App Entry Point
**File**: `lib/main.dart`
**Details**:
- Change the `home` property of `MaterialApp` to `const SplashPage()`.
- Ensure `SplashPage` is imported correctly.

## 4. Verification & Testing strategy
- **Visual Check**: Run the app. Verify the logo smoothly appears and grows.
- **Timing**: Ensure the splash screen stays for roughly 3 seconds (not too short, not too long).
- **Navigation**: Verify it goes to Login.
- **Back Button**: On Login page, press Back system button. App should exit or suspend, NOT go back to Splash.

## 5. Potential Risks / Notes
- **Context Handling**: Ensure `context` is valid when the Timer triggers navigation (check `mounted` property).
- **Asset Missing**: If actual logo is missing, the fallback Icon will be used. User might need to replace this later.
