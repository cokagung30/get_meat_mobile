part of '../history_order_page.dart';

class _EmptyOrderComponent extends StatelessWidget {
  const _EmptyOrderComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(
            GetMeatAssets.emptyData,
            width: 250,
            height: 250,
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          Text(
            'Tidak ada data produk',
            style: GetMeatTextStyle.blackFontStyle2,
          ),
        ],
      ),
    );
  }
}
