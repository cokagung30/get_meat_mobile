import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_meat_apps/routes/get_meat_screen.dart';
import 'package:get_meat_apps/shared/assets.dart';
import 'package:get_meat_apps/shared/colors.dart';
import 'package:get_meat_apps/shared/text_style.dart';
import 'package:get_meat_apps/ui/widget/widget.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class CompleteTransactionScreen extends StatefulWidget {
  const CompleteTransactionScreen({
    Key? key,
    this.url = '',
  }) : super(key: key);

  final String? url;

  @override
  _CompleteTransactionScreenState createState() =>
      _CompleteTransactionScreenState();
}

class _CompleteTransactionScreenState extends State<CompleteTransactionScreen> {
  bool isPay = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LottieBuilder.asset(
                GetMeatAssets.orderPlacedSuccess,
                width: 200.w,
                height: 200.h,
              ),
              SizedBox(
                height: 33.h,
              ),
              Text(
                'Pemesanan Berhasil',
                style: GetMeatTextStyle.blackFontStyle1.copyWith(
                  fontSize: ScreenUtil().setSp(20),
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                'Pesanan berhasil, silahkan lakukan pembayaran\n dengan menekan tombol dibawah ini',
                style: GetMeatTextStyle.grayFontStyle2,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40.h,
              ),
              GetMeatButton(
                buttonColor: GetMeatColors.darkBlue,
                width: 200.w,
                height: 50.h,
                label: 'Bayar Sekarang',
                style: GetMeatTextStyle.whiteFontStyle1,
                onPress: () async {
                  setState(() {
                    isPay = true;
                  });

                  await launch(widget.url!);
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              GetMeatButton(
                buttonColor: Colors.white,
                width: 200.w,
                height: 50.h,
                label: (isPay) ? 'Selesaikan' : 'Lewati Proses Ini',
                style: GetMeatTextStyle.blackFontStyle2,
                onPress: () async {
                  Get.offAllNamed(GetMeatScreen.main);
                },
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
