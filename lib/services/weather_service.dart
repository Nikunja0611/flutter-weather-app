import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherService {
  final String baseUrl = "https://api.openweathermap.org/data/2.5/weather";
  final String apiKey = dotenv.env['API_KEY']!;

  Future<Map<String, dynamic>?> fetchWeather(String city) async {
    final url = Uri.parse('$baseUrl?q=$city&appid=$apiKey&units=metric');
    final response = await http.get(url);
    
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }
}
