import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nust_bot/Screens/signup/ui/verify_email.dart';
import 'package:nust_bot/Screens/splashScreen/ui/splash_screen.dart';
import 'package:nust_bot/utils/const.dart';
// import 'package:national_lawyer_assistant/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyA150C_xujUTKJI4e8YLe88Z3_YwRkZKdc",
      appId: "1:1079374371576:android:fdc286ba3f50c5d6b5390d",
      messagingSenderId: "1079374371576",
      projectId: "nust-bot",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // User? user = FirebaseAuth.instance.currentUser;

          // String signInMethod = "Unknown";
          // if (user != null) {
          //   for (var userInfo in user.providerData) {
          //     switch (userInfo.providerId) {
          //       case 'google.com':
          //         signInMethod = "Google Sign-In";
          //         break;
          //       case 'password':
          //         signInMethod = "Email/Password Sign-In";
          //         break;
          //       case 'phone':
          //         signInMethod = "Phone Sign-In";
          //         break;
          //     }
          //   }
          // }

          if (snapshot.connectionState == ConnectionState.active) {
            return SplashScreen();
            // if (snapshot.hasData) {
            //   if (signInMethod == "Phone Sign-In") {
            //     return SplashScreen();
            //   } else if (!(user?.emailVerified ?? true)) {
            //     print("verify");
            //     return SplashScreen();
            //     // return SplashScreen(widget: VerifyEmailPage());
            //   } else if (user?.emailVerified ?? false) {
            //     print("verified");
            //     return SplashScreen();
            //   } else {
            //     print("Login");
            //     return SplashScreen();
            //     // return SplashScreen(widget: LoginPage());
            //   }
            // } else {
            //   print("1235");
            //   //  return SplashScreen(widget: LoginPage());
            //   return SplashScreen();
            // }
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
          surface: surface,
          primary: primary,
          onPrimary: onPrimary,
          secondary: secondary,
          onSecondary: onSecondary,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(color: Colors.black),
          displayMedium: TextStyle(color: Colors.black),
          displaySmall: TextStyle(color: Colors.black),
          headlineLarge: TextStyle(color: Colors.black),
          headlineMedium: TextStyle(color: Colors.black),
          headlineSmall: TextStyle(color: Colors.black),
          titleLarge: TextStyle(color: Colors.black),
          titleMedium: TextStyle(color: Colors.black),
          titleSmall: TextStyle(color: Colors.black),
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
          bodySmall: TextStyle(color: Colors.black),
          labelLarge: TextStyle(color: Colors.black),
          labelMedium: TextStyle(color: Colors.black),
          labelSmall: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
