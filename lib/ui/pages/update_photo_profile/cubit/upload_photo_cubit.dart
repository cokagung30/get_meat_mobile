import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:get_meat_apps/data/async_state.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/services/services.dart';

part 'upload_photo_state.dart';

class UploadPhotoCubit extends Cubit<UploadPhotoState> {
  UploadPhotoCubit() : super(const UploadPhotoState());

  Future<void> uploadPhoto(int userId) async {
    emit(state.copyWith(asyncUpload: const AsyncState.loading()));

    try {
      if (state.photoPathLocal != null) {
        var result = await CustomerService.uploadProfilePicture(
            state.photoPathLocal!, userId);
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
