import 'package:get/get.dart';
import '../models/avatar_model.dart';
import '../models/team_model.dart';

class TeamService extends GetxService {
  final Rx<TeamModel> currentTeam = TeamModel.empty().obs;

  void updateTeamName(String name) {
    currentTeam.update((val) {
      if (val != null) {
        val.teamName = name;
      }
    });
  }

  void updateTeamTask(String task) {
    currentTeam.update((val) {
      if (val != null) {
        val.teamTask = task;
      }
    });
  }

  void updateCharacterName(int index, String name) {
    currentTeam.update((val) {
      if (val != null && index < val.characters.length) {
        val.characters[index].name = name;
      }
    });
  }

  void initializeTeam(List<AvatarModel> selectedAvatars) {
    currentTeam.value = TeamModel(
      teamName: '',
      teamTask: '',
      characters: selectedAvatars
          .map((avatar) => TeamCharacter(
                avatar: avatar,
                name: '',
              ))
          .toList(),
    );
  }

  List<String> getCharacterFeatures(int index) {
    if (index >= currentTeam.value.characters.length) return [];

    final character = currentTeam.value.characters[index].avatar;
    final features = <String>[];

    // Fiziksel özellikleri ekle
    character.physicalFeatures.forEach((key, value) {
      if (value is bool && value) {
        features.add(key);
      } else if (value is String) {
        features.add(value);
      }
    });

    // Ekstra durumları ekle
    features.addAll(character.extraConditions);

    // Duygusal durumu ekle
    features.add(character.emotionalState);

    return features;
  }
}
