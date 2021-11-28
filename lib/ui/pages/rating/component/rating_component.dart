part of '../rating_screen.dart';

class _RatingComponent extends StatelessWidget {
  const _RatingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Berapa bintang untuk kami?',
            style: GetMeatTextStyle.blackFontStyle2.copyWith(
              fontSize: 14.sp,
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          BlocBuilder<RatingCubit, RatingState>(builder: (_, state) {
            return RatingBar.builder(
              initialRating: state.ratingValue.toDouble(),
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: GetMeatColors.green,
              ),
              onRatingUpdate: (rating) {
                context.read<RatingCubit>().onRatingChanged(rating.toInt());
              },
            );
          })
        ],
      ),
    );
  }
}
