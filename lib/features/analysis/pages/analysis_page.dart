import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
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

                    return Markdown(
                      data: controller.personalityAnalysis.value,
                      styleSheet:
                          MarkdownStyleSheet.fromTheme(Theme.of(context))
                              .copyWith(
                        p: const TextStyle(color: Colors.white, fontSize: 16),
                        h1: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        h2: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        h3: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        strong: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        blockquote: const TextStyle(
                            color: Colors.white70, fontStyle: FontStyle.italic),
                        code: const TextStyle(color: Colors.orangeAccent),
                        listBullet: const TextStyle(color: Colors.white),
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
}
