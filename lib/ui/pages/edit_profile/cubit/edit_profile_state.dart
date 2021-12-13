part of 'edit_profile_cubit.dart';

class EditProfileState extends Equatable {
  const EditProfileState({
    this.asyncUser = const AsyncState.uninitialized(),
    this.asyncUpdateUser = const AsyncState.uninitialized(),
    this.customerName = '',
    this.email = '',
    this.whatsAppNumber = '',
    this.phoneNumber = '',
    this.address = '',
  });

  final AsyncState<ApiReturnValue<User>> asyncUser;
  final AsyncState<ApiReturnValue<User>> asyncUpdateUser;
  final String customerName;
  final String email;
  final String whatsAppNumber;
  final String phoneNumber;
  final String address;

  EditProfileState copyWith({
    AsyncState<ApiReturnValue<User>>? asyncUser,
    AsyncState<ApiReturnValue<User>>? asyncUpdateUser,
    String? customerName,
    String? email,
    String? whatsAppNumber,
    String? phoneNumber,
    String? address,
  }) {
    return EditProfileState(
      asyncUser: asyncUser ?? this.asyncUser,
      asyncUpdateUser: asyncUpdateUser ?? this.asyncUpdateUser,
      customerName: customerName ?? this.customerName,
      email: email ?? this.email,
      whatsAppNumber: whatsAppNumber ?? this.whatsAppNumber,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
    );
  }

  @override
  List<Object> get props => [
        asyncUser,
        asyncUpdateUser,
        customerName,
        email,
        whatsAppNumber,
        phoneNumber,
        address,
      ];
}
