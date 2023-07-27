import 'package:flutter/material.dart';

import 'home/bloc/home_page_bloc_bloc.dart';
import 'home/cubit/from_cubit.dart';
import 'home/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserFormCubit(),
      child: BlocProvider(
        create: (context) => HomePageBloc(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ),
      ),
    );
  }
}
