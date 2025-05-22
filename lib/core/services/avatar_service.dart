import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/avatar_model.dart';

class AvatarService {
  static Future<List<AvatarModel>> loadAvatars() async {
    try {
      final String jsonString =
          await rootBundle.loadString('lib/core/data/avatar_data.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => AvatarModel.fromJson(json)).toList();
    } catch (e) {
      print('Error loading avatars: $e');
      rethrow;
    }
  }
}
