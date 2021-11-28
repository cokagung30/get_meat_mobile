part of 'sended_proof_cubit.dart';

class SendedProofState extends Equatable {
  const SendedProofState({
    this.asyncUpload = const AsyncState.uninitialized(),
    this.photoPathLocal,
  });

  final AsyncState<ApiReturnValue<String>> asyncUpload;
  final String? photoPathLocal;

  SendedProofState copyWith({
    AsyncState<ApiReturnValue<String>>? asyncUpload,
    String? photoPathLocal,
  }) {
    return SendedProofState(
      asyncUpload: asyncUpload ?? this.asyncUpload,
      photoPathLocal: photoPathLocal ?? this.photoPathLocal,
    );
  }

  @override
  List<Object?> get props => [asyncUpload, photoPathLocal];
}
