import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_dog/random_dog_provider.dart';

class RandomDogPage extends StatefulWidget {
  const RandomDogPage({Key? key}) : super(key: key);
  @override
  State<RandomDogPage> createState() => _RandomDogPageState();
}

class _RandomDogPageState extends State<RandomDogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Random Dog Pictures')
      ),
      body: Consumer<RandomDogProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.state == ResultState.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                        'Status : ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontStyle: FontStyle.normal,
                        )
                    ),
                    Text(state.result.status,
                      style: const TextStyle(
                        color: Colors.green,
                          fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8.0),
                Image.network(state.result.message)
              ],
            );
          } else if (state.state == ResultState.noData) {
            return Center(child: Text(state.message));
          } else if (state.state == ResultState.error) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text(''));
          }
        },
      ),
    );
  }
}