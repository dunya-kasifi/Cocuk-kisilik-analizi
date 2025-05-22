import 'package:get/get.dart';
import '../../avatar_selection/controllers/avatar_selection_controller.dart';
import '../../../core/services/team_service.dart';

class CreateTeamController extends GetxController {
  final AvatarSelectionController avatarController =
      Get.find<AvatarSelectionController>();
  final TeamService teamService = Get.find<TeamService>();

  // Takım bilgileri
  final RxString teamName = ''.obs;
  final RxString teamTask = ''.obs;

  // Karakter bilgileri
  final RxList<CharacterInfo> characters = <CharacterInfo>[].obs;

  @override
  void onInit() {
    super.onInit();
    teamService.initializeTeam(avatarController.selectedAvatars);
  }

  void updateTeamName(String name) {
    teamName.value = name;
    teamService.updateTeamName(name);
  }

  void updateTeamTask(String task) {
    teamTask.value = task;
    teamService.updateTeamTask(task);
  }

  void updateCharacterName(int index, String name) {
    teamService.updateCharacterName(index, name);
  }
}

class CharacterInfo {
  final String avatarPath;
  String name;

  CharacterInfo({
    required this.avatarPath,
    this.name = '',
  });
}
