import 'package:flutter/material.dart';
import 'package:random_dog/random_dog_api.dart';
import 'package:random_dog/random_dog_model.dart';

enum ResultState { loading, noData, hasData, error }

class RandomDogProvider extends ChangeNotifier{
  final ApiService apiService;

  RandomDogProvider(this.apiService) {
    _fetchRandomDogData();
  }

  late RandomDogResult _randomDogResult;
  late ResultState _state;
  String _message = '';

  RandomDogResult get result => _randomDogResult;
  ResultState get state => _state;
  String get message => _message;

  Future<dynamic> _fetchRandomDogData() async {
    try{
      _state = ResultState.loading;
      notifyListeners();

      final randomDog = await apiService.getRandomDog();
      if (randomDog.message.isEmpty) {
        _state = ResultState.noData;
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _randomDogResult = randomDog;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error : $e';
    }
  }
}