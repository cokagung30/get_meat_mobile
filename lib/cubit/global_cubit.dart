import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_meat_apps/data/preferences/auth_preferences.dart';
import 'package:get_meat_apps/injection.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(const GlobalState());

  void logoutGlobal() {
    locator<AuthPreferences>().removeShared();
  }
}
