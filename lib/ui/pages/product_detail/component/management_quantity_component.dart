part of '../product_detail_screen.dart';

class _ManagementQuantityComponent extends StatelessWidget {
  const _ManagementQuantityComponent({
    Key? key,
    this.quantity = 1,
  }) : super(key: key);

  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              context.read<ProductDetailCubit>().minQty();
            },
            icon: Icon(
              Icons.remove,
              size: 24.sp,
              color: GetMeatColors.green,
            ),
          ),
          Text(
            '$quantity',
            style: GetMeatTextStyle.blackFontStyle2.copyWith(
              fontSize: 16.sp,
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<ProductDetailCubit>().addQty();
            },
            icon: Icon(
              Icons.add,
              size: 24.sp,
              color: GetMeatColors.green,
            ),
          ),
        ],
      ),
    );
  }
}
