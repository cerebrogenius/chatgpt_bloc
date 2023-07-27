abstract class HomePageBlocState {
  const HomePageBlocState();
}

class HomePageBlocInitial extends HomePageBlocState {
  const HomePageBlocInitial();
}

class HomePageBlocUpdatedValueState extends HomePageBlocState {
  final FormData formData;
  const HomePageBlocUpdatedValueState({this.formData = const FormData()});
}

class FormData {
  final String name;
  final String age;

  const FormData({this.name = '', this.age = ''});

  FormData copyWith({String? name, String? age}) {
    return FormData(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }
}
