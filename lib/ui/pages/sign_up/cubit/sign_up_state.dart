part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.customerName = const Tuple2(null, false),
    this.email = const Tuple2(null, false),
    this.whatsAppNumber = const Tuple2(null, false),
    this.phoneNumber = const Tuple2(null, false),
    this.password = const Tuple2(null, false),
    this.address = const Tuple2(null, false),
    this.isPasswordVisible = false,
    this.validated = false,
    this.provinces = const [],
    this.cities = const [],
    this.province = "1",
    this.city = "0",
    this.isLoading = false,
    this.asyncUser = const AsyncState.uninitialized(),
  });

  final FieldValidation customerName;
  final FieldValidation email;
  final FieldValidation whatsAppNumber;
  final FieldValidation phoneNumber;
  final FieldValidation password;
  final FieldValidation address;
  final bool isPasswordVisible;
  final bool validated;
  final List<Province> provinces;
  final List<Cities> cities;
  final String province;
  final bool isLoading;
  final String city;
  final AsyncState<ApiReturnValue<User>> asyncUser;

  SignUpState copyWith({
    FieldValidation? customerName,
    FieldValidation? email,
    FieldValidation? whatsAppNumber,
    FieldValidation? phoneNumber,
    FieldValidation? password,
    FieldValidation? address,
    bool? isPasswordVisible,
    bool? validated,
    List<Province>? provinces,
    List<Cities>? cities,
    String? province,
    String? city,
    bool? isLoading,
    AsyncState<ApiReturnValue<User>>? asyncUser,
  }) {
    return SignUpState(
      customerName: customerName ?? this.customerName,
      email: email ?? this.email,
      whatsAppNumber: whatsAppNumber ?? this.whatsAppNumber,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      address: address ?? this.address,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      validated: validated ?? this.validated,
      cities: cities ?? this.cities,
      provinces: provinces ?? this.provinces,
      province: province ?? this.province,
      city: city ?? this.city,
      isLoading: isLoading ?? this.isLoading,
      asyncUser: asyncUser ?? this.asyncUser,
    );
  }

  @override
  List<Object> get props => [
        customerName,
        email,
        whatsAppNumber,
        phoneNumber,
        password,
        address,
        isPasswordVisible,
        validated,
        provinces,
        cities,
        province,
        city,
        isLoading,
        asyncUser,
      ];
}
