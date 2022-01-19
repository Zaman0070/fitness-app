import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:life_style_app/screens/navigation_page.dart';
import 'package:sizer/sizer.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
        title: 'Life Style App',
        debugShowCheckedModeBanner: false,
        home: NavigationPage(),
      );
    });
  }
}
