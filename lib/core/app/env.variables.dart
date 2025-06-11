import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvTypeEnum { dev, prod }

class EnvVariable {
  EnvVariable._();

  static final EnvVariable instance = EnvVariable._();

  String _envType = '';
  String _deviceToken = '';
  String _urlEndpoint = '';

  // Add Google service account variables
  String _googleType = '';
  String _googleProjectId = '';
  String _googlePrivateKeyId = '';
  String _googlePrivateKey = '';
  String _googleClientEmail = '';
  String _googleClientId = '';
  String _googleAuthUri = '';
  String _googleTokenUri = '';
  String _googleAuthProviderX509CertUrl = '';
  String _googleClientX509CertUrl = '';
  String _googleUniverseDomain = '';

  Future<void> init({required EnvTypeEnum envType}) async {
    switch (envType) {
      case EnvTypeEnum.dev:
        await dotenv.load(fileName: '.env.dev');
      case EnvTypeEnum.prod:
        await dotenv.load(fileName: '.env.prod');
    }

    _envType = dotenv.get('ENV_TYPE');
    _deviceToken = dotenv.get('DEVICE_TOKEN');
    _urlEndpoint = dotenv.get('URL_ENDPOINT');

    _googleType = dotenv.get('GOOGLE_TYPE');
    _googleProjectId = dotenv.get('GOOGLE_PROJECT_ID');
    _googlePrivateKeyId = dotenv.get('GOOGLE_PRIVATE_KEY_ID');
    _googlePrivateKey = dotenv.get('GOOGLE_PRIVATE_KEY');
    _googleClientEmail = dotenv.get('GOOGLE_CLIENT_EMAIL');
    _googleClientId = dotenv.get('GOOGLE_CLIENT_ID');
    _googleAuthUri = dotenv.get('GOOGLE_AUTH_URI');
    _googleTokenUri = dotenv.get('GOOGLE_TOKEN_URI');
    _googleAuthProviderX509CertUrl = dotenv.get(
      'GOOGLE_AUTH_PROVIDER_X509_CERT_URL',
    );
    _googleClientX509CertUrl = dotenv.get('GOOGLE_CLIENT_X509_CERT_URL');
    _googleUniverseDomain = dotenv.get('GOOGLE_UNIVERSE_DOMAIN');
  }

  bool get debugMode => _envType == 'dev';
  String get deviceToken => _deviceToken;
  String get urlEndpoint => _urlEndpoint;
  String get googleType => _googleType;
  String get googleProjectId => _googleProjectId;
  String get googlePrivateKeyId => _googlePrivateKeyId;
  String get googlePrivateKey => _googlePrivateKey;
  String get googleClientEmail => _googleClientEmail;
  String get googleClientId => _googleClientId;
  String get googleAuthUri => _googleAuthUri;
  String get googleTokenUri => _googleTokenUri;
  String get googleAuthProviderX509CertUrl => _googleAuthProviderX509CertUrl;
  String get googleClientX509CertUrl => _googleClientX509CertUrl;
  String get googleUniverseDomain => _googleUniverseDomain;

  Map<String, dynamic> get getGoogleServiceAccount => {
    'type': _googleType,
    'project_id': _googleProjectId,
    'private_key_id': _googlePrivateKeyId,
    // Replace escaped \n with real newlines for the private key
    'private_key': _googlePrivateKey.replaceAll(r'\n', '\n'),
    'client_email': _googleClientEmail,
    'client_id': _googleClientId,
    'auth_uri': _googleAuthUri,
    'token_uri': _googleTokenUri,
    'auth_provider_x509_cert_url': _googleAuthProviderX509CertUrl,
    'client_x509_cert_url': _googleClientX509CertUrl,
    'universe_domain': _googleUniverseDomain,
  };

  String get getGoogleServiceAccountJson {
    return jsonEncode(getGoogleServiceAccount);
  }
}
