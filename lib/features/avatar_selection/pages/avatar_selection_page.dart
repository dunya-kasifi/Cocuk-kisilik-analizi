import 'package:child_personality_analysis/core/theme/app_colors.dart';
import 'package:child_personality_analysis/features/create_team_page/pages/create_team_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/avatar_selection_controller.dart';

class AvatarSelectionPage extends StatelessWidget {
  final AvatarSelectionController controller =
      Get.put(AvatarSelectionController());

  AvatarSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1DA1F2),
              Color(0xFF6A11CB),
            ],
          ),
        ),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          // Seçili avatarı belirle (son seçilen yoksa ilk avatarı göster)
          final selected = controller.selectedAvatars.isNotEmpty
              ? controller.selectedAvatars.last
              : controller.availableAvatars.isNotEmpty
                  ? controller.availableAvatars[0]
                  : null;

          return SafeArea(
            child: Center(
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(height: 16),
                      // Üstte seçilen karakterler
                      Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (index) {
                              if (index < controller.selectedAvatars.length) {
                                final avatar =
                                    controller.selectedAvatars[index];
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 6),
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.orangeAccent,
                                      width: 3,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 17,
                                      backgroundImage:
                                          AssetImage(avatar.imagePath),
                                    ),
                                  ),
                                );
                              } else {
                                // Boş slot
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 6),
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white.withOpacity(0.2),
                                    border: Border.all(
                                      color: Colors.white24,
                                      width: 2,
                                    ),
                                  ),
                                  child: const Icon(Icons.person_outline,
                                      color: Colors.white38, size: 22),
                                );
                              }
                            }),
                          )),
                      const SizedBox(height: 16),
                      Text(
                        'Karakterlerini Seç',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 24),
                      if (selected != null)
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 4,
                              color: AppColors.disabledColor,
                            ),
                            borderRadius: BorderRadius.circular(55),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              selected.imagePath,
                              width: 130,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      const SizedBox(height: 24),
                      // Yatay avatar grid
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.white24),
                        ),
                        child: SizedBox(
                          height: 350,
                          child: GridView.count(
                            crossAxisCount: 15,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            shrinkWrap: true,
                            children: List.generate(
                                controller.availableAvatars.length, (index) {
                              final avatar = controller.availableAvatars[index];
                              final isSelected = controller.selectedAvatars
                                  .any((a) => a.id == avatar.id);
                              final canSelect =
                                  controller.selectedAvatars.length < 5 ||
                                      isSelected;
                              return GestureDetector(
                                onTap: canSelect
                                    ? () {
                                        if (isSelected) {
                                          controller.removeAvatar(avatar);
                                        } else {
                                          controller.selectAvatar(avatar);
                                        }
                                      }
                                    : null,
                                child: Opacity(
                                  opacity: canSelect ? 1.0 : 0.4,
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: isSelected
                                            ? Colors.lightBlueAccent
                                            : Colors.transparent,
                                        width: 3,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.asset(
                                        avatar.imagePath,
                                        width: 64,
                                        height: 64,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                  // Sol alt: Geri butonu
                  Positioned(
                    left: 16,
                    bottom: 16,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).maybePop();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_rounded,
                          size: 18),
                      label: const Text('Geri'),
                    ),
                  ),
                  // Sağ alt: İleri butonu
                  Positioned(
                    right: 16,
                    bottom: 16,
                    child: Obx(() => ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: controller.selectedAvatars.length == 5
                              ? () {
                                  Get.to(() => CreateTeamPage());
                                }
                              : null,
                          icon: const Icon(Icons.arrow_forward_ios_rounded,
                              size: 18),
                          label: const Text('İleri'),
                        )),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
