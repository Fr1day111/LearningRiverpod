import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodtestapp/Servies/Counterdemo.dart';

final counterProvider = StateNotifierProvider<CounterDemo,int>((ref) => CounterDemo());


class ThirdPage extends ConsumerWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final Counter = ref.watch(counterProvider);
    return Scaffold(
      body: Center(
        child: Text('$Counter'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ref.read(counterProvider.notifier).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

