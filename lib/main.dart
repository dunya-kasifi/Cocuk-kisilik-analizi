import 'package:child_personality_analysis/features/welcome_page/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/services/team_service.dart';
import 'core/services/openai_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Servisleri başlat
  Get.put(TeamService());
  Get.put(OpenAIService());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Çocuk Kişilik Analizi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: WelcomePage(),
    );
  }
}
