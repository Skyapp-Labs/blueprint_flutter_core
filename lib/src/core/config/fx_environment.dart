/// Defines the deployment environments for the app.
enum Environment {
  /// Development environment. Used for local development.
  development,
  /// Staging environment. Used for testing.
  staging,
  /// Production environment. Used for production.
  production;

  static Environment get current {
		const flavor = String.fromEnvironment('FLAVOR', defaultValue: 'development');
		switch (flavor.toLowerCase()) {
			case 'staging': return Environment.staging;
			case 'production': return Environment.production;
			default: return Environment.development;
		}
	}

  bool get isStaging => current == Environment.staging;
  bool get isProduction => current == Environment.production;
  bool get isDevelopment => current == Environment.development;
}
