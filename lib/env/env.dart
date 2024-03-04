import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
abstract class Env {
  ///
  /// varName is the name of the variable in the .env file
  ///
  @EnviedField(varName: 'keyName', obfuscate: true)
  static final String apiKey = _Env.apiKey;
}
