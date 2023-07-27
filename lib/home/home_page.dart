import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/from_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // TextEditingController nameController = TextEditingController();
  // TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final homeBloc = context.read<HomePageBloc>();
    final userFormCubit = context.read<UserFormCubit>();

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              MyTextField(
                title: 'NAME',
                child: TextField(
                  // controller: nameController,
                  // onSubmitted: ((value) {
                  //   nameController.text = value;
                  // }),
                  onChanged: (value) {
                    userFormCubit.onNameChange(value);
                    // homeBloc.add(NewNameEvent(name: value));
                  },
                ),
              ),
              const SizedBox(height: 15),
              MyTextField(
                title: 'AGE',
                child: TextField(
                  // controller: ageController,
                  onChanged: (value) {
                    // homeBloc.add(NewAgeEvent(age: value));
                    userFormCubit.onAgeChange(value);
                  },
                  // onSubmitted: (value) {
                  //   ageController.text = value;
                  // },
                ),
              ),
              const SizedBox(height: 30),
              TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                onPressed: () async {
                  // print(nameController.text);
                  // BlocProvider.of<HomePageBloc>(context).state.name=nameController.text;
                  // BlocProvider.of<HomePageBloc>(context).add(NewNameEvent());
                  // BlocProvider.of<HomePageBloc>(context).state.age =
                  //     int.tryParse(ageController.text);
                  // BlocProvider.of<HomePageBloc>(context)
                  //     .add(const NewAgeEvent());
                },
                child: const Text(
                  'submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              // BlocBuilder<HomePageBloc, HomePageBlocState>(
              //   builder: (context, state) {
              //     if (state is HomePageBlocUpdatedValueState) {
              //       var name = state.formData.name.isEmpty
              //           ? "N/A"
              //           : state.formData.name;
              //       var age =
              //           state.formData.age.isEmpty ? "0" : state.formData.age;

              //       return Text('welcome $name, you are $age year old');
              //     } else {
              //       return const SizedBox.shrink();
              //     }
              //   },
              // )
              BlocBuilder<UserFormCubit, UserFormData>(
                builder: (context, state) {
                  if (state.status == UserFromStatus.invalid) {
                    return const Text(
                      'Error: Username must be morte than 3 char and age must be above 10 years old',
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    );
                  } else if (state.status == UserFromStatus.valid) {
                    var name = state.name.isEmpty ? "N/A" : state.name;
                    var age = state.age.isEmpty ? "0" : state.age;

                    return Text('welcome $name, you are $age year old');
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget MyTextField({
  required String title,
  required Widget child,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title),
      Container(
        height: 50,
        width: 350,
        decoration: BoxDecoration(border: Border.all()),
        child: child,
      ),
    ],
  );
}
