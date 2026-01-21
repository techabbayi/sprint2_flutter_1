import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Collection reference for tasks
  CollectionReference get tasksCollection => _firestore.collection('tasks');

  // Add a new task
  Future<void> addTask(String title, String userId) async {
    try {
      await tasksCollection.add({
        'title': title,
        'userId': userId,
        'completed': false,
        'createdAt': Timestamp.now(),
      });
    } catch (e) {
      throw Exception('Error adding task: $e');
    }
  }

  // Get tasks stream for a specific user
  Stream<QuerySnapshot> getUserTasks(String userId) {
    return tasksCollection
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  // Get all tasks stream (for demonstration of real-time sync)
  Stream<QuerySnapshot> getAllTasks() {
    return tasksCollection.orderBy('createdAt', descending: true).snapshots();
  }

  // Update task completion status
  Future<void> updateTaskStatus(String taskId, bool completed) async {
    try {
      await tasksCollection.doc(taskId).update({
        'completed': completed,
        'updatedAt': Timestamp.now(),
      });
    } catch (e) {
      throw Exception('Error updating task: $e');
    }
  }

  // Delete a task
  Future<void> deleteTask(String taskId) async {
    try {
      await tasksCollection.doc(taskId).delete();
    } catch (e) {
      throw Exception('Error deleting task: $e');
    }
  }

  // Update task title
  Future<void> updateTaskTitle(String taskId, String newTitle) async {
    try {
      await tasksCollection.doc(taskId).update({
        'title': newTitle,
        'updatedAt': Timestamp.now(),
      });
    } catch (e) {
      throw Exception('Error updating task title: $e');
    }
  }
}
