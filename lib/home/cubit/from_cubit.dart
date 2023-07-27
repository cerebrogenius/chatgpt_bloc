import 'package:flutter_bloc/flutter_bloc.dart';

enum UserFromStatus { invalid, valid, unknown }

class UserFormData {
  final String name;
  final String age;
  final UserFromStatus status;

  const UserFormData({
    this.name = '',
    this.age = '',
    this.status = UserFromStatus.unknown,
  });

  UserFormData copyWith({String? name, String? age, UserFromStatus? status}) {
    return UserFormData(
      name: name ?? this.name,
      age: age ?? this.age,
      status: status ?? this.status,
    );
  }
}

class UserFormCubit extends Cubit<UserFormData> {
  UserFormCubit() : super(const UserFormData(name: "", age: ""));

  void onNameChange(String val) {
    emit(state.copyWith(name: val));
    _checkStatus();
  }

  void onAgeChange(String val) {
    emit(state.copyWith(age: val));
    _checkStatus();
  }

  void _checkStatus() {
    final int age = int.tryParse(state.age) ?? 0;
    final String name = state.name;

    final UserFromStatus status;
    if (name.length > 3 && age >= 10) {
      status = UserFromStatus.valid;
    } else {
      status = UserFromStatus.invalid;
    }

    emit(state.copyWith(status: status));
  }
}
