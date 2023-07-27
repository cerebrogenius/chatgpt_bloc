import 'package:chatgpt_bloc/home/bloc/home_page_bloc_bloc.dart';
import 'package:chatgpt_bloc/home/bloc/home_page_bloc_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatgpt_bloc/home/bloc/home_page_bloc_state.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: BlocBuilder<HomePageBloc, HomePageBlocState>(
            builder: (context, state) {
              return Column(
                children: [
                  MyTextField(
        
                    title: 'NAME', 
                    child: TextField(
                      controller: nameController,
                      onSubmitted: ((value) {
                        nameController.text = value;
                      }),
                      
                    )
                    ),
                  SizedBox(
                    height: 25,
                  ),
                  MyTextField(
                    title: 'AGE',
                    child: TextField(
                      controller: ageController,
                      onSubmitted: (value) {
                        ageController.text = value;
                      },
                     
                    ) ),
                  TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black)),
                      onPressed: () {
                        print(nameController.text);
                        // BlocProvider.of<HomePageBloc>(context).state.name=nameController.text;
                        // BlocProvider.of<HomePageBloc>(context).add(NewNameEvent());
                        BlocProvider.of<HomePageBloc>(context).state.age=int.tryParse(ageController.text);
                        BlocProvider.of<HomePageBloc>(context).add(NewAgeEvent());

                      },
                      child: const Text(
                        'submit',
                        style: TextStyle(color: Colors.white),
                      )),
                  Text('welcome ${state.name}, you are ${state.age} year old')
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget MyTextField(
    {required String title, 
    required Widget child,
    }) {
  return Column(
    children: [
      Text(title),
      Container(
        height: 50,
        width: 350,
        decoration: BoxDecoration(border: Border.all()),
        child: child
        
      ),
    ],
  );
}
