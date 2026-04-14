<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

Import the entry library you need instead of deep `lib/src/...` paths:

| Library | Contents |
|--------|----------|
| `skyapp_flutter_core.dart` | `AppConfig`, `SkyappFlutterCore`, environment, `ApiEndpoints` |
| `skyapp_foundation.dart` | Errors, pagination models, JWT, logger, `FxControllerMixin` |
| `skyapp_theme.dart` | Fx theme tokens, `ThemeController` |
| `skyapp_widgets.dart` | Fx widgets, `ScreenUtil`, validators, formatters |
| `skyapp_network.dart` | `ApiClient`, services, Firebase client, interceptors |
| `skyapp_auth.dart` | Auth flows, controllers, email/phone widgets |
| `skyapp_notifications.dart` | Notifications |
| `skyapp_profile.dart` | Profile |
| `skyapp_all.dart` | Re-exports all of the above (prefer granular imports in large apps) |

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
