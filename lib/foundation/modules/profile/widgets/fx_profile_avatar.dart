import 'package:flutter/material.dart';
import '../../../core/widgets/display/fx_avatar.dart';
import '../../auth/core/models/user.dart';

/// Avatar widget that displays the current user's photo or initials,
/// with an optional upload tap handler.
class FxProfileAvatar extends StatelessWidget {
  const FxProfileAvatar({
    super.key,
    required this.user,
    this.onUploadTap,
    this.radius = 40,
  });

  final AuthUser user;
  final VoidCallback? onUploadTap;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final avatar = FxAvatar(name: user.fullName, radius: radius);

    if (onUploadTap == null) return avatar;

    return Stack(
      children: [
        avatar,
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: onUploadTap,
            child: CircleAvatar(
              radius: 14,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Icon(
                Icons.camera_alt,
                size: 14,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
