import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task_model.dart';

class TaskRepository {
  final CollectionReference _taskCollection =
      FirebaseFirestore.instance.collection('tasks');

  // Add Task
  Future<void> addTask(Task task) async {
    try {
      final docRef = _taskCollection.doc();
      task.id = docRef.id;
      task.createdAt = DateTime.now();
      await docRef.set(task.toJson());
    } catch (e) {
      throw Exception('Failed to add task: $e');
    }
  }

  // Delete Task
  Future<void> deleteTask(String taskId) async {
    try {
      await _taskCollection.doc(taskId).delete();
    } catch (e) {
      throw Exception('Failed to delete task: $e');
    }
  }

  // Get Tasks Stream
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
