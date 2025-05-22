import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OpenAIService extends GetxService {
  static const String _apiKey =
      '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';
  static const String _apiUrl = 'https://api.openai.com/v1/chat/completions';

  Future<String> analyzePersonality(String prompt) async {
    try {
      print('API isteği gönderiliyor...');
      print('URL: $_apiUrl');

      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode({
          'model': 'gpt-3.5-turbo', // GPT-4 yerine GPT-3.5 kullanıyoruz
          'messages': [
            {
              'role': 'system',
              'content':
                  'Sen bir çocuk psikoloğusun. Çocukların seçtiği karakterlere ve özelliklere bakarak kişilik analizi yapıyorsun. Analizlerini çocuk dostu, anlaşılır ve yapıcı bir dille yapıyorsun.'
            },
            {'role': 'user', 'content': prompt}
          ],
          'temperature': 0.7,
          'max_tokens': 1000,
        }),
      );

      print('API yanıt kodu: ${response.statusCode}');
      print('API yanıtı: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'];
      } else {
        throw Exception(
            'API yanıt vermedi: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Hata detayı: $e');
      throw Exception('Analiz yapılırken hata oluştu: $e');
    }
  }
}
