import 'package:flutter/material.dart';
import 'package:post_api/ApiServices/job_api.dart';
import 'package:post_api/Models/job_model.dart';

import 'see_my_job.dart';

class MyJobHome extends StatefulWidget {
  const MyJobHome({super.key});

  @override
  State<MyJobHome> createState() => _MyJobHomeState();
}

class _MyJobHomeState extends State<MyJobHome> {
  TextEditingController name = TextEditingController();
  TextEditingController job = TextEditingController();

  jobModel jModel = jobModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JOB'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(hintText: 'Enter Name'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: job,
              decoration: const InputDecoration(hintText: 'Enter Job'),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 40,
              child: ElevatedButton(onPressed: () {
                JobApi().getJob(name.text, job.text).then((value) {
                  setState(() {
                    jModel = value!;

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            SeeMyJob(id: jModel.id.toString(),
                                job: jModel.job.toString(),
                                name: jModel.name.toString())));
                  });
                });
              }, child: const Text('create Job'),),
            )
          ],
        ),
      ),
    );
  }
}
