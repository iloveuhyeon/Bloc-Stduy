import 'package:bloc_study/5%EA%B0%95/getx/count_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class GetHome extends GetView<CountGetxController> {
  const GetHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('getx 상태관리'),
      ),
      body: Center(
        child: Obx(
          () => Text(
            controller.count.value.toString(),
            style: const TextStyle(fontSize: 80),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              controller.addCount();
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              controller.subStrackCount();
            },
            backgroundColor: Colors.red,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
