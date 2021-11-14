part of '../../pages.dart';

typedef CitiesSelector = BlocSelector<SignUpCubit, SignUpState, String>;

class _CitiesDropDownField extends StatelessWidget {
  const _CitiesDropDownField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CitiesSelector(
      selector: (state) => state.city,
      builder: (_, state) {
        return BlocBuilder<SignUpCubit, SignUpState>(
          builder: (_, states) => GetMeatDropdown.city(
            label: 'Kota',
            currentSelectedValue: states.city,
            cities: states.cities,
            onChanged: (value) {
              context.read<SignUpCubit>().selectCity(value);
            },
          ),
        );
      },
    );
  }
}
