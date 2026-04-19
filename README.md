# blueprint_flutter_core

A modular Flutter core package that provides a complete foundation for scalable apps — covering theming, UI widgets, authentication flows, networking, push notifications, and profile management.

---

## Features

| Module | What it gives you |
|--------|------------------|
| **Core** | App configuration contract, root `BlueprintFlutterCore` widget, `ProviderScope` wiring, environment helpers, paginated models, JWT utilities, structured logging |
| **Theme** | Abstract `FxTheme` / `FxColors` / `FxSizes` / `FxTypography` contracts, Material 3 `ThemeData` builder, persistent `ThemeController` (light / dark / system) |
| **Widgets** | 30+ `Fx`-prefixed widgets: buttons, text fields, phone/PIN input, select & search fields, avatars, list tiles, bottom sheets, dialogs, snackbars, loaders, empty states, rich `FxText` with tappable spans |
| **Network** | Pre-configured `Dio` client, `TokenManager`, `AuthInterceptor`, `ErrorInterceptor`, `LogInterceptor`, request-queuing on 401, base `AppService` class |
| **Auth** | Full email (login / register / forgot-password) and phone OTP flows with built-in UI widgets (`FxEmailAuth`, `FxPhoneAuth`), Riverpod controllers, secure token storage |
| **Notifications** | Firebase push notifications, device registration, `NotificationController`, `FxNotificationTile` |
| **Profile** | `ProfileController`, `ProfileService`, `FxProfileAvatar` |

---

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  blueprint_flutter_core:
    git:
      url: https://github.com/Skyapp-Labs/blueprint_flutter_core.git
      ref: main
```

Then run:

```sh
flutter pub get
```

---

## Getting Started

### 1. Implement `AppConfig`

Create your app-specific configuration by extending `AppConfig`:

```dart
// lib/config/app_config.dart
import 'package:blueprint_flutter_core/blueprint_flutter_core.dart';
import 'package:blueprint_flutter_core/blueprint_auth.dart';

class MyAppConfig extends AppConfig {
  @override
  String get appName => 'My App';

  @override
  String get apiBaseUrl => 'https://api.myapp.com';

  @override
  String get apiVersion => 'v1';

  @override
  AuthMethod get authMethod => AuthMethod.email; // or AuthMethod.phone

  @override
  bool get enableFirebase => true;

  @override
  bool get enableNotifications => true;
}
```

### 2. Bootstrap with `BlueprintFlutterCore`

Wrap your app with `BlueprintFlutterCore` in `main.dart`. It sets up `ProviderScope` and makes `appConfigProvider` available throughout the tree:

```dart
import 'package:flutter/material.dart';
import 'package:blueprint_flutter_core/blueprint_flutter_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    BlueprintFlutterCore(
      config: MyAppConfig(),
      child: const MyApp(),
    ),
  );
}
```

### 3. Build the Theme

Extend the four abstract theme classes to wire your brand into Material 3. Then pass the built `ThemeData` to `MaterialApp`:

```dart
// lib/theme/app_theme.dart
import 'package:blueprint_flutter_core/blueprint_theme.dart';

class AppTheme extends FxTheme {
  @override FxColors      get appColors     => AppColors();
  @override FxSizes       get appSizes      => AppSizes();
  @override FxTypography  get appTypography => AppTypography(colors: appColors, sizes: appSizes);
  @override FxThemeData   get appThemeData  => AppThemeData(
    colors: appColors, sizes: appSizes, typography: appTypography);
}
```

```dart
// lib/app.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:blueprint_flutter_core/blueprint_theme.dart';
import 'package:blueprint_flutter_core/blueprint_widgets.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeControllerProvider);
    final appTheme  = AppTheme();

    return MaterialApp.router(
      themeMode: themeMode,
      theme:     appTheme.build(Brightness.light),
      darkTheme: appTheme.build(Brightness.dark),
      routerConfig: appRouter,
      builder: (context, child) {
        // Initialise the responsive sizing utility once.
        ScreenUtil.init(context, designWidth: 390, designHeight: 844);
        return child ?? const SizedBox.shrink();
      },
    );
  }
}
```

---

## Usage

### Barrel Imports

Always import via the library barrels — never use deep `src/` paths:

| Library | Use for |
|---------|---------|
| `package:blueprint_flutter_core/blueprint_flutter_core.dart` | Config, environment, errors, pagination models, JWT, logger, `BlueprintFlutterCore` |
| `package:blueprint_flutter_core/blueprint_theme.dart` | Theme tokens, `ThemeController` |
| `package:blueprint_flutter_core/blueprint_widgets.dart` | Fx widgets, `ScreenUtil`, validators, formatters |
| `package:blueprint_flutter_core/blueprint_network.dart` | `ApiClient`, services, Firebase client, interceptors |
| `package:blueprint_flutter_core/blueprint_auth.dart` | Auth flows, controllers, email/phone widgets |
| `package:blueprint_flutter_core/blueprint_notifications.dart` | Notifications |
| `package:blueprint_flutter_core/blueprint_profile.dart` | Profile |

---

### Theme

#### Implement the four abstract classes

```dart
// app_colors.dart
class AppColors extends FxColors {
  const AppColors({super.brightness});

  @override
  AppColors copyWith({Brightness? brightness}) =>
      AppColors(brightness: brightness ?? this.brightness);

  @override
  FxColorMode get primaryMode => const FxColorMode(
    light: Color(0xFF4F46E5),
    dark:  Color(0xFF818CF8),
  );

  @override FxColorMode get onPrimaryMode     => const FxColorMode(light: Colors.white,          dark: Color(0xFF1E1B4B));
  @override FxColorMode get secondaryMode     => const FxColorMode(light: Color(0xFF7C3AED),    dark: Color(0xFFA78BFA));
  @override FxColorMode get onSecondaryMode   => const FxColorMode(light: Colors.white,          dark: Color(0xFF2E1065));
  @override FxColorMode get errorMode         => const FxColorMode(light: Color(0xFFDC2626),    dark: Color(0xFFF87171));
  @override FxColorMode get onErrorMode       => const FxColorMode(light: Colors.white,          dark: Color(0xFF7F1D1D));
  @override FxColorMode get backgroundMode    => const FxColorMode(light: Color(0xFFF9FAFB),   dark: Color(0xFF0F172A));
  @override FxColorMode get onBackgroundMode  => const FxColorMode(light: Color(0xFF111827),   dark: Color(0xFFF1F5F9));
  @override FxColorMode get surfaceMode       => const FxColorMode(light: Colors.white,         dark: Color(0xFF1E293B));
  @override FxColorMode get onSurfaceMode     => const FxColorMode(light: Color(0xFF111827),   dark: Color(0xFFF1F5F9));
  @override FxColorMode get surfaceVariantMode=> const FxColorMode(light: Color(0xFFE0E7FF),   dark: Color(0xFF334155));
  @override FxColorMode get outlineMode       => const FxColorMode(light: Color(0xFFE2E8F0),   dark: Color(0xFF334155));
  @override FxColorMode get shadowMode        => const FxColorMode(light: Color(0x1A000000),   dark: Color(0x33000000));
  @override FxColorMode get successMode       => const FxColorMode(light: Color(0xFF16A34A),   dark: Color(0xFF4ADE80));
  @override FxColorMode get warningMode       => const FxColorMode(light: Color(0xFFD97706),   dark: Color(0xFFFBBF24));
  @override FxColorMode get infoMode          => const FxColorMode(light: Color(0xFF0284C7),   dark: Color(0xFF38BDF8));
  @override FxColorMode get textPrimaryMode   => const FxColorMode(light: Color(0xFF111827),   dark: Color(0xFFF1F5F9));
  @override FxColorMode get textSecondaryMode => const FxColorMode(light: Color(0xFF6B7280),   dark: Color(0xFF94A3B8));
  @override FxColorMode get textDisabledMode  => const FxColorMode(light: Color(0xFFD1D5DB),   dark: Color(0xFF475569));
  @override FxColorMode get textInverseMode   => const FxColorMode(light: Colors.white,         dark: Color(0xFF0F172A));
}
```

```dart
// app_sizes.dart — all values come from FxSizes defaults (ScreenUtil-scaled)
class AppSizes extends FxSizes {
  AppSizes();

  @override
  AppSizes copyWith() => AppSizes();
}
```

```dart
// app_typography.dart
class AppTypography extends FxTypography {
  const AppTypography({required super.colors, required super.sizes});

  @override String get headlineFontFamily => 'YourFont';
  @override String get bodyFontFamily     => 'YourFont';

  @override AppTypography copyWith({FxColors? colors, FxSizes? sizes}) =>
      AppTypography(colors: colors ?? this.colors, sizes: sizes ?? this.sizes);

  @override TextStyle get headlineLarge => TextStyle(fontSize: sizes.text4xl, fontWeight: FontWeight.w700, color: colors.textPrimary);
  @override TextStyle get bodyMedium    => TextStyle(fontSize: sizes.textMd,  fontWeight: FontWeight.w400, color: colors.textPrimary);
  // … implement all 16 TextStyle getters
}
```

```dart
// app_theme_data.dart — override sub-theme getters as needed
class AppThemeData extends FxThemeData {
  const AppThemeData({required super.colors, required super.sizes, required super.typography});

  @override
  AppThemeData copyWith({FxColors? colors, FxSizes? sizes, FxTypography? typography}) =>
      AppThemeData(
        colors:     colors     ?? this.colors,
        sizes:      sizes      ?? this.sizes,
        typography: typography ?? this.typography,
      );

  // Optional: override any sub-theme, e.g.:
  // @override ElevatedButtonThemeData get elevatedButtonTheme => ...
}
```

#### Toggle dark mode

```dart
// In any ConsumerWidget
ref.read(themeControllerProvider.notifier).toggleDark();
// or
ref.read(themeControllerProvider.notifier).setThemeMode(ThemeMode.dark);
```

---

### Widgets

Access theme tokens inside any widget via the `FxUiToolkit` mixin:

```dart
class MyWidget extends StatelessWidget with FxUiToolkit {
  MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context); // call once at the top of build

    return Text('Hello', style: typography.headlineSmall);
  }
}
```

**Available getters:** `theme`, `colorScheme`, `colors`, `sizes`, `typography`, `isDarkMode`, `screenWidth`, `screenHeight`, `isPhone`, `isTablet`, plus navigation helpers (`push`, `pop`, `pushReplace`, `pushAndClearStack`) and overlay helpers (`showFxBottomSheet`, `showFxDialog`).

#### Buttons

```dart
// Primary (full-width by default)
FxButton(label: 'Continue', onPressed: () {}),

// Variants
FxButton(label: 'Cancel',  variant: FxButtonVariant.outline,    onPressed: () {}),
FxButton(label: 'Delete',  variant: FxButtonVariant.danger,     onPressed: () {}),
FxButton(label: 'Skip',    variant: FxButtonVariant.secondary,  onPressed: () {}),
FxButton(label: 'Link',    variant: FxButtonVariant.text,       onPressed: () {}),

// Loading state
FxButton(label: 'Saving…', isLoading: true, onPressed: () {}),

// With icon, not full-width
FxButton(
  label: 'Upload',
  isFullWidth: false,
  prefixIcon: const Icon(Icons.upload_outlined, size: 18),
  onPressed: () {},
),
```

#### Text Fields

```dart
FxTextField(
  label: 'Email',
  hint: 'you@example.com',
  keyboardType: TextInputType.emailAddress,
  prefixIcon: const Icon(Icons.mail_outline_rounded),
  validator: (v) => Validators.email(v),
),

FxTextField(
  label: 'Password',
  obscureText: true,                  // adds visibility toggle automatically
  validator: (v) => Validators.password(v),
),

FxSearchField(
  hint: 'Search…',
  debounceMs: 400,
  onChanged: (query) => search(query),
),
```

#### Select Field

```dart
FxSelectField<Country>(
  label: 'Country',
  selectedValue: _selectedCountry,
  data: FxSelectFieldData<Country>(
    items: countries,
    labelBuilder: (c) => c.name,
    leadingBuilder: (c, size) => FxCountryFlag(isoCode: c.code, size: size),
  ),
  onChanged: (country, _) => setState(() => _selectedCountry = country),
  onSearch: (query, items) => query == null
      ? items
      : items.where((c) => c.name.toLowerCase().contains(query.toLowerCase())).toList(),
),
```

#### Layout

```dart
FxScaffold(
  appBar: AppBar(title: const Text('My Screen')),
  body: Column(children: [...]),
  // padding defaults to sizes.md on all sides; override as needed
  padding: EdgeInsets.symmetric(horizontal: sizes.md),
),
```

#### Overlays

```dart
// Bottom sheet
showFxBottomSheet(
  data: FxOverlayData(
    title: 'Choose option',
    builder: (ctx) => MySheetContent(),
  ),
);

// Dialog
showFxDialog(
  data: FxOverlayData(
    title: 'Confirm',
    builder: (ctx) => MyDialogContent(),
  ),
);

// List-driven bottom sheet (built-in search + selection)
showFxBottomSheet<String>(
  data: FxOverlayData(
    title: 'Select a city',
    list: FxOverlayListData<String>(
      items: cities,
      titleTextBuilder: (c) => c,
      onSearch: (q, items) => q == null ? items : items.where((c) => c.contains(q)).toList(),
    ),
  ),
);
```

#### Snackbars

```dart
FxSnackbar.show(context, message: 'Saved!',        type: FxSnackbarType.success);
FxSnackbar.show(context, message: 'Network error', type: FxSnackbarType.error);
FxSnackbar.show(context, message: 'Heads up',      type: FxSnackbarType.warning);
FxSnackbar.show(context, message: 'FYI',           type: FxSnackbarType.info);
```

#### Display

```dart
// Avatar with initials fallback
FxAvatar(name: 'Alice Johnson', radius: 24),
FxAvatar(imageUrl: 'https://…/photo.jpg', radius: 20, showOnlineIndicator: true),

// List tile
FxListTile(
  leading: FxAvatar(name: user.fullName, radius: 20),
  title: user.fullName,
  subtitle: user.email,
  onTap: () => push('/profile/${user.id}'),
),

// Empty state
FxEmptyState(
  icon: const Icon(Icons.inbox_outlined),
  title: 'No messages yet',
  subtitle: 'When you receive a message, it will appear here.',
  actionLabel: 'Compose',
  onAction: () {},
),

// Rich text with tappable spans (wrap words in [ ])
FxText(
  'By continuing you agree to our [Terms] and [Privacy Policy].',
  onTap: (index, text) {
    if (index == 0) openTerms();
    if (index == 1) openPrivacyPolicy();
  },
),
```

#### Responsive sizing

```dart
// After ScreenUtil.init(context) in your MaterialApp builder:
SizedBox(width: 16.w, height: 48.h)
Text('Hello', style: TextStyle(fontSize: 14.sp))
BorderRadius.circular(8.r)
```

---

### Network

#### Define a service

```dart
import 'package:blueprint_flutter_core/blueprint_network.dart';

class PostsService extends AppService {
  PostsService(super.context);

  Future<List<Post>> getPosts() async {
    final response = await dio.get(endpoints.custom('posts'));
    return (response.data['data'] as List).map(Post.fromJson).toList();
  }
}
```

#### Provide the service with Riverpod

```dart
@riverpod
PostsService postsService(Ref ref) {
  return PostsService(ref.watch(serviceContextProvider));
}
```

The `serviceContextProvider` wires the authenticated `Dio` instance (with `AuthInterceptor` for automatic token refresh) and your `ApiEndpoints` into every service automatically.

---

### Authentication

#### Email flow

Drop `FxEmailAuth` anywhere in your widget tree. The controller and all state management are handled internally:

```dart
import 'package:blueprint_flutter_core/blueprint_auth.dart';
import 'package:blueprint_flutter_core/blueprint_widgets.dart';

FxEmailAuth(
  onAuthSuccess: () => context.go('/home'),
  theme: const FxEmailAuthTheme(
    loginConfig: LoginConfig(
      title: 'Welcome back',
      subtitle: 'Sign in to continue',
      buttonLabel: 'Sign In',
    ),
    registerConfig: RegisterConfig(
      title: 'Create account',
      subtitle: 'Fill in your details',
      buttonLabel: 'Create Account',
    ),
  ),
),
```

Steps handled automatically: **Login → Register → Forgot Password** (request PIN → verify PIN → reset password).

#### Phone OTP flow

```dart
FxPhoneAuth(
  onAuthSuccess: () => context.go('/home'),
  theme: const FxPhoneAuthTheme(
    phoneEntryConfig: PhoneEntryConfig(
      title: 'Enter your number',
      subtitle: "We'll send you a verification code",
      buttonLabel: 'Send Code',
    ),
    otpVerificationConfig: OtpVerificationConfig(
      title: 'Verify your number',
      subtitle: 'Enter the code sent to {{phone}}',
      otpLength: 6,
      resendCooldownSeconds: 60,
    ),
    userDetailsConfig: UserDetailsConfig(
      title: 'Complete your profile',
      requireEmail: false,
    ),
  ),
),
```

Steps handled automatically: **Enter phone → OTP verification → User details** (for new users).

#### Reading auth state

```dart
// In any ConsumerWidget
final authState = ref.watch(authControllerProvider);

if (authState.isAuthenticated) {
  print(authState.user?.fullName);
}

// Sign out
ref.read(authControllerProvider.notifier).signOut();
```

---

### Notifications

```dart
import 'package:blueprint_flutter_core/blueprint_notifications.dart';

// In a ConsumerWidget
final state = ref.watch(notificationControllerProvider);

// Load notifications
ref.read(notificationControllerProvider.notifier).loadNotifications();

// Mark as read
ref.read(notificationControllerProvider.notifier).markAsRead(notificationId);

// Built-in tile
FxNotificationTile(notification: state.notifications.first),
```

---

### Profile

```dart
import 'package:blueprint_flutter_core/blueprint_profile.dart';

// Access profile
final profile = ref.watch(profileControllerProvider).user;

// Update profile
await ref.read(profileControllerProvider.notifier).updateProfile(
  ProfileUpdate(firstName: 'Alice', lastName: 'Johnson'),
);

// Avatar widget
FxProfileAvatar(radius: 40),
```

---

### Validators

```dart
import 'package:blueprint_flutter_core/blueprint_widgets.dart';

TextFormField(
  validator: (v) => Validators.email(v),
)

// Available: required, email, phone, password, confirmPassword, minLength, maxLength
Validators.confirmPassword(confirmValue, originalValue)
Validators.minLength(value, 8)
```

---

### Formatters

```dart
import 'package:blueprint_flutter_core/blueprint_widgets.dart';

DateFormatter.format(DateTime.now(), pattern: 'dd MMM yyyy')  // → '19 Apr 2026'
DateFormatter.relative(DateTime.now().subtract(Duration(hours: 2))) // → '2 hours ago'

NumberFormatter.currency(1234.5, symbol: '\$')  // → '$1,234.50'
NumberFormatter.compact(1500000)                // → '1.5M'

TextFormatter.initials('Alice Johnson')  // → 'AJ'
TextFormatter.truncate('Long text…', 20)
```

---

## Example App

A full working example lives in the [`example/`](./example) directory. It demonstrates:

- `BlueprintFlutterCore` bootstrap and `AppConfig` implementation
- Complete `FxTheme`, `FxColors`, `FxSizes`, `FxTypography`, `FxThemeData` implementation
- Light / dark mode toggle persisted across launches
- Email and phone auth flows side-by-side
- Comprehensive widget showcase (buttons, inputs, select, overlays, display, feedback)

Run it with:

```sh
cd example
flutter run
```

---

## Architecture

```
lib/
├── blueprint_flutter_core.dart   # Core: config, errors, models, JWT, logger
├── blueprint_theme.dart          # Theme tokens + ThemeController
├── blueprint_widgets.dart        # All Fx* widgets, ScreenUtil, validators, formatters
├── blueprint_network.dart        # Dio client, interceptors, AppService
├── blueprint_auth.dart           # Auth module (email + phone)
├── blueprint_notifications.dart  # Push notifications
└── blueprint_profile.dart        # User profile
```

Each module is independently importable — only add what your app needs.

---

## Additional Information

- **Issues & feature requests:** [GitHub Issues](https://github.com/Skyapp-Labs/blueprint_flutter_core/issues)
- **Contributing:** PRs are welcome. Please open an issue first for major changes.
- **License:** See [LICENSE](./LICENSE)
