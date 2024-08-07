import 'package:contact_list_flutter_application/screens/signup.dart';
import 'package:contact_list_flutter_application/screens/contact_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var auth=FirebaseAuth.instance;
  var islogin=false;

  checkiflogin() async
  {
    auth.authStateChanges().listen((User? user) { 
      if (user != null && mounted){
        setState(() {
          islogin = true;
        });
    }});
  }

  @override
  void initState()
  {
    checkiflogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      // FirebaseAuth.instance.currentUser?.uid == null
      !islogin
          ? Signup()
          : Contactlist(
              email: FirebaseAuth.instance.currentUser!.email.toString(),
            ),
    );
  }
}
