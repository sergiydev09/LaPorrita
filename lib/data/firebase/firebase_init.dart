import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:laporrita/data/firebase/firebase_options.dart';

Future initFirebase() => Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

getFirebaseLocations() => [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      FirebaseUILocalizations.delegate
    ];

class LabelOverrides extends DefaultLocalizations {
  const LabelOverrides();
}

