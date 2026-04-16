import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task_model.dart';

class TaskRepository {
  final CollectionReference _taskCollection =
      FirebaseFirestore.instance.collection('tasks');

  // Add Task
  Future<void> addTask(Task task) async {
    final docRef = _taskCollection.doc();
    task.id = docRef.id;
    task.createdAt = DateTime.now();
    await docRef.set(task.toJson());
  }

  // Delete Task
  Future<void> deleteTask(String taskId) async {
    await _taskCollection.doc(taskId).delete();
  }

  // Update Task
  Future<void> updateTask(Task task) async {
    await _taskCollection.doc(task.id).set(task.toJson(), SetOptions(merge: true));
  }

  // Get Tasks Stream (Real-time)
  Stream<List<Task>> getTasks() {
    return _taskCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Task.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
