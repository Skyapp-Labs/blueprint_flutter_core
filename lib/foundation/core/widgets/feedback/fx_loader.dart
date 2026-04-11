part of '_index.dart';

/// Full-screen and inline loading indicators.
class FxLoader extends StatelessWidget {
  const FxLoader({super.key, this.fullScreen = true, this.message});

  final bool fullScreen;
  final String? message;

  @override
  Widget build(BuildContext context) {
    final indicator = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircularProgressIndicator(),
        if (message != null) ...[
          const SizedBox(height: 16),
          Text(
            message!,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );

    if (!fullScreen) return indicator;

    return Scaffold(body: Center(child: indicator));
  }
}
