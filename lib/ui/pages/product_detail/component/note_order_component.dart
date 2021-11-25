part of '../product_detail_screen.dart';

// ignore: must_be_immutable
class _NoteOrderComponent extends StatelessWidget {
  const _NoteOrderComponent({
    Key? key,
    this.lastNote,
    this.controller,
  }) : super(key: key);

  final String? lastNote;

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    if (lastNote != null) {
      controller!.text = lastNote!;
    }
    return Container(
      width: double.infinity,
      height: 40.h,
      padding: EdgeInsets.only(
        top: 12.h,
        left: 16.w,
        right: 16.w,
      ),
      child: TextFormField(
        initialValue: lastNote ?? '',
        keyboardType: TextInputType.multiline,
        maxLines: 8,
        minLines: 1,
        // controller: controller,
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
        onChanged: (value) {
          context.read<ProductDetailCubit>().changeNote(value);
        },
      ),
    );
  }
}
