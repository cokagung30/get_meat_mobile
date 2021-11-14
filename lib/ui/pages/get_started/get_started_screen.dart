part of '../pages.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(GetMeatAssets.background),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black.withOpacity(0.5),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40.w,
                  vertical: 42.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150.w,
                          height: 100.h,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(GetMeatAssets.logo2))),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Distribusi daging terbaik hanya untuk anda, mudah dipesan, dan harga terjangkau",
                          style: GetMeatTextStyle.whiteFontStyle1,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GetMeatButton(
                          label: 'Yuk Mulai',
                          width: 280.w,
                          height: 45.h,
                          buttonColor: GetMeatColors.lightBlue,
                          style: GetMeatTextStyle.whiteFontStyle2,
                          onPress: () => Get.offAllNamed(
                            GetMeatScreen.register,
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        GetMeatButton(
                          label: 'Login Disini',
                          width: 280.w,
                          height: 45.h,
                          buttonColor: Colors.white,
                          style: GetMeatTextStyle.blackFontStyle2,
                          onPress: () => Get.offAllNamed(
                            GetMeatScreen.login,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
