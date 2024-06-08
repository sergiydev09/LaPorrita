

import 'package:laporrita/domain/model/user_model.dart';

class HomeState {
  final UserModel? user;
  final bool loading;

  HomeState({this.user,  this.loading = false});

  HomeState copy({
    UserModel? user,
    bool? loading,
  }) =>
      HomeState(
          user: user ?? this.user,
          loading: loading ?? this.loading
      );
}
