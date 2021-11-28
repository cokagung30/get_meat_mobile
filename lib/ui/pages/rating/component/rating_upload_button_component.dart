part of '../rating_screen.dart';

typedef _VerifyButtonRatingSelector
    = BlocSelector<RatingCubit, RatingState, bool>;

class _RatingUploadButtonComponent extends StatelessWidget {
  const _RatingUploadButtonComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _VerifyButtonRatingSelector(
      selector: (state) => state.validated,
      builder: (context, validated) {
        return GetMeatButton(
          label: 'Simpan',
          width: 280.w,
          height: 45.h,
          buttonColor: GetMeatColors.lightBlue,
          style: GetMeatTextStyle.whiteFontStyle1,
          onPress: () {
            context.read<RatingCubit>().sendRating();
          },
        );
      },
    );
  }
}
