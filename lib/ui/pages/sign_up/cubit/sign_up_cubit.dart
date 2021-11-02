import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/services/services.dart';
import 'package:tuple/tuple.dart';
import 'package:get_meat_apps/shared/typedef.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState()) {
    checkIsValidated();
    getProvinces();
  }

  void customerNameChanged(String value, bool validated) {
    emit(state.copyWith(customerName: Tuple2(value, validated)));

    checkIsValidated();
  }

  void emailChanged(String value, bool validated) {
    emit(state.copyWith(email: Tuple2(value, validated)));

    checkIsValidated();
  }

  void phoneNumberChanged(String value, bool validated) {
    emit(state.copyWith(phoneNumber: Tuple2(value, validated)));

    checkIsValidated();
  }

  void whatsappNumberChanged(String value, bool validated) {
    emit(state.copyWith(whatsAppNumber: Tuple2(value, validated)));

    checkIsValidated();
  }

  void passwordChanged(String value, bool validated) {
    emit(state.copyWith(password: Tuple2(value, validated)));

    checkIsValidated();
  }

  void addressChanged(String value, bool validated) {
    emit(state.copyWith(address: Tuple2(value, validated)));

    checkIsValidated();
  }

  void setPasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void selectProvince(value) {
    emit(state.copyWith(province: value));
  }

  void checkIsValidated() {
    final validated = state.customerName.item2 &&
        state.email.item2 &&
        state.whatsAppNumber.item2 &&
        state.phoneNumber.item2 &&
        state.password.item2 &&
        state.address.item2;
    emit(state.copyWith(validated: validated));
  }

  void getProvinces() async {
    ApiReturnValue<List<Province>> result =
        await LocationServices.getProvince();

    if (result.value != null) {
      emit(state.copyWith(provinces: result.value));
    }
  }
}
