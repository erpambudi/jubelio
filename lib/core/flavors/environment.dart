import 'build_config.dart';
import 'env_config.dart';

enum Environment { development, production }

void env(Environment environment) {
  const String prod = "https://codetesting.jubelio.store/wp-json/wc/v3";

  const String dev = "https://codetesting.jubelio.store/wp-json/wc/v3";

  EnvConfig config = environment == Environment.production
      ? EnvConfig(
          appName: "Jubelio",
          baseUrl: prod,
          shouldCollectCrashLog: true,
        )
      : EnvConfig(
          appName: "Jubelio Dev",
          baseUrl: dev,
          shouldCollectCrashLog: true,
        );

  BuildConfig.instantiate(envType: environment, envConfig: config);
}
