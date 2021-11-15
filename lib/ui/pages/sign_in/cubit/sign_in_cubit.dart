import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_meat_apps/data/async_state.dart';
import 'package:get_meat_apps/data/preferences/auth_preferences.dart';
import 'package:get_meat_apps/injection.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/services/services.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:get_meat_apps/shared/typedef.dart';
import 'package:tuple/tuple.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInState()) {
    checkIsValidated();
  }

  void emailChanged(String value, bool validated) {
    emit(state.copyWith(email: Tuple2(value, validated)));

    checkIsValidated();
  }

  void passwordChanged(String value, bool validated) {
    emit(state.copyWith(password: Tuple2(value, validated)));

    checkIsValidated();
  }

  void setPasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void checkIsValidated() {
    final validated = state.email.item2 && state.password.item2;

    emit(state.copyWith(validated: validated));
  }

  void signIn() async {
    emit(state.copyWith(asyncUserLogged: const AsyncState.loading()));

    try {
      final result = await CustomerService.signIn(
        state.email.item1!,
        state.password.item1!,
      );

      locator<AuthPreferences>().setPrefData(result.message!, result.value!);

      emit(state.copyWith(asyncUserLogged: AsyncState.success(result)));
    } catch (e) {
      print(e);
      if (e is DioError) {
        emit(state.copyWith(asyncUserLogged: AsyncState.error(e)));
      }
    }
  }
}
