part of '../../pages.dart';

typedef ProvinceSelector = BlocSelector<SignUpCubit, SignUpState, String>;

class _ProvinceDropdownField extends StatelessWidget {
  const _ProvinceDropdownField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProvinceSelector(
      selector: (state) => state.province,
      builder: (_, province) {
        return BlocBuilder<SignUpCubit, SignUpState>(builder: (context, state) {
          return GetMeatDropdown.provice(
            label: 'Provinsi',
            currentSelectedValue: province,
            provinces: state.provinces,
            onChanged: (value) {
              context.read<SignUpCubit>().selectProvince(value);
              context.read<SignUpCubit>().getCities();
            },
          );
        });
      },
    );
  }
}
