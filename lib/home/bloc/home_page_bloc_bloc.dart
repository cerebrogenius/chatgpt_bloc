import 'package:chatgpt_bloc/home/bloc/home_page_bloc_event.dart';
import 'package:chatgpt_bloc/home/bloc/home_page_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Bloc<HomePageBlocEvent, HomePageBlocState> {
  HomePageBloc() : super(const HomePageBlocInitial()) {
    // on<NewNameEvent>((event, emit) {
    //   emit(HomePageBlocState());
    // });
    // on<NewAgeEvent>(((event, emit) {
    //   emit(HomePageBlocState(age: state.age));
    // }));

    on<NewNameEvent>((NewNameEvent event, emit) {
      final FormData data;

      if (state is HomePageBlocUpdatedValueState) {
        data = (state as HomePageBlocUpdatedValueState)
            .formData
            .copyWith(name: event.name);
      } else {
        data = FormData(name: event.name);
      }

      emit(HomePageBlocUpdatedValueState(formData: data));
    });

    on<NewAgeEvent>((event, emit) {
      final FormData data;

      if (state is HomePageBlocUpdatedValueState) {
        data = (state as HomePageBlocUpdatedValueState)
            .formData
            .copyWith(age: event.age);
      } else {
        data = FormData(age: event.age);
      }

      emit(HomePageBlocUpdatedValueState(formData: data));
    });
  }
}
