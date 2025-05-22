import 'package:get/get.dart';
import '../../../core/services/team_service.dart';
import '../../../core/services/openai_service.dart';

class AnalysisController extends GetxController {
  final TeamService teamService = Get.find<TeamService>();
  final OpenAIService openAIService = Get.find<OpenAIService>();

  final isLoading = true.obs;
  final error = RxnString();

  final personalityAnalysis = ''.obs;
  final emotionalState = ''.obs;
  final recommendations = ''.obs;

  @override
  void onInit() {
    super.onInit();
    analyzePersonality();
  }

  Future<void> analyzePersonality() async {
    try {
      isLoading.value = true;
      error.value = null;

      final team = teamService.currentTeam.value;
      final prompt = '''
Takım Adı: ${team.teamName}
Takım Görevi: ${team.teamTask}

Karakterler:  
${team.characters.map((c) => '''
- ${c.name} (${c.avatar.gender}):
  Fiziksel Özellikler: ${c.avatar.physicalFeatures.entries.map((e) => '${e.key}: ${e.value}').join(', ')}
  Duygusal Durum: ${c.avatar.emotionalState}
  Ekstra Özellikler: ${c.avatar.extraConditions.join(', ')}
''').join('\n')}

Bu bilgileri ve karakterleri 3-10 yaş arası bir çocuk seçti ve böyle bir takım oluşturdu. Lütfen bu bilgilere dayanarak çocuğun kişilik analizini yap. Analiz şu bölümlerden oluşmalı:

1. Kişilik Analizi: Çocuğun seçtiği karakterler ve özelliklerine dayanarak kişilik özelliklerini analiz et.
2. Duygu Durumu: Çocuğun seçimlerine bakarak duygusal durumunu değerlendir.
3. Öneriler: Çocuğun gelişimi için öneriler sun.

Analizi çocuk dostu bir dille, anlaşılır ve yapıcı bir şekilde yap. Soru sormani istemiyorum direk olarak cevabi ver ve analizi olustur.
''';

      print(prompt);

      final response = await openAIService.analyzePersonality(prompt);
      personalityAnalysis.value = response;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
