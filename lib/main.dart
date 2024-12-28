// ignore_for_file: prefer_single_quotes

import 'dart:io';

import 'package:asroo/asroo_store_app.dart';
import 'package:asroo/core/app/env.variables.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EnvVariables.instance.init(envType: EnvTypeEnum.dev);

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: 'AIzaSyBsEQFQJftRbgI_wwc03jwGDyeoh-VKTDI',
            appId: '1:711822578692:android:277c139f12b5c2444b9151',
            messagingSenderId: "711822578692",
            projectId: "asroo-store-50098",
          ),
        )
      : await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  ).then((_) {
    runApp(const AsrooStoreApp());
  });
}
