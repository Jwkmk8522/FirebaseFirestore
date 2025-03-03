import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_cloud/Views/addnewtask.dart';
import 'package:flutter_firebase_cloud/Views/utils.dart';
import 'package:flutter_firebase_cloud/Widgets/date_selecter.dart';

import 'package:flutter_firebase_cloud/Widgets/task_card.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddNewTask(),
                ),
              );
            },
            icon: const Icon(
              CupertinoIcons.add,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const DateSelector(),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('tasks')
                    .where(
                      'creater',
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid,
                    )
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text('No Tasks To Show '),
                    );
                  }

                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: ValueKey(index),
                          onDismissed: (direction) async {
                            bool confirmDelete = await showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("Delete Task?"),
                                content: const Text(
                                    "Are you sure you want to delete this task?"),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, false),
                                    child: const Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, true),
                                    child: const Text("Delete"),
                                  ),
                                ],
                              ),
                            );

                            if (confirmDelete) {
                              await FirebaseFirestore.instance
                                  .collection('tasks')
                                  .doc(snapshot.data!.docs[index].id)
                                  .delete();
                            }
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: TaskCard(
                                    color: hexToColor(
                                      snapshot.data!.docs[index]
                                          .data()['color'],
                                    ),
                                    headerText: snapshot.data!.docs[index]
                                        .data()['title'],
                                    descriptionText: snapshot.data!.docs[index]
                                        .data()['description'],
                                    scheduledDate: DateFormat('MM-d-y').format(
                                      (snapshot.data!.docs[index].get('date')
                                              as Timestamp)
                                          .toDate(),
                                    )),
                              ),
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                  color: strengthenColor(
                                    const Color.fromARGB(255, 109, 221, 116),
                                    0.69,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: IconButton(
                                    onPressed: null, icon: Icon(Icons.edit)),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
