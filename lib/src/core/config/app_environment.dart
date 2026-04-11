/// Defines the deployment environments for the app.
enum AppEnvironment {
  /// Development environment. Used for local development.
  development,
  /// Staging environment. Used for testing.
  staging,
  /// Production environment. Used for production.
  production;

  static AppEnvironment get current {
		const flavor = String.fromEnvironment('FLAVOR', defaultValue: 'development');
		switch (flavor.toLowerCase()) {
			case 'staging': return AppEnvironment.staging;
			case 'production': return AppEnvironment.production;
			default: return AppEnvironment.development;
		}
	}

  bool get isStaging => current == AppEnvironment.staging;
  bool get isProduction => current == AppEnvironment.production;
  bool get isDevelopment => current == AppEnvironment.development;
}
