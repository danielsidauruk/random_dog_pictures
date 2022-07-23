import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:random_dog/random_dog_model.dart';

class ApiService {
  Future<RandomDogResult> getRandomDog() async {
    final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));

    if (response.statusCode == 200) {
      return RandomDogResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Random Dog');
    }
  }
}