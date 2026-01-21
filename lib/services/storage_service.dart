import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Upload file to Firebase Storage
  Future<String> uploadFile(File file, String userId, String fileName) async {
    try {
      // Create a reference to the file location
      final storageRef = _storage.ref().child('uploads/$userId/$fileName');

      // Upload the file
      final uploadTask = await storageRef.putFile(file);

      // Get the download URL
      final downloadUrl = await uploadTask.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      throw Exception('Error uploading file: $e');
    }
  }

  // Upload profile picture
  Future<String> uploadProfilePicture(File imageFile, String userId) async {
    try {
      final storageRef = _storage.ref().child('profile_pictures/$userId.jpg');
      final uploadTask = await storageRef.putFile(imageFile);
      final downloadUrl = await uploadTask.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('Error uploading profile picture: $e');
    }
  }

  // Delete file from Firebase Storage
  Future<void> deleteFile(String fileUrl) async {
    try {
      final ref = _storage.refFromURL(fileUrl);
      await ref.delete();
    } catch (e) {
      throw Exception('Error deleting file: $e');
    }
  }

  // Get download URL for a file
  Future<String> getDownloadUrl(String filePath) async {
    try {
      final ref = _storage.ref().child(filePath);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      throw Exception('Error getting download URL: $e');
    }
  }

  // List all files in a directory
  Future<List<String>> listFiles(String directoryPath) async {
    try {
      final ref = _storage.ref().child(directoryPath);
      final result = await ref.listAll();

      List<String> urls = [];
      for (var item in result.items) {
        final url = await item.getDownloadURL();
        urls.add(url);
      }

      return urls;
    } catch (e) {
      throw Exception('Error listing files: $e');
    }
  }
}
