import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(
    const Duration(seconds: 2),
    ((count) => count),
  );
});

class StreamProviderPage extends StatelessWidget {
  const StreamProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StreamProvider Page')),
      body:
          Consumer(builder: (BuildContext build, WidgetRef ref, Widget? child) {
        final streamData = ref.watch(streamProvider);
        return streamData.when(
            data: ((data) => Center(
                  child: Text(data.toString()),
                )),
            error: ((error, stackTrace) => Text(error.toString())),
            loading: () {
              return Center(
                child: CircularProgressIndicator(),
              );
            });
      }),
    );
  }
}
