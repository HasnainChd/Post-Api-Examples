import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String token;
  const HomeScreen({super.key,required this.token});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Home'),),
      body: Center(
        child: Text('Token: ${widget.token}',textScaler: const TextScaler.linear(2),),
      ),
    );
  }
}
