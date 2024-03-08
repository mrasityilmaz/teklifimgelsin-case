// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

class _Env {
  static const List<int> _enviedkeyapiKey = [436088199, 555711277, 2264919201];
  static const List<int> _envieddataapiKey = [436088300, 555711304, 2264919256];
  static final String apiKey = String.fromCharCodes(
    List.generate(_envieddataapiKey.length, (i) => i, growable: false)
        .map((i) => _envieddataapiKey[i] ^ _enviedkeyapiKey[i])
        .toList(growable: false),
  );
}
