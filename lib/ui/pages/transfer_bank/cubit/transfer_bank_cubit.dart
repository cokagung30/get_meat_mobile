import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:get_meat_apps/data/async_state.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/services/services.dart';

part 'transfer_bank_state.dart';

class TransferBankCubit extends Cubit<TransferBankState> {
  TransferBankCubit() : super(const TransferBankState());

  Future<void> uploadPhoto(int orderId) async {
    emit(state.copyWith(asyncUpload: const AsyncState.loading()));
    print(orderId);

    try {
      if (state.photoPathLocal != null) {
        var result = await OrderServices.uploadProofPayment(
            state.photoPathLocal!, orderId);
        emit(state.copyWith(asyncUpload: AsyncState.success(result)));
      }
    } catch (e) {
      print(e);
      if (e is DioError) {
        emit(state.copyWith(asyncUpload: AsyncState.error(e)));
      }
    }
  }

  void addPathFile(String filePath) {
    emit(state.copyWith(photoPathLocal: filePath));
  }
}
