part of '../product_detail_screen.dart';

typedef _VerifyButtonAddCartSelector
    = BlocSelector<ProductDetailCubit, ProductDetailState, bool>;

class _AddCartButtonComponent extends StatelessWidget {
  const _AddCartButtonComponent({
    Key? key,
    this.product,
    this.notes = "",
  }) : super(key: key);

  final Product? product;
  final String notes;

  @override
  Widget build(BuildContext context) {
    return _VerifyButtonAddCartSelector(
        selector: (state) => state.isDiffSeller,
        builder: (context, isDiffSeller) {
          return Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            child: GetMeatButton(
              label: 'Pesan Sekarang ',
              width: double.infinity,
              height: 40.h,
              buttonColor: GetMeatColors.darkBlue,
              style: GetMeatTextStyle.whiteFontStyle1.copyWith(
                fontSize: 16.sp,
              ),
              onPress: () {
                context.read<ProductDetailCubit>().addToCart(notes);
              },
            ),
          );
        });
  }
}
