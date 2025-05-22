import 'avatar_model.dart';

class TeamModel {
  String teamName;
  String teamTask;
  final List<TeamCharacter> characters;

  TeamModel({
    required this.teamName,
    required this.teamTask,
    required this.characters,
  });

  factory TeamModel.empty() {
    return TeamModel(
      teamName: '',
      teamTask: '',
      characters: [],
    );
  }
}

class TeamCharacter {
  final AvatarModel avatar;
  String name;

  TeamCharacter({
    required this.avatar,
    this.name = '',
  });
}
