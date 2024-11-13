import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_application/core/di/di.dart';
import 'package:test_flutter_application/features/main/presentation/bloc/main_bloc.dart';
import 'package:test_flutter_application/features/main/presentation/bloc/main_event.dart';
import 'package:test_flutter_application/features/main/presentation/screens/main_screen.dart';

void main() async {
  await getItInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) {
          var bloc = locator<MainBloc>();
          bloc.add(MainInitializeEvent());
          return bloc;
        },
        child: const MainScreen(),
      ),
    );
  }
}
