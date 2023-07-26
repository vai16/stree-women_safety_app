import 'package:flutter/material.dart';
import 'package:stree/getstarted.dart';
import 'package:stree/homescreen.dart';
import 'package:stree/login_screen.dart';
import 'package:stree/otp_confirmation.dart';
import 'package:stree/services/RoutingService.dart';
import 'package:stree/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //title: 'Stree',
        theme: ThemeData(primaryColor: Colors.white),
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/getstarted': (context) => GettingStartedScreen(),
          '/otpscreen': (context) => OTPConfirmationPage(),
          '/loginscreen': (context) => LoginScreen(),
          '/homescreen': (context) => HomeScreen()
        }
        //home: RouteBasedOnAuth(),
        );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text('Welcome'),
      ),
    );
  }
}
