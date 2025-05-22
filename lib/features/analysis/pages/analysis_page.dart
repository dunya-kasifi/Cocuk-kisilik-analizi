import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/analysis_controller.dart';

class AnalysisPage extends StatelessWidget {
  final AnalysisController controller = Get.put(AnalysisController());

  AnalysisPage({super.key});

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
                  'Kişilik Analizi',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    }

                    if (controller.error.value != null) {
                      return Center(
                        child: Text(
                          'Hata: ${controller.error.value}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }

                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Kişilik Analizi
                          _buildSection(
                            '',
                            controller.personalityAnalysis.value,
                          ),
                          // const SizedBox(height: 24),
                          // // Duygu Durumu
                          // _buildSection(
                          //   'Duygu Durumu',
                          //   controller.emotionalState.value,
                          // ),
                          // const SizedBox(height: 24),
                          // // Öneriler
                          // _buildSection(
                          //   'Öneriler',
                          //   controller.recommendations.value,
                          // ),
                        ],
                      ),
                    );
                  }),
                ),
                // Geri butonu
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Card(
      color: Colors.white.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
