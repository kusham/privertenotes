import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtool show log;

import 'package:privertenotes/constants/routes.dart';

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
        const Text(
            "We've sent you an email verification. Please open it to verify your email"),
        const Text(
            "If you haven't received verification email yet, press the button"),
        TextButton(
            onPressed: () async {
              final user = FirebaseAuth.instance.currentUser;
              devtool.log(user.toString());

              await user?.sendEmailVerification();
            },
            child: const Text("send email verification")),
        TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              // ignore: use_build_context_synchronously
              Navigator.of(context).pushNamedAndRemoveUntil(
                registerRoute,
                (route) => false,
              );
            },
            child: const Text("Restart"))
      ]),
    );
  }
}
