import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/views/home_page.dart';
import 'package:firebase_project/views/signin_page.dart';
import 'package:flutter/material.dart';

/*
Note:
Changed Gradle to 5.6.1 
gradle/gradle-wrapper.properties

Created Firebase App
Added 
App level build.gradle
multiDexEnabled true
implementation 'com.android.support:multidex:1.0.3' (in dependencies)
apply plugin: 'com.google.gms.google-services' (at last)

project level build.gradle
classpath 'com.google.gms:google-services:4.3.4' (in dependencies)

 */

Future<void> main() async {

  /* Note: await should be below of WidgetsFlutterBinding */
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: "Signup",
      home: SignInPage(), 
    );
  }
}
