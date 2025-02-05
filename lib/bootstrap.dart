import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:m11_ind/firebase_options.dart';

import 'core/core.dart';


Future<void> bootstrap(void Function() runApp) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, 
    DeviceOrientation.portraitDown,
  ]);
  await _initInjector();
  await _initFirebase();
  _setupErrorHandling(runApp);
}

Future<void> _initInjector() async {
  if(kDebugMode) {
    await FlutterBluePlus.setLogLevel(LogLevel.verbose, color: true);
  }
  await configureDependencies(env: Environment.prod);
  await Future.wait([
    if(kDebugMode)...[
      register(Urls.test()), 
    ] else...[
      register(Urls.test()),  
    ],
    register(AppLogger()),
  ]);
}

Future<void> _initFirebase() async {
  if(Platform.isMacOS) return;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  if (kDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  }
}

void _setupErrorHandling(void Function() runApp) {
  if(Platform.isMacOS) return runApp();
  Isolate.current.addErrorListener(
    RawReceivePort((List<dynamic> pair) async {
      try {
        final List<dynamic> errorAndStacktrace = pair;
        await FirebaseCrashlytics.instance.recordError(
          errorAndStacktrace.first,
          errorAndStacktrace.last as StackTrace,
        );
      } on Exception catch (e, st) {
        $logger.error('[Running isolate error]', e, st);
      }
    }).sendPort,
  );

  runZonedGuarded<Future<void>>(
    () async {
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      runApp();
    },
    FirebaseCrashlytics.instance.recordError,
  );
}
