part of '../../pages.dart';

typedef _VerifyButtonSelector = BlocSelector<SignUpCubit, SignUpState, bool>;

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _VerifyButtonSelector(
      selector: (state) => state.validated,
      builder: (context, conditions) {
        return GetMeatButton(
          label: 'Lanjutkan',
          width: 280.w,
          height: 45.h,
          buttonColor: GetMeatColors.lightBlue,
          style: GetMeatTextStyle.whiteFontStyle1,
          onPress: () {
            context.read<SignUpCubit>().signUp();
          },
        );
      },
    );
  }
}
