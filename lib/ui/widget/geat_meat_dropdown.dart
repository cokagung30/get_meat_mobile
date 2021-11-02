part of 'widget.dart';

class GeatMeatDropdown extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const GeatMeatDropdown({
    required this.label,
    required this.currentSelectedValue,
    required this.provinces,
    this.onChanged,
  });

  final String currentSelectedValue;
  final String label;
  final List<Province> provinces;
  final Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GetMeatTextStyle.grayFontStyle1,
        ),
        SizedBox(
          height: 6.h,
        ),
        InputDecorator(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            suffixIconConstraints: BoxConstraints(maxHeight: 48.h),
            contentPadding: EdgeInsets.only(
                top: 12.h, bottom: 12.h, left: 12.w, right: 12.w),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: currentSelectedValue,
              isDense: true,
              iconSize: 14.sp,
              style: GetMeatTextStyle.blackFontStyle2
                  .copyWith(fontWeight: FontWeight.normal, fontSize: 14),
              onChanged: (value) => onChanged!(value.toString()),
              items: provinces.map(
                (province) {
                  return DropdownMenuItem(
                    value: province.provinceId.toString(),
                    child: Text(province.name),
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
