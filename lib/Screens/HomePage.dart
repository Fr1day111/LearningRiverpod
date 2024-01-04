import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = Provider<String>((ref) {
  return 'Hello World';
});

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // String name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(title: Text('RiverPod Tutorial'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final name = ref.watch(nameProvider);
                return Text(name);
              },
            ),
          )
          // Center(child: Text(name))
        ],
      ),
    );
  }
}
