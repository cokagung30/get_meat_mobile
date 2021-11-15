import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_meat_apps/data/async_state.dart';
import 'package:get_meat_apps/data/preferences/auth_preferences.dart';
import 'package:get_meat_apps/injection.dart';
import 'package:get_meat_apps/model/models.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState()) {
    fetchUser();
  }

  void fetchUser() async {
    // emit(state.copyWith(user: AsyncState.success(user)));
  }
}
