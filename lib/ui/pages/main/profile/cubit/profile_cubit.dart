import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:get_meat_apps/data/async_state.dart';
import 'package:get_meat_apps/data/preferences/auth_preferences.dart';
import 'package:get_meat_apps/injection.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/services/services.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState()) {
    getUser();
  }

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

  void getUser() async {
    emit(state.copyWith(asyncUser: const AsyncState.loading()));

    try {
      var userResponse = await CustomerService.fetchUser();

      emit(state.copyWith(
        asyncUser: AsyncState.success(userResponse),
      ));
    } catch (e) {
      print(e);
      if (e is DioError) {
        emit(state.copyWith(asyncUser: AsyncState.error(e)));
      }
    }
  }
}
