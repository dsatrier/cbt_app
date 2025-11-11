## Repo snapshot for AI assistants

This is a small Flutter mobile app (package name: `test_drive`, app title: "Sleep App"). The UI entrypoint is `lib/main.dart`. Pages live in `lib/pages/` and are implemented as StatefulWidgets (e.g., `LoginPage`, `FirstPage`). The app uses Navigator with MaterialPageRoute for navigation (no centralized named routes file).

Keep changes minimal and idiomatic. Prefer small, focused edits and preserve existing style (GoogleFonts usage, color constants inside pages, Material components).

## High-level architecture
- Platform: Flutter (Dart SDK in `pubspec.yaml`), single app targeting mobile (Android/iOS), desktop folders present but code is Flutter-centric.
- Entry: `lib/main.dart` — shows a `SplashScreen` that always navigates to `LoginPage`.
- UI: `lib/pages/*` contains page widgets (e.g., `login_page.dart`, `first_page.dart`, `onboarding_page.dart`). Navigation is handled with `Navigator.of(context).pushReplacement(MaterialPageRoute(...))`.
- Local persistence: `shared_preferences` is used for local state (streak tracking, saved options). Keys to be aware of: `currentStreak`, `totalDaysCompleted`, `lastCompletedDate`, `lastCheckDate`, `selectedOptions`, `userName`.

## Key patterns & conventions (use these exactly)
- File layout: add new screens under `lib/pages/` and import with `package:test_drive/pages/<name>.dart`.
- Styling: The project prefers `google_fonts` (Poppins) via `GoogleFonts.poppins()` for typography. Keep using that for new UI text.
- State & flow: Use `SharedPreferences` for persistent counters/flags. When modifying these flows, mirror the project's approach (set flags like `wasPreviousDayCompleted` then clear them) rather than re-architecting.
- Navigation: Use explicit MaterialPageRoute push/pushReplacement (do not introduce a global Route generator unless requested).

## Dependencies to reference
- `percent_indicator` — used in `FirstPage` for progress UI.
- `google_fonts` — app font (Poppins) everywhere.
- `shared_preferences` — persistent local data for streaks, progress and small settings.
These are listed in `pubspec.yaml` at the repo root.

## Concrete examples an AI may need
- To follow navigation flow: Splash -> Login -> Onboarding -> FirstPage. For example, `lib/main.dart` navigates from `SplashScreen` to `LoginPage` with `Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c)=>const LoginPage()))`.
- SharedPreferences usage (streaks): see `lib/pages/first_page.dart` for patterns: load with `SharedPreferences.getInstance()`, use `prefs.getInt('currentStreak')` and `prefs.setInt('currentStreak', value)`. When resetting per-day state, the code uses `prefs.setBool('wasPreviousDayCompleted', ...)` as a transient flag — preserve this behavior.

## Developer workflows (how to build, test, and debug locally)
- Run on device/emulator: `flutter run` from repo root (ensure Flutter SDK installed).
- Build release: `flutter build apk` or `flutter build ios` on macOS.
- Run unit/widget tests: `flutter test`.
- Common debug targets: edit `lib/main.dart` or pages under `lib/pages/` and use IDE hot-reload. The project disables debug banner in `main.dart` (`debugShowCheckedModeBanner: false`).

## When changing behavior, prefer low-risk edits
- Small UI tweaks: Add new widget under `lib/pages/` and wire it using MaterialPageRoute.
- State changes: Update SharedPreferences keys in the same way other files do (load -> mutate -> save). If adding a new key, pick a clear name and check for null defaults.

## Files to inspect for context (start here)
- `lib/main.dart` — app entry and splash behavior.
- `lib/pages/login_page.dart` — login UI and the immediate navigation to onboarding.
- `lib/pages/first_page.dart` — longest page; contains persistent-state logic and progress flows (good reference for SharedPreferences usage and content model).
- `pubspec.yaml` — dependency list.

## Safety & style
- Keep consistent with existing code style: no global refactors; prefer small focused PRs. Avoid changing app-wide font/theme settings unless the change is explicitly requested.
- Tests: no tests currently target app logic; add small widget tests only if trivial and isolated.

If anything here is unclear or you'd like me to expand a section (for example add a small cookbook of common edits: "add page", "register setting", "change navigation"), tell me which part to expand and I'll iterate.
