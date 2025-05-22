import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/result_controller.dart';
import '../../analysis/pages/analysis_page.dart';

class ResultPage extends StatelessWidget {
  final ResultController controller = Get.put(ResultController());

  ResultPage({super.key});

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
                Obx(() => Text(
                      controller.teamName.isEmpty
                          ? 'Karakter Özellikleri'
                          : '${controller.teamName} Takımı',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )),
                const SizedBox(height: 16),
                Obx(() => Text(
                      'Görev: ${controller.teamTask}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )),
                const SizedBox(height: 24),
                Expanded(
                  child: Obx(() => SingleChildScrollView(
                        child: Column(
                          children: List.generate(controller.characters.length,
                              (index) {
                            final character = controller.characters[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              color: Colors.white.withOpacity(0.2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundImage: AssetImage(
                                              character.avatar.imagePath),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                character.name.isEmpty
                                                    ? 'Karakter ${index + 1}'
                                                    : character.name,
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                'Özellikler:',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white
                                                      .withOpacity(0.8),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    // Karakter özellikleri
                                    Wrap(
                                      spacing: 8.0,
                                      runSpacing: 8.0,
                                      children: controller
                                          .getCharacterFeatures(index)
                                          .map((feature) =>
                                              _buildFeatureChip(feature))
                                          .toList(),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      )),
                ),
                // Alt butonlar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Geri butonu
                    ElevatedButton.icon(
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
                      icon: const Icon(Icons.arrow_back_ios_new_rounded,
                          size: 18),
                      label: const Text('Geri'),
                    ),
                    // İleri butonu
                    ElevatedButton.icon(
                      onPressed: () {
                        Get.to(() =>  AnalysisPage());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      icon:
                          const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                      label: const Text('Analiz Et'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }
}
