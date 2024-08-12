import 'package:flutter/material.dart';
import 'package:post_api/ApiServices/register_api.dart';
import 'package:post_api/Models/register_model.dart';
import 'package:post_api/screens/Register/register_home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  RegisterModel registerModel = RegisterModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: email,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: password,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(height: 40,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  RegisterApi()
                      .register(email.text, password.text)
                      .then((value) {
                    setState(() {
                      registerModel = value!;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RegisterHomeScreen(
                            id: registerModel.id.toString(),
                            token: registerModel.token.toString(),
                          ),
                        ),
                      );
                    });
                  }).onError((error,stackTrace){
                    print('error while fetching data: ${error.toString()}');
                  });
                },
                child: const Text('Register'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
