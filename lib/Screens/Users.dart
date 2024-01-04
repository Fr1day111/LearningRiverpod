import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodtestapp/Servies/Api_services.dart';

import '../Models/UserModel.dart';

final apiProvider = Provider<ApiServices>((ref) => ApiServices());
final userDataProvider = FutureProvider<dynamic>((ref) {
  return ref.read(apiProvider).getUsers();
});

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
   //
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body:  Consumer(builder: (BuildContext context, WidgetRef ref,Widget? child){
        final userData = ref.watch(userDataProvider);
        return userData.when(
            data: (data) {
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: Text("${data[index].fname} ${data[index].lname}"),
                      subtitle: Text(data[index].email),
                      leading: CircleAvatar(
                        child: Image.network(data[index].avatar),
                      ),
                    );
                  }));
            },
            error: ((error, stackTrace) => Text(error.toString())),
            loading: () {
              return const Center(child: CircularProgressIndicator());
            });
      })

    );
  }
}
