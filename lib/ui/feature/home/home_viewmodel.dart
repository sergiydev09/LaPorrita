import 'package:injectable/injectable.dart';
import 'package:laporrita/domain/model/user_model.dart';
import 'package:laporrita/ui/feature/home/home_state.dart';
import 'package:laporrita/ui/state_notifier.dart';
@injectable
class HomeViewModel {
  HomeViewModel() {
    //_getComics();
  }

  final StateNotifier<HomeState> state = StateNotifier<HomeState>(HomeState());

  _getBooks() async {

  }

  onLoginResult(UserModel? user) {

    state.update((currentState) => currentState.copy(user: user));
  }

}
