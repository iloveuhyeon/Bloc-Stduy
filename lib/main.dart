import 'package:bloc_study/6%EA%B0%95/app.dart';
import 'package:bloc_study/6%EA%B0%95/bloc/movie_bloc_controller.dart';
import 'package:bloc_study/6%EA%B0%95/cubit/movie_cubit_controller.dart';
import 'package:bloc_study/6%EA%B0%95/repository/movie_repository.dart';
import 'package:bloc_study/7%EA%B0%95/src/app.dart';
import 'package:bloc_study/8%EA%B0%95/src/app8.dart';
import 'package:bloc_study/9%EA%B0%95/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

// 5강
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       theme: ThemeData(),
//       home: const Add(),
//     );
//   }
// }

//6강 cubit
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(),
//       home: RepositoryProvider(
//         create: (context) {
//           MovieRepository();
//         },
//         child: BlocProvider(
//           create: (context) => MovieCubitController(
//             MovieRepository(),
//           ),
//           child: const App(),
//         ),
//       ),
//     );
//   }
// }

// 7강
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(),
//       home: RepositoryProvider(
//         create: (context) {
//           MovieRepository();
//         },
//         child: BlocProvider(
//           create: (context) => MovieBlocController(
//             MovieRepository(),
//           ),
//           child: const App7(),
//         ),
//       ),
//     );
//   }
// }

//8강
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(),
//       home: const App8(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: App(),
    );
  }
}
