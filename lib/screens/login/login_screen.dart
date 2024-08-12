import 'package:flutter/material.dart';
import 'package:post_api/ApiServices/api_service.dart';
import 'package:post_api/Models/login_model.dart';
import 'package:post_api/screens/login/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  LoginModel loginModel = LoginModel();
  bool isReady = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: email,
              decoration: const InputDecoration(hintText: 'enter email'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: password,
              decoration: const InputDecoration(hintText: 'enter password'),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isReady = true;
                  });
                  //with Model
                  // ApiService().loginPostWithModel(email.text, password.text).then((
                  //     value) {
                  //   setState(() {
                  //     loginModel = value!;
                  //     Navigator.push(context, MaterialPageRoute(
                  //         builder: (context) =>
                  //             HomeScreen(token: loginModel.token.toString()),),);
                  //   });
                  // });

                  // without Model
                  ApiService()
                      .loginPostWOutModel(email.text, password.text)
                      .then((value) {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                HomeScreen(token: value!["token"].toString()),
                          ));
                    });
                  });
                },
                child: isReady
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
