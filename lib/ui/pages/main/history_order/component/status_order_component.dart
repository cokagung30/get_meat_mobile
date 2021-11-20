part of '../history_order_page.dart';

class _StatusOrderComponent extends StatelessWidget {
  const _StatusOrderComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        SizedBox(width: 10.w),
        _buildItemStatusOrder('Keranjang Belanja', true),
        SizedBox(width: 5.w),
        _buildItemStatusOrder('Belum Dibayar', false),
        SizedBox(width: 5.w),
        _buildItemStatusOrder('Sudah Dibayar', false),
        SizedBox(width: 5.w),
        _buildItemStatusOrder('Sedang Diantar', false),
        SizedBox(width: 5.w),
        _buildItemStatusOrder('Selesai', false),
        SizedBox(width: 10.w),
      ],
    );
  }

  Widget _buildItemStatusOrder(String title, bool isSelected) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: (isSelected) ? GetMeatColors.green : GetMeatColors.lightGray),
      child: Text(
        title,
        style: GetMeatTextStyle.blackFontStyle2.copyWith(
            fontSize: 14, color: (isSelected) ? Colors.white : Colors.black),
      ),
    );
  }
}
