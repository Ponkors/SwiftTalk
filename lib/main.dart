import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:swift_talk/app/swift_talk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dataDI.initDependencies();
  appDi.initDependencies();
  runApp(const SwiftTalkApp());
}