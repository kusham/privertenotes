import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:privertenotes/Views/login_view.dart';
import 'package:privertenotes/Views/register_view.dart';

import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomePage(),
      routes: {
        "/login": (context) => const LoginView(),
        "/register": (context) => const RegisterView(),
      }));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            // final user = FirebaseAuth.instance.currentUser;
            // if (user?.emailVerified ?? false) {
            //   print("You are a verified user");
            // } else {
            //   print("You need to verify your email first");
            //   return const VerifyEmailView();
            // }
            return const LoginView();
          default:
            return const Text("Loading...");
        }
      },
    );
  }
}

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verify Email")),
      body: Column(children: [
        const Text("Please verify your email : "),
        TextButton(
            onPressed: () async {
              final user = FirebaseAuth.instance.currentUser;
              print(user);

              await user?.sendEmailVerification();
            },
            child: const Text("send email verification"))
      ]),
    );
  }
}
