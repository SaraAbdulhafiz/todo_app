import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';

class FirebaseManager {



 static CollectionReference<TaskModel> getTasksCollection(){
  return  FirebaseFirestore.instance.collection("Tasks").withConverter<TaskModel>(
        fromFirestore: (snapshot, _) {
          return TaskModel.FromJson(snapshot.data()!);
        },
        toFirestore:(task, _) {
          return task.toJson();
        },
    );
  }

 static Future<void> addTask(TaskModel task){
   var collection = getTasksCollection();
   var docRef = collection.doc();
   task.id = docRef.id;
  return docRef.set(task);
  }

  static Future<QuerySnapshot<TaskModel>> getTasks(DateTime date){
  return
    getTasksCollection().
    where("date",isEqualTo: DateUtils.dateOnly(date).microsecondsSinceEpoch).get();
  }
}