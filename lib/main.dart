import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_dog/random_dog_api.dart';
import 'package:random_dog/random_dog_page.dart';
import 'package:random_dog/random_dog_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Dog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<RandomDogProvider> (
        create: (_) => RandomDogProvider(ApiService()),
        child: const RandomDogPage(),
      ),
    );
  }
}