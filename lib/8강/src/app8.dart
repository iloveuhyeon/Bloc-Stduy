import 'package:bloc_study/8%EA%B0%95/src/set_state/user_list.dart';
import 'package:flutter/material.dart';

class App8 extends StatelessWidget {
  const App8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserListPageSetState(),
                  ),
                );
              },
              child: const Text("setState 상태관리"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("getx 상태관리"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Extends 상태관리"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("bloc 상태관리"),
            )
          ],
        ),
      ),
    );
  }
}
