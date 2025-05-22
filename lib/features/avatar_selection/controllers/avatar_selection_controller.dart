import 'package:get/get.dart';
import '../../../core/models/avatar_model.dart';
import '../../../core/services/avatar_service.dart';

class AvatarSelectionController extends GetxController {
  final RxList<AvatarModel> selectedAvatars = <AvatarModel>[].obs;
  final RxList<AvatarModel> availableAvatars = <AvatarModel>[].obs;
  final RxBool isLoading = true.obs;
  final RxBool isSelectionComplete = false.obs;
  final int maxSelectionCount = 5;

  @override
  void onInit() {
    super.onInit();
    loadAvatars();
  }

  Future<void> loadAvatars() async {
    try {
      isLoading.value = true;
      final avatars = await AvatarService.loadAvatars();
      availableAvatars.value = avatars;
    } catch (e) {
      print(e);
      Get.snackbar(
        'Hata',
        'Karakterler yüklenirken bir hata oluştu.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  bool canSelectAvatar(AvatarModel avatar) {
    if (selectedAvatars.length >= maxSelectionCount) return false;
    return !selectedAvatars.any((selected) => selected.id == avatar.id);
  }

  void selectAvatar(AvatarModel avatar) {
    if (canSelectAvatar(avatar)) {
      selectedAvatars.add(avatar);
      if (selectedAvatars.length == maxSelectionCount) {
        isSelectionComplete.value = true;
      }
    }
  }

  void removeAvatar(AvatarModel avatar) {
    selectedAvatars.removeWhere((selected) => selected.id == avatar.id);
    isSelectionComplete.value = false;
  }

  void resetSelection() {
    selectedAvatars.clear();
    isSelectionComplete.value = false;
  }
}
