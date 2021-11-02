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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpCubit(),
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
                    height: 40.h,
                  ),
                  GetMeatButton(
                    label: 'Lanjutkan',
                    width: 280.w,
                    height: 45.h,
                    buttonColor: GetMeatColors.lightBlue,
                    style: GetMeatTextStyle.whiteFontStyle1,
                    onPress: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
