part of 'transfer_bank_cubit.dart';

class TransferBankState extends Equatable {
  const TransferBankState({
    this.asyncUpload = const AsyncState.uninitialized(),
    this.photoPathLocal,
  });

  final AsyncState<ApiReturnValue<String>> asyncUpload;
  final String? photoPathLocal;

  TransferBankState copyWith({
    AsyncState<ApiReturnValue<String>>? asyncUpload,
    String? photoPathLocal,
  }) {
    return TransferBankState(
      asyncUpload: asyncUpload ?? this.asyncUpload,
      photoPathLocal: photoPathLocal ?? this.photoPathLocal,
    );
  }

  @override
  List<Object> get props => [asyncUpload];
}
