part of '../pages.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  final _emailTextField = GlobalKey<FormBuilderFieldState>();
  final _passwordTextField = GlobalKey<FormBuilderFieldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignInCubit(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150.w,
                    height: 100.h,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(GetMeatAssets.logo))),
                  ),
                  Text(
                    'Masuk dan mulai \nberbelanja',
                    style: GetMeatTextStyle.blackFontStyle3,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  _EmailTextField(_emailTextField),
                  SizedBox(
                    height: 24.h,
                  ),
                  _PasswordTextField(_passwordTextField),
                  SizedBox(
                    height: 40.h,
                  ),
                  GetMeatButton(
                    label: 'Login',
                    width: 280.w,
                    height: 45.h,
                    buttonColor: GetMeatColors.lightBlue,
                    style: GetMeatTextStyle.whiteFontStyle1,
                    onPress: () {},
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                    child: TextButton(
                      child: Text(
                        'Buat Akun Baru',
                        style: GetMeatTextStyle.grayFontStyle2.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onPressed: () => Get.offAllNamed(
                        GetMeatScreen.register,
                      ),
                    ),
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
