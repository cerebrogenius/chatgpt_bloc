import 'package:equatable/equatable.dart';

abstract class HomePageBlocEvent extends Equatable {
  const HomePageBlocEvent();
}

class NewNameEvent extends HomePageBlocEvent {
  final String name;
  const NewNameEvent({required this.name});

  @override
  List<Object?> get props => [name];
}

class NewAgeEvent extends HomePageBlocEvent {
  final String age;
  const NewAgeEvent({required this.age});

  @override
  List<Object?> get props => [];
}
