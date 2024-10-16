import 'package:flutter/material.dart';
import 'package:app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:app/src/features/auth/config_firebase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);
  runApp(MyApp());
}
