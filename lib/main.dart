import 'package:flutter/material.dart';
import 'package:privertenotes/Views/login_view.dart';
import 'package:privertenotes/Views/register_view.dart';
import 'package:privertenotes/Views/verify_email_view.dart';
import 'package:privertenotes/constants/routes.dart';
import 'package:privertenotes/services/auth/auth_service.dart';
import 'Views/note_view.dart';
import 'firebase_options.dart';
import 'dart:developer' as devtool show log;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomePage(),
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        notesRoute: (context) => const NotesView(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
      }));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                devtool.log("Email is verified");
                return const NotesView();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }

          // if (user?.emailVerified ?? false) {
          //   print("You are a verified user");
          // } else {
          //   print("You need to verify your email first");
          //   return const VerifyEmailView();
          // }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
