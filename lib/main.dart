// ignore_for_file: lines_longer_than_80_chars, document_ignores

import 'dart:io';

import 'package:asroo_store/asroo_store_app.dart';
import 'package:asroo_store/core/app/bloc_observer.dart';
import 'package:asroo_store/core/app/env.variables.dart';
import 'package:asroo_store/core/di/injection_container.dart';
import 'package:asroo_store/core/service/shared_pref/shared_pref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvVariable.instance.init(envType: EnvTypeEnum.dev);

  Platform.isAndroid
      ? await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey:
              'AIzaSyCYM9khQQXNldIRFFEkyZ9SfPy683TFt-w', // apiKey ==> current_key
          appId:
              '1:171888875723:android:dd8bf5f3a4079d60e6634e', // appId ==> mobile sdk_app_id
          messagingSenderId:
              '171888875723', // messagingSenderId ==> project Number
          projectId: 'asroostore-81f75',
        ),
      )
      : Firebase.initializeApp();

  await SharedPref().instantiatePreferences();

  await setupInjector();

  Bloc.observer = AppBlocObserver();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(const AsrooStoreApp());
  });
}
