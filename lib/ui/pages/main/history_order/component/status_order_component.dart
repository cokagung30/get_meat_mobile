part of '../history_order_page.dart';

class _StatusOrderComponent extends StatelessWidget {
  const _StatusOrderComponent({Key? key, this.selectedIndex = 0})
      : super(key: key);

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: () {
            context.read<HistoryOrderCubit>().selectedPage(0);
          },
          child: _buildItemStatusOrder(
              'Keranjang Belanja', (selectedIndex == 0) ? true : false),
        ),
        SizedBox(width: 5.w),
        GestureDetector(
          onTap: () {
            context.read<HistoryOrderCubit>().selectedPage(1);
          },
          child: _buildItemStatusOrder(
              'Belum Dibayar', (selectedIndex == 1) ? true : false),
        ),
        SizedBox(width: 5.w),
        GestureDetector(
          onTap: () {
            context.read<HistoryOrderCubit>().selectedPage(2);
          },
          child: _buildItemStatusOrder(
              'Sudah Dibayar', (selectedIndex == 2) ? true : false),
        ),
        SizedBox(width: 5.w),
        GestureDetector(
          onTap: () {
            context.read<HistoryOrderCubit>().selectedPage(3);
          },
          child: _buildItemStatusOrder(
              'Sudah Dikirim', (selectedIndex == 3) ? true : false),
        ),
        SizedBox(width: 5.w),
        GestureDetector(
          onTap: () {
            context.read<HistoryOrderCubit>().selectedPage(4);
          },
          child: _buildItemStatusOrder(
              'Selesai', (selectedIndex == 4) ? true : false),
        ),
        SizedBox(width: 10.w),
      ],
    );
  }

  Widget _buildItemStatusOrder(String title, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: (isSelected) ? GetMeatColors.green : GetMeatColors.lightGray),
      child: Center(
        child: Text(
          title,
          style: GetMeatTextStyle.blackFontStyle2.copyWith(
              fontSize: 12.sp,
              color: (isSelected) ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
