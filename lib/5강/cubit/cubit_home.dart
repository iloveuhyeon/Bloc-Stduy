import 'package:bloc_study/5%EA%B0%95/cubit/count_cubit_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitHome extends StatelessWidget {
  const CubitHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('cubit 상태관리'),
      ),
      body: Center(
        child:
            BlocBuilder<CountCubitController, int>(builder: (context, state) {
          return Text(
            state.toString(),
            style: const TextStyle(fontSize: 80),
          );
        }),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CountCubitController>().addCount();
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CountCubitController>().substractCount();
            },
            backgroundColor: Colors.red,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
