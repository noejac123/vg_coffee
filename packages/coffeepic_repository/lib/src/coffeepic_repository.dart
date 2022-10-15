import 'dart:convert';
import 'dart:io';

import 'package:coffeepic_repository/coffeepic_repository.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoffeeRepository {
  CoffeeRepository(this.url);

  final String url;
  static const String savedImagesKey = 'saved_images';

  Future<String> getNewImage() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      //throw error
    }

    final coffeePic =
        CoffeePic.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

    return coffeePic.file;
  }

  Future<bool> saveImage(String url) async {
    try {
      final uri = Uri.parse(url);
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        //throw error
      }

      final appDir = await getApplicationDocumentsDirectory();
      final imageName = uri.pathSegments.last;

      final fullPath = '${appDir.path}/$imageName';

      final image = File(fullPath);
      await image.writeAsBytes(response.bodyBytes);
      final success = await _addToSavedImageList(fullPath);
      return success;
    } catch (e) {
      //log error
      return false;
    }
  }

  Future<bool> deleteSavedImage(String path) async {
    try {
      final image = File(path);
      await image.delete();
      final success = await _removeFromSavedImageList(path);
      return success;
    } catch (e) {
      // log e
      return false;
    }
  }

  Future<List<String>> getSavedImageList() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(savedImagesKey)) {
      return prefs.getStringList(savedImagesKey) ?? List.empty();
    } else {
      return List<String>.empty();
    }
  }

  Future<bool> _removeFromSavedImageList(String path) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(savedImagesKey)) {
      final savedImageList = prefs.getStringList(savedImagesKey) ?? List.empty()
        ..remove(path);
      return prefs.setStringList(savedImagesKey, savedImageList);
    } else {
      return false;
    }
  }

  Future<bool> _addToSavedImageList(String path) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(savedImagesKey)) {
      final savedImageList =
          prefs.getStringList(savedImagesKey) ?? List.empty(growable: true)
            ..add(path);
      return prefs.setStringList(savedImagesKey, savedImageList);
    } else {
      final savedImageList = [path];
      return prefs.setStringList(savedImagesKey, savedImageList);
    }
  }
}
