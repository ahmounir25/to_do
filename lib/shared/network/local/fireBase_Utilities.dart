import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do/models/task.dart';

CollectionReference<Task> getTaskCollection() {
  return FirebaseFirestore.instance.collection('tasks').withConverter<Task>(
      fromFirestore: (snapshot, options) => Task.fromJson(snapshot.data()!),
      toFirestore: (value, options) => value.toJson());
}

Future<void> addTaskToFireStore(Task task) {
  var collection = getTaskCollection();
  var docRef = collection.doc();
  task.id = docRef.id;
  return docRef.set(task);
}

Future<QuerySnapshot<Task?>> getTaskFromFireStore(DateTime selected) {
  return getTaskCollection()
      .where('date', isEqualTo: DateUtils.dateOnly(selected).microsecondsSinceEpoch)
      .get();
}
