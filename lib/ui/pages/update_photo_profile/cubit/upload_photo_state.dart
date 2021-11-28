part of 'upload_photo_cubit.dart';

class UploadPhotoState extends Equatable {
  const UploadPhotoState({
    this.asyncUpload = const AsyncState.uninitialized(),
    this.photoPathLocal,
  });

  final AsyncState<ApiReturnValue<User>> asyncUpload;
  final String? photoPathLocal;

  UploadPhotoState copyWith({
    AsyncState<ApiReturnValue<User>>? asyncUpload,
    String? photoPathLocal,
  }) {
    return UploadPhotoState(
      asyncUpload: asyncUpload ?? this.asyncUpload,
      photoPathLocal: photoPathLocal ?? this.photoPathLocal,
    );
  }

  @override
  List<Object> get props => [asyncUpload];
}
