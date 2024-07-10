import 'package:bloc_study/7%EA%B0%95/src/repository.dart';
import 'package:bloc_study/7%EA%B0%95/src/sample_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App7 extends StatelessWidget {
  const App7({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => SampleRepository(),
      child: BlocProvider(
        create: (context) => SampleBloc(context.read<SampleRepository>()),
        child: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  Widget show() {
    return BlocBuilder<SampleBloc, SampleState>(
      builder: (context, state) {
        return Column(
          children: [
            if (state.count >= 0)
              Text(
                state.count.toString(),
                style: const TextStyle(fontSize: 20),
              ),
            SizedBox(
              height: 300,
              child: state.path == ''
                  ? Container()
                  : Image.asset('assets/images/${state.path}'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            show(),
            ElevatedButton(
              onPressed: () {
                context.read<SampleBloc>().add(IUShowEvent());
              },
              child: const Text('아이유 사진'),
            ),
          ],
        ),
      ),
    );
  }
}
