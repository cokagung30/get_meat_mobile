part of '../product_detail_screen.dart';

typedef _VerifyButtonAddCartSelector
    = BlocSelector<ProductDetailCubit, ProductDetailState, bool>;

class _AddCartButtonComponent extends StatelessWidget {
  const _AddCartButtonComponent({Key? key, this.product}) : super(key: key);

  final Product? product;

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
              onPress: (isDiffSeller)
                  ? null
                  : () {
                      context.read<ProductDetailCubit>().addToCart();
                      Get.toNamed(GetMeatScreen.payment, arguments: {
                        'product': product,
                      });
                    },
            ),
          );
        });
  }
}
