import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do/models/task.dart';

CollectionReference getTaskCollection() {
  return FirebaseFirestore.instance.collection('tasks').withConverter<Task>(
      fromFirestore: (snapshot, options) => Task.fromJson(snapshot.data()!),
      toFirestore: (value, options) => value.toJson());
}

Future<void> addTaskToFireStore(Task task)  {
  var collection=getTaskCollection();
  var docRef=collection.doc();
  task.id=docRef.id;
  return docRef.set(task);
}
