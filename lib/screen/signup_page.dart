import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_signin/google_auth/google_auth_services.dart';
import 'package:flutter_signin/screen/signin_page.dart';

class SignUpPage extends HookWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    var isloading = useState(false);

    Future<void> signUp() async {
      isloading.value = true;

      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      }

      isloading.value = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  )),
              const SizedBox(
                height: 8,
              ),
              TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: "password",
                    border: OutlineInputBorder(),
                  )),
              const SizedBox(
                height: 8,
              ),
              TextButton(onPressed: signUp, child: const Text("SignUp")),
              if (isloading.value) const CircularProgressIndicator(),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Spacer(),
                  const Text("Already have an account"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInPage()));
                      },
                      child: const Text("SignIn"))
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await GoogleAuthServices.signInWithGoogle();
                  },
                  child: const Text("Signin with Google"))
            ],
          ),
        ),
      ),
    );
  }
}
