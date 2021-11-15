part of '../../pages.dart';

typedef _VerifyButtonSignInSelector
    = BlocSelector<SignInCubit, SignInState, bool>;

class _SignInButton extends StatelessWidget {
  const _SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _VerifyButtonSignInSelector(
        selector: (state) => state.validated,
        builder: (context, validated) {
          return GetMeatButton(
            label: 'Login',
            width: 280.w,
            height: 45.h,
            buttonColor: GetMeatColors.lightBlue,
            style: GetMeatTextStyle.whiteFontStyle1,
            onPress: () {
              context.read<SignInCubit>().signIn();
            },
          );
        });
  }
}
