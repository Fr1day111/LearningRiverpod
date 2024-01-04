import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodtestapp/Screens/HomePage.dart';

class NextPage extends ConsumerStatefulWidget {
  const NextPage({super.key});

  @override
  ConsumerState<NextPage> createState() => _NextPageState();
}

final counterProvider = StateProvider<int>((ref) => 0);

class _NextPageState extends ConsumerState<NextPage> {
  @override
  Widget build(BuildContext context) {
    print("Built");

    ref.listen(counterProvider, (previous, next) {
      if(next==10){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('The Next Value is $next')));
      }
    });
    //final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('NextPage'),
      actions: [
        IconButton(onPressed: (){
          //ref.invalidate(counterProvider);
          ref.refresh(counterProvider);
        }, icon: const Icon(Icons.refresh))
      ],),
      body: Center(
        child: Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final value=ref.watch(counterProvider);
          return Text(value.toString());
        },)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         // ref.read(counterProvider.notifier).state++;
          ref.read(counterProvider.notifier).update((state) => state+1);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
