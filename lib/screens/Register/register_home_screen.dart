import 'package:flutter/material.dart';

class RegisterHomeScreen extends StatefulWidget {
  final String id,token;
  const RegisterHomeScreen({super.key,required this.id,required this.token});

  @override
  State<RegisterHomeScreen> createState() => _RegisterHomeScreenState();
}

class _RegisterHomeScreenState extends State<RegisterHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Home'),),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('id: ${widget.id}',textScaler: const TextScaler.linear(2),),
            Text('token: ${widget.token}',textScaler: const  TextScaler.linear(2),)
          ],
        ),
      ),
    );
  }
}
