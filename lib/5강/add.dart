import 'package:bloc_study/5%EA%B0%95/bloc/bloc_home.dart';
import 'package:bloc_study/5%EA%B0%95/bloc/count_bloc_controller.dart';
import 'package:bloc_study/5%EA%B0%95/cubit/count_cubit_controller.dart';
import 'package:bloc_study/5%EA%B0%95/cubit/cubit_home.dart';
import 'package:bloc_study/5%EA%B0%95/getx/count_getx_controller.dart';
import 'package:bloc_study/5%EA%B0%95/getx/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class Add extends StatelessWidget {
  const Add({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('더하기 예제'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(
                  const GetHome(),
                  duration: Duration.zero,
                  binding: BindingsBuilder(
                    () {
                      Get.put(CountGetxController());
                    },
                  ),
                );
              },
              child: const Text('Getx 더하기'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                    BlocProvider(
                        create: (context) => CountCubitController(),
                        child: const CubitHome()),
                    duration: Duration.zero);
              },
              child: const Text('cubit 더하기'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  BlocProvider(
                      create: (context) => CountBlocController(),
                      child: const BlocHome()),
                  duration: Duration.zero,
                );
              },
              child: const Text('bloc 더하기'),
            ),
          ],
        ),
      ),
    );
  }
}
