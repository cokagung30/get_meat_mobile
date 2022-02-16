part of '../product_detail_screen.dart';

// ignore: must_be_immutable
class _ManagementQuantityComponent extends StatelessWidget {
  _ManagementQuantityComponent({
    Key? key,
    this.quantity = 1,
    this.controller,
    required this.unitSelected,
  }) : super(key: key);

  final double quantity;
  final String unitSelected;
  final TextEditingController? controller;

  List<String> units = ['gram', 'kilogram'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 16.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 100,
            height: 40,
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              bottom: 6.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Colors.black),
              color: Colors.white,
            ),
            child: Center(
              child: TextFormField(
                initialValue: quantity.toString(),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                style: GetMeatTextStyle.blackFontStyle4,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (text) {
                  context.read<ProductDetailCubit>().changeQuantity(text);
                },
              ),
            ),
          ),
          Container(
            width: 120,
            height: 40,
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              // bottom: 7.5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Colors.black),
              color: Colors.white,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: unitSelected,
                isDense: true,
                iconSize: 14.sp,
                style: GetMeatTextStyle.blackFontStyle2
                    .copyWith(fontWeight: FontWeight.normal, fontSize: 14),
                onChanged: (value) {
                  context
                      .read<ProductDetailCubit>()
                      .selectedUnit(value.toString());
                },
                items: units.map(
                  (unit) {
                    return DropdownMenuItem(
                      value: unit,
                      child: Text(unit),
                    );
                  },
                ).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
