import 'package:get/get.dart';
import '../../../core/services/team_service.dart';
import '../../../core/models/team_model.dart';

class ResultController extends GetxController {
  final TeamService teamService = Get.find<TeamService>();

  String get teamName => teamService.currentTeam.value.teamName;
  String get teamTask => teamService.currentTeam.value.teamTask;
  List<TeamCharacter> get characters =>
      teamService.currentTeam.value.characters;

  List<String> getCharacterFeatures(int index) {
    return teamService.getCharacterFeatures(index);
  }
}
