import 'package:child_personality_analysis/features/result_page/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/create_team_controller.dart';

class CreateTeamPage extends StatelessWidget {
  final CreateTeamController controller = Get.put(CreateTeamController());

  CreateTeamPage({super.key});

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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Keşif Takımını Oluştur',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                // Takım ismi girişi
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 500,
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        onChanged: controller.updateTeamName,
                        decoration: InputDecoration(
                          hintText: 'Takım İsmi Girin',
                          hintStyle:
                              TextStyle(color: Colors.white.withOpacity(0.7)),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 54),
                // Karakterler yatayda büyük ve ortada
                Expanded(
                  child: Center(
                    child: Obx(() => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                controller.teamService.currentTeam.value
                                    .characters.length, (index) {
                              final character = controller.teamService
                                  .currentTeam.value.characters[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 75,
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                        radius: 70,
                                        backgroundImage: AssetImage(
                                            character.avatar.imagePath),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    SizedBox(
                                      width: 140,
                                      height: 48,
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 18),
                                        onChanged: (value) => controller
                                            .updateCharacterName(index, value),
                                        decoration: InputDecoration(
                                          hintText: 'İsim',
                                          hintStyle: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 16),
                                          filled: true,
                                          fillColor:
                                              Colors.white.withOpacity(0.18),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 12, horizontal: 12),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        )),
                  ),
                ),
                const SizedBox(height: 32),
                Expanded(
                  child:
                      // Takım görevi girişi
                      Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 500,
                        height: 200,
                        child: TextField(
                          maxLines: null,
                          expands: true,
                          textAlignVertical: TextAlignVertical.top,
                          style: const TextStyle(color: Colors.white),
                          onChanged: controller.updateTeamTask,
                          decoration: InputDecoration(
                            hintText: 'Takımın için bir görev belirle',
                            hintStyle:
                                TextStyle(color: Colors.white.withOpacity(0.7)),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Sol altta geri butonu
                Align(
                  alignment: Alignment.bottomLeft,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).maybePop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    icon:
                        const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
                    label: const Text('Geri'),
                  ),
                ),
                // Sağ altta ileri butonu
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.to(() => ResultPage());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    icon: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                    label: const Text('İleri'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
