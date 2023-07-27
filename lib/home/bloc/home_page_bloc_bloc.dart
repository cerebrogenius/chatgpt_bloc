import 'package:chatgpt_bloc/home/bloc/home_page_bloc_event.dart';
import 'package:chatgpt_bloc/home/bloc/home_page_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Bloc<HomePageBlocEvent, HomePageBlocState> {
  HomePageBloc() : super(HomePageBlocInitial()) {
    on<NewNameEvent>((event, emit) {
    emit(HomePageBlocState(name: state.name));
    });
    on<NewAgeEvent>(((event, emit) {
      emit(HomePageBlocState(age: state.age));
    }));
  }
}
