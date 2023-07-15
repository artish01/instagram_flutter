import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:instagram_flutter/responsive/mobile_screen_layout.dart';
// import 'package:instagram_flutter/responsive/responsive_layout_screen.dart';
// import 'package:instagram_flutter/responsive/web_screen_layout.dart';
import 'package:instagram_flutter/screens/login_screen.dart';
import 'package:instagram_flutter/screens/signup_screen.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyBnJb9K-VLyMZDopQSblKm-NOG49fpiUQw',
          appId: '1:715807981686:web:7dc9a2819a1548a6515f57',
          messagingSenderId: '715807981686',
          projectId: 'instagram-clone-93168',
          storageBucket: 'instagram-clon e-93168.appspot.com'),
    );
  }
   else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram_clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ), 
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
    
      // ),  
      home: const SignUpScreen(),
    );
  }
}
