import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin/google_auth/google_auth_services.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("HomePage"),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "${FirebaseAuth.instance.currentUser?.photoURL}")),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Hello ${FirebaseAuth.instance.currentUser?.displayName}"),
              ElevatedButton(
                  onPressed: () async {
                    await GoogleAuthServices.signOut();
                    FirebaseAuth.instance.signOut();
                  },
                  child: const Text("LogOut")),
            ],
          ),
        ));
  }
}
