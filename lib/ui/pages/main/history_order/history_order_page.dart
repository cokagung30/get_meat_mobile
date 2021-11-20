import 'package:flutter/material.dart';

import 'package:get_meat_apps/shared/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_meat_apps/shared/text_style.dart';

part 'component/header_component.dart';
part 'component/status_order_component.dart';

class HistoryOrderPage extends StatefulWidget {
  const HistoryOrderPage({Key? key}) : super(key: key);

  @override
  _HistoryOrderPageState createState() => _HistoryOrderPageState();
}

class _HistoryOrderPageState extends State<HistoryOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: GetMeatColors.darkBlue,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              const _HeaderComponent(),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 30.h,
                child: const _StatusOrderComponent(),
              )
            ],
          ),
        )
      ],
    );
  }
}
