import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_meat_apps/data/async_state.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/services/services.dart';
import 'package:tuple/tuple.dart';
import 'package:get_meat_apps/shared/typedef.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState()) {
    checkIsValidated();
    getProvinces();
    getCities();
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

  void selectCity(value) {
    emit(state.copyWith(city: value));
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

  void getCities() async {
    emit(state.copyWith(isLoading: true));
    try {
      ApiReturnValue<List<Cities>> result =
          await LocationServices.getCities(int.parse(state.province));

      if (result.value != null) {
        emit(state.copyWith(cities: result.value, isLoading: false));
      }
    } catch (e) {
      print(e);
    }
  }

  void signUp() async {
    emit(state.copyWith(asyncUser: const AsyncState.loading()));
    try {
      var result = await CustomerService.signUp(User(
        id: 0,
        customerName: state.customerName.item1!,
        customerEmail: state.email.item1!,
        customerAddress: state.address.item1!,
        customerWhatsappNumber: state.whatsAppNumber.item1!,
        customerPhoneNumber: state.phoneNumber.item1!,
        customerPassword: state.password.item1!,
        customerProvince: int.parse(state.province),
        customerCity:
            int.parse(state.cities[int.parse(state.city)].cityId.toString()),
        customerProfilePicture: '',
      ));

      print(result);

      emit(state.copyWith(
        isLoading: false,
        asyncUser: AsyncState.success(result),
      ));
    } catch (e) {
      print(e);

      if (e is Exception) {
        emit(state.copyWith(
          asyncUser: AsyncState.error(e),
        ));
      }
    }
  }
}
