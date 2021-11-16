part of '../product_detail_screen.dart';

class _NoteOrderComponent extends StatelessWidget {
  const _NoteOrderComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40.h,
      padding: EdgeInsets.only(
        top: 12.h,
        left: 16.w,
        right: 16.w,
      ),
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: 8,
        minLines: 1,
        style: GetMeatTextStyle.blackFontStyle2.copyWith(
          fontSize: 12.sp,
        ),
        decoration: InputDecoration.collapsed(
          hintText: 'Permintaanmu akan disesuaikan dengan kebijakan pedagang',
          hintStyle: GetMeatTextStyle.grayFontStyle1.copyWith(
            fontSize: 12.sp,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
