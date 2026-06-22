# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 2.4.0

### Added

**Routing**
- Package-owned router via `fxRouterProvider` with auth and security listeners and a chained redirect pipeline (`FxRouterRedirect`).
- `FxRoutingConfig` on `FxConfig.routing` for splash, login, home, auth paths, optional `postRegistrationPath`, and optional `pinUnlockPath`.
- `FxConfig.isPostRegistrationComplete(User)` — apps override the predicate that decides when post-registration onboarding is done (default: `user.onboardingStep >= 2`).
- `FxHomeGuard` — redirects authenticated users on home routes to post-registration or PIN gates in order; post-registration is user-backed, PIN is session-backed.
- `FxAuthGuard` moved to `lib/src/core/routing/guards/` and updated to accept `FxRoutingConfig`.
- `fxAppRoutesProvider` — apps supply the route tree; `BlueprintFlutterCore` accepts `appRoutes` and wires the provider automatically.
- `fxRouterRedirectHookProvider` — optional app hook for redirects after foundation guards.

**Security**
- `PinService` with API-backed `hasPin`, `createPin`, and `verifyPin` flows.
- `PinStatusDto` — server-driven PIN status (`isSet`, `isLocked`, `type`, `length`).
- `SecurityState.isSessionUnlocked` — in-memory session flag set on successful PIN verification; consumed by `FxHomeGuard`.
- `SecurityState.pinType` and expanded `PinStepView` values (`confirmCreatePin`, `confirmChangePin`).
- PIN API endpoints on `FxApiEndpoints`: `createPin`, `verifyPin`, `resetPin`, `pinStatus(type)`.
- `FxRequestHeaders.pinLengthOptions()` for `X-PIN-Length` on PIN API calls.
- `LockScreen` accepts `pinType` and `onUnlocked`; calls `checkPinStatus` on init to route to create or verify PIN.

**Auth**
- `AuthState.isNewUser` — set when tokens are applied after registration.
- `AuthFlowScreen.onAuthSuccess` now receives `(User user, bool isNewUser)`.
- `FxConfig.otpLength` — sent as `X-OTP-Length` on OTP API calls via `OtpService`.

**Example app**
- Uses `fxRouterProvider` instead of a local `app_router`.
- `AppConfig` implements `FxRoutingConfig` with `pinUnlockPath` and optional `postRegistrationPath`.
- Home access sample routes: `/home/onboarding` and `/home/unlock`.

### Changed

**Routing**
- Post-registration gating reads live `User` data from `AuthController`; no local onboarding controller/state required.
- PIN gating is enabled when `routing.pinUnlockPath` is set (replaces `pinAuthenticationEnabled` flag).

**Security**
- `SecurityController` refactored around `PinService`: `checkPinStatus`, `onVerifyPin`, `onCreatePin`, and confirm-PIN validation.
- PIN views and `LockScreen` driven by server-reported PIN length and step from `PinStatusDto`.

**Auth**
- `AuthController.applyTokens` parameter renamed `isRegistered` → `isNewUser`.
- OTP send/verify/resend pass `otpLength` from `FxConfig` through `OtpService`.

**Example app**
- `BlueprintFlutterCore` bootstraps with `config` + `appRoutes`; `MaterialApp.router` watches `fxRouterProvider`.
- `AuthScreen.onAuthSuccess` navigates to home; guards handle onboarding/PIN redirects.

### Removed

- Example `app_router.dart` / `app_router.g.dart` (replaced by package `fxRouterProvider`).
- `FxConfig.pinAuthenticationEnabled` — use `routing.pinUnlockPath != null` instead.
- `FxConfig.pinLength` — PIN length is now returned by the PIN status API.

## 2.3.1

### Fixed

**Auth**
- OTP step now displays verification errors under the PIN input when `verifyOtp` fails.
- `OtpStepController` guards async flows with `ref.mounted`, awaits `result.when`, and prevents duplicate submissions while loading.
- OTP input clears errors when the user re-enters digits via `onOtpChanged`.

**Widgets & Inputs**
- `FxPinInput` sets `forceErrorState` when `errorText` is provided so `pinput` shows external/async validation errors correctly.

**Security**
- `LockScreen` and PIN views accept a configurable `length` (default 4).
- Security PIN entry uses `obscureText` for masked input.

### Changed

- `OtpStepTemplate` exposes `otpLength` (default 6); `OtpStepScreen` uses it for `FxPinInput.length`.

## 2.3.0

### Added

**Security**
- New `blueprint_security` entry point with `SecurityController`, `LockScreen`, and PIN views (`create_pin`, `verify_pin`, `change_pin`, `reset_pin`).
- `LockScreen.asDialog()` for modal app-lock flows.

**Widgets & Inputs**
- `FxKeyboard` and `FxKeyboardTheme` for custom numeric keypad input.
- `FxPinInput` rebuilt on top of the `pinput` package with theme support via `FxThemeData.pinInputTheme`.
- `FxViewTransitionTheme` and `FxComponentTheme.switchingViewTransition()` for auth step animations.
- `FxOverlayThemeData` and expanded `FxOverlayTileThemeData` for overlay styling.

**Auth**
- `AuthFlowScreen.onAuthSuccess` now receives the authenticated `User`.
- `FxPhoneInputConfig` groups phone-input options (layout, field options, overlay type).
- `FxSignupFormGroup` and signup step form controls for structured registration fields.

**Example app**
- Full example restructure: splash, auth, dashboard shell, home, and notification screens.
- GoRouter-based routing with `app_router`, `app_paths`, and `app_routes`.
- Dashboard dock/drawer navigation samples with custom styles.

### Changed

**Auth**
- Refactored `AuthStepTemplate` and step screens to use `buildShell(context:, ref:, …)` — templates no longer hold `BuildContext` or `WidgetRef`.
- Auth step transitions use `AnimatedSwitcher` with configurable slide transitions.
- Consolidated signup step behind `FxSignupFormGroup` and `SignupStepController`.

**Widgets & Overlays**
- Refactored `FxBottomSheetShell` and `FxDialog` around `FxOverlayOptions`.
- `FxSelectField` adds `valueBuilder` for custom selected-value labels.
- `FxPinInputTheme` simplified and wired into `FxThemeData`.

**Theme**
- Extended `FxComponentTheme` with checkbox, search, and clear icons.
- `FxThemeData` exposes `pinInputTheme`, `overlayTheme`, and `overlayTileTheme`.

**Example & tooling**
- Example iOS deployment target raised to 15.0; Firebase wired via direct Swift Package Manager dependencies.
- Example theme files expanded (`app_colors`, `app_typography`, `app_theme_data`).
- Removed obsolete `scripts/release.sh`.

### Removed

- `FxOtpInput` widget (use `FxPinInput` instead).
- `FxPinInputController` and `FxPinInputField` (replaced by `pinput`-backed `FxPinInput`).
- Legacy `example/lib/ui/home_screen.dart`.

### Dependencies

- Added `pinput: ^6.0.2`.

## 2.2.0

### Added

**Auth**
- Implemented forgot password functionality with new state management and UI templates.
- Enhanced authentication flow with new step templates.

**Widgets & Forms**
- Introduced `FxPhoneInputTheme` and `FxFormControl` classes.
- Added new input field components and enhanced existing widgets with new options and themes.

**Networking & Core**
- Introduced `FxError` and `FxResult` classes for improved error handling and response management.

### Changed

**Auth**
- Refactored authentication flow existing steps for improved structure.
- Updated `EmailStepScreen` layout to use `body` parameter.
- Updated phone input formatting logic and consolidated auth module exports.

**Widgets & UI**
- Refactored input field components for improved usability and theme management.
- Updated icon path handling across multiple categories for consistency and maintainability.

**Networking**
- Enhanced `FxAuthInterceptor` to normalize public endpoint paths and improve token handling.

## 2.1.0

### Added

**Widgets**

- `FxCounterBadge` and `FxCounterText` widgets.
- `FxEmptyState` widget for handling empty data UI states.
- `FxRefreshView` layout widget to implement pull-to-refresh functionality easily.
- `FxNotificationIconButton` and `FxNotificationPageView` widgets in the notifications module.

**Auth**

- Added new styling models for Phone Auth: `FxPhoneEntryStyle`, `FxOtpEntryStyle`, `FxRegisterEntryStyle`.

### Changed

- Restructured `FxPhoneAuth` steps into internal components (`_phone_entry.dart`, `_otp_entry.dart`, `_register_entry.dart`).
- Removed `FxPhoneAuthTheme` in favor of individual component styles.

### Refactoring (Breaking)

**Notifications**

- Renamed notification module files and classes to use `Fx` prefix:
  - `NotificationController` → `FxNotificationController`
  - `NotificationState` → `FxNotificationState`
  - `NotificationService` → `FxNotificationService`
  - `AppNotification` → `FxNotification`
  - `DeviceRegistration` → `FxDeviceRegistration`

## 2.0.0

### Breaking

**Networking**

- Rename public networking types to the `Fx` prefix:
  - `ApiClient` → `FxApiClient`
  - `TokenManager` → `FxTokenManager`
  - `AppService` → `FxService`
  - `ServiceContext` → `FxServiceContext`
  - `AuthInterceptor` → `FxAuthInterceptor`
  - `LogInterceptor` → `FxLogInterceptor`
  - `FirebaseClient` → `FxFirebaseClient`
- Rename `api_endpoints.dart` → `fx_api_endpoints.dart` (update deep imports if used)
- Riverpod: `dioProvider` → `fxDioProvider`, `serviceContextProvider` → `fxServiceProvider`
- `FxControllerMixin.serviceContext` returns `FxServiceContext` from `fxServiceProvider`
- Update `blueprint_flutter_core.dart` and `blueprint_network.dart` imports/exports
- Stop exporting `ErrorInterceptor`, `ErrorMapper`, `RefreshCoordinator`, and `PendingRequestHandler` (private `part` files of `FxAuthInterceptor`)
- Remove `ErrorInterceptor` (401 refresh + error mapping live in `FxAuthInterceptor`)

**Theme**

- Rename theme source files: `base_colors.dart`, `base_sizes.dart`, `base_theme.dart`, `base_theme_data.dart`, `base_typography.dart` → `fx_colors.dart`, `fx_sizes.dart`, `fx_theme.dart`, `fx_theme_data.dart`, `fx_typography.dart`
- Update `blueprint_theme.dart` export paths (type names such as `FxColors` are unchanged)

**Routing**

- `AuthGuard` → `FxAuthGuard` (`blueprint_flutter_core.dart` export path updated)
- Default `publicPaths` now includes `'/'` in addition to splash and login

**Controllers**

- Remove `FxState` helper base class from `fx_controller_mixin.dart` (was a `part` file)

**Widgets**

- `FxTextDivider`: remove `isDotted`; add `align`; `dashWidth`, `dashSpace`, and `strokeWidth` are required `double`s with new defaults; divider rendering logic updated

### Added

**App shell** (exported from `blueprint_widgets.dart`)

- `FxShell`, `FxShellScope`, `FxShellStyle` — post-login scaffold with pane body switching
- `FxPane`, `FxSite`, `FxPaneState`, `FxPaneType`, `FxPaneDividerStyle`, `FxShellAnimation`
- `FxDock`, `FxDockStyle` — bottom navigation dock
- `FxDrawer`, `FxDrawerStyle` — side drawers
- `FxShellCtrl` and `fxShellCtrlProvider` — pane registry and navigation (`goToPane`, `panesFor`, `syncFromWidget`)

**Widgets**

- `FxReveal`, `FxRevealPreferred`, `FxRevealTransitions` — animated show/hide for chrome (e.g. app bar)
- `FxTile`, `FxTileView` — tile list / navigation helpers
- `FxAppBarStyle` and `FxAppBar.fromStyle`
- `FxScaffold`: `FxSafeAreaInsets`, full `Scaffold` parity (drawers, bottom sheet, FAB location, `extendBody`, restoration, etc.), optional `systemUiOverlayStyle`; `padding: EdgeInsets.zero` skips padding; `safeArea: null` disables `SafeArea`
- `FxUiToolkit.shellScope` on `FxShellScope`

**Networking**

- `FxHeadersInterceptor` — `X-Request-Id`, `X-Correlation-Id`, `X-Client-Trace-Id`, `Accept-Language`, `User-Agent`, `X-API-Version`, `X-Environment`; optional `X-Tenant-Id` / `X-Org-Id` from `FxConfig`; optional `Idempotency-Key` via `Options.extra[FxRequestExtras.idempotencyKey]`
- `FxService`, `FxServiceContext`
- `FxConfig`: `apiUserAgent`, `clientVersion`, `tenantId`, `orgId`

**Auth**

- `AuthUser.roles` (`List<String>`, default `[]`)
- `JwtHelper.roles(String token)`

**Utilities**

- `TextFormatter.maskPhoneNumber` for masked phone display

**Dependencies**

- `easy_copy_with_annotation` (runtime)
- `easy_copy_with` (dev) — used for shell style `copyWith` codegen

### Changed

- `FxApiClient` interceptor order: `FxHeadersInterceptor` → `FxLogInterceptor` → `FxAuthInterceptor`
- Auth refresh and error mapping consolidated in `FxAuthInterceptor`
- `AuthController`, auth/email/phone auth, notification, and profile services use `Fx*` networking types
- `FxCore` and `NotificationController` use `FxFirebaseClient`
- `FxScrollableForm` and `FxPhoneAuthTheme` layout/theming adjustments
- Example app updated for `FxAuthGuard` and related APIs

### Removed

- `ErrorInterceptor`
- `app_service.dart`, `service_context.dart` (replaced by `fx_service.dart`, `fx_service_context.dart`)
- `fx_state.dart` (`FxState` base class)
- Theme `base_*.dart` files (replaced by `fx_*.dart`)

### Migration

**Providers and services**

```dart
ref.read(fxDioProvider);
ref.read(fxServiceProvider);

class MyService extends FxService {
  MyService(super.ctx);
}
```

**Auth redirect**

```dart
redirect: (context, state) => FxAuthGuard.redirect(
  authState: ref.read(authControllerProvider),
  location: state.uri.toString(),
  loginPath: '/login',
  homePath: '/home',
);
```

**Idempotency (mutating requests)**

```dart
dio.post('/path', data: body, options: Options(
  extra: {FxRequestExtras.idempotencyKey: 'stable-key'},
));
```

**Theme imports**

```dart
// Before
import 'package:blueprint_flutter_core/src/core/theme/base_colors.dart';

// After
import 'package:blueprint_flutter_core/blueprint_theme.dart';
// or
import 'package:blueprint_flutter_core/src/core/theme/fx_colors.dart';
```

## 1.0.2

- Add `flutter_libphonenumber` dependency
- Enhance phone input handling
