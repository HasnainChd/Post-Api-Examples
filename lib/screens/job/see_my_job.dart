import 'package:flutter/material.dart';

class SeeMyJob extends StatefulWidget {
  final String id, job, name;
  const SeeMyJob({required this.id,required this.job,required this.name,super.key,});

  @override
  State<SeeMyJob> createState() => _SeeMyJobState();
}

class _SeeMyJobState extends State<SeeMyJob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Job'),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('id: ${widget.id}',textScaler: const TextScaler.linear(2),),
              Text('Name: ${widget.name}',textScaler: const TextScaler.linear(2),),
              Text('Job: ${widget.job}',textScaler: const TextScaler.linear(2),),
            ],
          ),
        ),
      ),
    );
  }
}
