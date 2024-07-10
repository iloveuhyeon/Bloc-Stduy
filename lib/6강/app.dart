import 'package:bloc_study/6%EA%B0%95/bloc/movie_bloc_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App6 extends StatelessWidget {
  const App6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('영화 검색'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              context.read<MovieBlocController>().add(SearchMovieEvent(value));
            },
          ),
          Expanded(
            child: BlocBuilder<MovieBlocController, List<String>>(
              builder: (context, state) {
                return ListView.separated(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(state[index]),
                  ),
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.grey,
                  ),
                  itemCount: state.length,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
