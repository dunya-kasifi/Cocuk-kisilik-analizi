class AvatarModel {
  final int id;
  final String gender;
  final String imagePath;
  final Map<String, dynamic> physicalFeatures;
  final List<String> extraConditions;
  final String emotionalState;

  AvatarModel({
    required this.id,
    required this.gender,
    required this.imagePath,
    required this.physicalFeatures,
    required this.extraConditions,
    required this.emotionalState,
  });

  factory AvatarModel.fromJson(Map<String, dynamic> json) {
    return AvatarModel(
      id: json['id'],
      gender: json['gender'],
      imagePath: json['image_path'],
      physicalFeatures: json['physicalFeatures'],
      extraConditions: List<String>.from(json['extraConditions']),
      emotionalState: json['emotionalState'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'gender': gender,
      'image_path': imagePath,
      'physicalFeatures': physicalFeatures,
      'extraConditions': extraConditions,
      'emotionalState': emotionalState,
    };
  }
}
