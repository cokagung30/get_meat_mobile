part of '../home_page.dart';

class _SellerListComponent extends StatelessWidget {
  const _SellerListComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Temukan Pedagang Terbaik Disini',
            style: GetMeatTextStyle.blackFontStyle2,
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.arrow_right),
          )
        ],
      ),
    );
  }
}
