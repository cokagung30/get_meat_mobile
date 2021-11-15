import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:get_meat_apps/data/async_state.dart';
import 'package:get_meat_apps/data/preferences/auth_preferences.dart';
import 'package:get_meat_apps/injection.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  void logout() async {
    emit(state.copyWith(asyncLogout: const AsyncState.loading()));
    try {
      locator<AuthPreferences>().removeShared();
      emit(state.copyWith(asyncLogout: const AsyncState.success(true)));
    } catch (e) {
      if (e is Exception) {
        emit(state.copyWith(asyncLogout: AsyncState.error(e)));
      }
    }
  }
}
