import 'package:blueprint_flutter_core/src/core/widgets/overlay/fx_overlay.dart';
import 'package:flutter/material.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  static Future<bool?> asDialog(BuildContext context) => showFxOverlay<bool, dynamic>(
    context, 
    type: FxOverlayType.dialog,
    options: FxOverlayOptions.builder(
      // title: 'Lock Screen',
      builder: (context) => LockScreen(),
    ),
  );

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Lock Screen'),
        ],
      ),
    );
  }
}