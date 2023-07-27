
 class HomePageBlocState {
  String? name;
  int? age;

  HomePageBlocState({this.name, this.age});
}

class HomePageBlocInitial extends HomePageBlocState {
  HomePageBlocInitial():super(name:'John Doe', age: 18);
}