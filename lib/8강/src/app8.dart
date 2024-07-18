import 'package:bloc_study/8%EA%B0%95/src/controller/user_list_controller_cubit.dart';
import 'package:bloc_study/8%EA%B0%95/src/view/cubit/user_list.dart';
import 'package:bloc_study/8%EA%B0%95/src/view/getx/user_list.dart';
import 'package:bloc_study/8%EA%B0%95/src/controller/user_list_controller_getx.dart';
import 'package:bloc_study/8%EA%B0%95/src/view/set_state/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/instance_manager.dart';

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
              onPressed: () {
                Get.put(UserListControllerGetx());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserListGetX(),
                  ),
                );
              },
              child: const Text("getx 상태관리"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider(
                          create: (context) => UserListControllerCubit(),
                          child: const UserListCubit())),
                );
              },
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
