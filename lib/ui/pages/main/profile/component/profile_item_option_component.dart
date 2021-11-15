part of '../profile_page.dart';

class _ProfileItemOptionComponent extends StatelessWidget {
  const _ProfileItemOptionComponent({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.isLastItem = false,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final IconData icon;
  final bool? isLastItem;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    icon,
                    size: 24,
                    color: GetMeatColors.green,
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GetMeatTextStyle.blackFontStyle2.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: GetMeatTextStyle.grayFontStyle1.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: onTap,
                child: const Icon(Icons.arrow_forward_ios, size: 24),
              )
            ],
          ),
        ),
        (isLastItem == false)
            ? Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 0.2.h,
                    color: GetMeatColors.lightGray,
                  ),
                ],
              )
            : const SizedBox()
      ],
    );
  }
}
