import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_meat_apps/data/async_state.dart';
import 'package:get_meat_apps/model/request/user_request.dart';
import 'package:get_meat_apps/services/services.dart';
import 'package:get_meat_apps/shared/typedef.dart';
import 'package:tuple/tuple.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(const ForgotPasswordState());

  void emailChanged(String value, bool validated) {
    emit(state.copyWith(email: Tuple2(value, validated)));
  }

  void oldPasswordChanged(String value, bool validated) {
    emit(state.copyWith(oldPassword: Tuple2(value, validated)));
  }

  void newPasswordChanged(String value, bool validated) {
    emit(state.copyWith(newPassword: Tuple2(value, validated)));
  }

  void setOldPasswordVisibility() {
    emit(state.copyWith(isOldPasswordVisible: !state.isOldPasswordVisible));
  }

  void setNewPasswordVisibility() {
    emit(state.copyWith(isNewPasswordVisible: !state.isNewPasswordVisible));
  }

  void changePassword() async {
    emit(state.copyWith(asyncChangePassword: const AsyncState.loading()));

    final request = ChangePasswordRequest(
      customerEmail: state.email.item1 ?? '',
      oldPassword: state.oldPassword.item1 ?? '',
      newPassword: state.newPassword.item1 ?? '',
    );

    try {
      final result = await CustomerService.updatePassword(request: request);

      emit(state.copyWith(
        asyncChangePassword: AsyncState.success(result.isSuccess),
      ));
    } catch (e) {
      if (e is Exception) {
        emit(state.copyWith(asyncChangePassword: AsyncState.error(e)));
      }
    }
  }
}
