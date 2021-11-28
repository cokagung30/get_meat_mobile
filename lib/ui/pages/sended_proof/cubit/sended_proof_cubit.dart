import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:get_meat_apps/data/async_state.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/services/services.dart';

part 'sended_proof_state.dart';

class SendedProofCubit extends Cubit<SendedProofState> {
  SendedProofCubit() : super(const SendedProofState());

  Future<void> uploadPhotoSendProof(int orderId) async {
    emit(state.copyWith(asyncUpload: const AsyncState.loading()));

    try {
      if (state.photoPathLocal != null) {
        var result = await OrderServices.uploadSendedProof(
            state.photoPathLocal!, orderId);
        emit(state.copyWith(asyncUpload: AsyncState.success(result)));
      }
    } catch (e) {
      if (e is DioError) {
        emit(state.copyWith(asyncUpload: AsyncState.error(e)));
      }
    }
  }

  void addPathFile(String filePath) {
    emit(state.copyWith(photoPathLocal: filePath));
  }
}
