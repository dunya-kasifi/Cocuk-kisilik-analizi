import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OpenAIService extends GetxService {
  static const String _apiUrl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent';
  static const String _apiKey =
      ''; // Gemini API anahtarı

  Future<String> analyzePersonality(String prompt) async {
    try {
      print('API isteği gönderiliyor...');

      final response = await http.post(
        Uri.parse('$_apiUrl?key=$_apiKey'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'contents': [
            {
              'parts': [
                {
                  'text': '''
Sen bir çocuk psikoloğusun. Aşağıdaki bilgilere dayanarak çocuğun kişilik analizini yap.
Analizi çocuk dostu bir dille, anlaşılır ve yapıcı bir şekilde yap.

$prompt

Analiz şu bölümlerden oluşmalı:
1. Kişilik Analizi: Çocuğun seçtiği karakterler ve özelliklerine dayanarak kişilik özelliklerini analiz et.
2. Duygu Durumu: Çocuğun seçimlerine bakarak duygusal durumunu değerlendir.
3. Öneriler: Çocuğun gelişimi için öneriler sun.
'''
                }
              ]
            }
          ],
          'generationConfig': {
            'temperature': 0.7,
            'topK': 40,
            'topP': 0.95,
            'maxOutputTokens': 1000,
          }
        }),
      );

      print('API yanıt kodu: ${response.statusCode}');
      print('API yanıtı: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['candidates'][0]['content']['parts'][0]['text'];
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
