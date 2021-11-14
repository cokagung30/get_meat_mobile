part of 'widget.dart';

enum DropdownEnum { province, city }

class GetMeatDropdown extends StatelessWidget {
  const GetMeatDropdown.provice({
    Key? key,
    required this.label,
    required this.currentSelectedValue,
    this.provinces,
    this.cities,
    this.onChanged,
  })  : type = DropdownEnum.province,
        super(key: key);

  const GetMeatDropdown.city({
    Key? key,
    required this.label,
    required this.currentSelectedValue,
    this.provinces,
    this.cities,
    this.onChanged,
  })  : type = DropdownEnum.city,
        super(key: key);

  final String currentSelectedValue;
  final String label;
  final List<Province>? provinces;
  final List<Cities>? cities;
  final Function(String value)? onChanged;
  final DropdownEnum type;

  @override
  Widget build(BuildContext context) {
    Widget dropdown;
    switch (type) {
      case DropdownEnum.province:
        dropdown = Column(
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
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
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
                  items: provinces!.map(
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
        break;
      case DropdownEnum.city:
        dropdown = Column(
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
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
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
                  items: cities!
                      .asMap()
                      .map(
                        (i, city) => MapEntry(
                          i,
                          DropdownMenuItem(
                            value: i.toString(),
                            child: Text(city.name),
                          ),
                        ),
                      )
                      .values
                      .toList(),
                ),
              ),
            ),
          ],
        );
        break;
    }

    return dropdown;
  }
}
