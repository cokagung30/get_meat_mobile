import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:get_meat_apps/data/async_state.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/model/request/user_request.dart';
import 'package:get_meat_apps/services/services.dart';
part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(const EditProfileState()) {
    fetchUser();
  }

  void fetchUser() async {
    emit(state.copyWith(asyncUser: const AsyncState.loading()));

    try {
      var result = await CustomerService.fetchUser();
      emit(state.copyWith(
        customerName: result.value?.customerName,
        email: result.value?.customerEmail,
        whatsAppNumber: result.value?.customerWhatsappNumber,
        phoneNumber: result.value?.customerPhoneNumber,
        address: result.value?.customerAddress,
        asyncUser: AsyncState.success(result),
      ));
    } catch (e) {
      if (e is DioError) {
        emit(state.copyWith(asyncUser: AsyncState.error(e)));
      }
    }
  }

  void customerNameChanged(String value) {
    emit(state.copyWith(customerName: value));
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  void phoneNumberChanged(String value) {
    emit(state.copyWith(phoneNumber: value));
  }

  void whatsappNumberChanged(String value) {
    emit(state.copyWith(whatsAppNumber: value));
  }

  void addressChanged(String value) {
    emit(state.copyWith(address: value));
  }

  void updateUser() async {
    emit(state.copyWith(asyncUpdateUser: const AsyncState.loading()));

    final userRequest = UserRequest(
      customerName: state.customerName,
      customerEmail: state.email,
      customerPhoneNumber: state.phoneNumber,
      customerWhatsappNumber: state.whatsAppNumber,
      customerAddress: state.address,
    );

    try {
      var result = await CustomerService.updateUser(request: userRequest);

      emit(state.copyWith(asyncUpdateUser: AsyncState.success(result)));
    } catch (e) {
      print(e);
      if (e is Exception) {
        emit(state.copyWith(asyncUpdateUser: AsyncState.error(e)));
      }
    }
  }
}
