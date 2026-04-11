# foundation/

> ⚠️ **Do not edit any file in this folder or any of its subfolders.**
>
> This layer is blueprint-managed. Editing it will cause merge conflicts when the blueprint is updated. All customisation happens in `lib/app/` via the contract pattern.

For the full guide on how to use everything this folder provides, see [`FOUNDATION.md`](../../FOUNDATION.md).

---

## What's Inside

```
foundation/
├── core/          ← pure infrastructure, no feature knowledge
│   ├── config/    ← AppConfig + FirebaseConfig abstract contracts
│   ├── network/   ← Dio client, interceptors, token manager, Firebase client
│   ├── errors/    ← AppException, NetworkException, UnauthorizedException
│   ├── models/    ← PaginatedResponse<T>, PaginationMeta, FileRef
│   ├── theme/     ← BaseColors, BaseTypography, BaseSizes, BaseTheme
│   ├── utils/     ← logger, validators, jwt_helper, screen_util, formatters
│   └── widgets/   ← all Fx* components (buttons, inputs, display, feedback, layout)
│
└── modules/       ← feature logic: controllers, services, models, auth widgets
    ├── auth/      ← full auth flow for phone OTP and email+password
    ├── notifications/ ← FCM registration, notification list management
    └── profile/   ← GET/PATCH /users/me
```

---

## Dependency Direction

```
app/ → foundation/modules/ → foundation/core/
```

Nothing in `foundation/` ever imports from `app/`. The flow is strictly one-way.

---

## How It Stays Up To Date

When this blueprint publishes an update:

1. You pull the changes
2. Only `lib/foundation/` files are updated
3. Your `lib/app/` files are never touched
4. No merge conflicts

This only works if `lib/foundation/` is never modified. If you have a genuine need to change foundation behaviour, open an issue on the blueprint repository instead.

---

→ Full usage guide: [`FOUNDATION.md`](../../FOUNDATION.md) | Back to [project root](../../README.md)
