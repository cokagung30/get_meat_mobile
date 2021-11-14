part of '../pages.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  _SingUpScreenState createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  final _emailTextField = GlobalKey<FormBuilderFieldState>();
  final _customerNameTextField = GlobalKey<FormBuilderFieldState>();
  final _whatsappNumberTextField = GlobalKey<FormBuilderFieldState>();
  final _phoneNumberTextField = GlobalKey<FormBuilderFieldState>();
  final _passwordTextField = GlobalKey<FormBuilderFieldState>();
  final _addressTextField = GlobalKey<FormBuilderFieldState>();

  Future<void> _onSignUpListener(SignUpState state) async {
    if (state.asyncUser.isSuccess) {
      // Get.back();
    } else if (state.asyncUser.isError) {
      Get.back();
      showDialog(
          context: context,
          builder: (_) {
            return const GetMeatDialogWidget(
              title: 'Registrasi gagal',
              subtitle: 'Terdapat kesalahan, silahkan coba kembali !!',
              asset: GetMeatAssets.crossCircle,
            );
          });
    } else {
      showDialogLoading(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpCubit(),
      child: BlocListener<SignUpCubit, SignUpState>(
        listenWhen: (previous, current) {
          return previous.asyncUser != current.asyncUser;
        },
        listener: (_, state) => _onSignUpListener(state),
        child: CustomViewWithToolbar(
          leadingIcon: Icons.arrow_back,
          onLeadingIconTap: () => Get.back(),
          title: 'Daftar Akun',
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _CustomerNameField(_customerNameTextField),
                    SizedBox(
                      height: 24.h,
                    ),
                    _EmailCustomerTextField(_emailTextField),
                    SizedBox(
                      height: 24.h,
                    ),
                    _PhoneNumberTextField(_phoneNumberTextField),
                    SizedBox(
                      height: 24.h,
                    ),
                    _WhatsappNumberTextField(_whatsappNumberTextField),
                    SizedBox(
                      height: 24.h,
                    ),
                    _PasswordCustomerTextField(_passwordTextField),
                    SizedBox(
                      height: 24.h,
                    ),
                    _AddressTextField(_addressTextField),
                    SizedBox(
                      height: 24.h,
                    ),
                    const _ProvinceDropdownField(),
                    SizedBox(
                      height: 24.h,
                    ),
                    const _CitiesDropDownField(),
                    SizedBox(
                      height: 40.h,
                    ),
                    const _SignUpButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
