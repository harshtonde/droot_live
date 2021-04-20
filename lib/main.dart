import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth/firebase_user_provider.dart';
import 'package:droot/sign_up/sign_up_widget.dart';
import 'package:droot/home_page/home_page_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DrootFirebaseUser>(
      stream: drootFirebaseUser,
      initialData: drootFirebaseUser.value,
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'droot',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: snapshot.data.when(
            user: (_) => HomePageWidget(),
            loggedOut: () => SignUpWidget(),
            initial: () => Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4b39ef)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
