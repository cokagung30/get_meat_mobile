part of '../pages.dart';

class UploadPhotoScreen extends StatefulWidget {
  const UploadPhotoScreen({Key? key, required this.userId}) : super(key: key);

  final int userId;

  @override
  _UploadPhotoScreenState createState() => _UploadPhotoScreenState();
}

class _UploadPhotoScreenState extends State<UploadPhotoScreen> {
  File? _image;

  _imageForCamera() async {
    ImagePicker _picker = ImagePicker();

    XFile? image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = File(image!.path);
    });
  }

  _imageFromGallery() async {
    ImagePicker _picker = ImagePicker();

    XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomViewWithToolbar(
      leadingIcon: Icons.arrow_back,
      onLeadingIconTap: () => Get.back(),
      title: 'Upload Photo',
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  _showPicker(context);
                },
                child: Center(
                  child: Container(
                    width: 130,
                    height: 130,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        ScreenUtil().radius(100),
                      ),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.2),
                        width: 1,
                      ),
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        (_image != null)
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    ScreenUtil().radius(100)),
                                child: Image.file(
                                  _image!,
                                  width: 130,
                                  height: 130,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : SvgPicture.asset(
                                GetMeatAssets.userPhotoNull,
                                width: 130,
                                height: 130,
                              ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 60.h,
                              left: 30.w,
                            ),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  ScreenUtil().radius(100),
                                ),
                              ),
                              child: (_image != null)
                                  ? SvgPicture.asset(
                                      GetMeatAssets.btnRemovePhoto,
                                      width: 30,
                                      height: 30,
                                    )
                                  : SvgPicture.asset(
                                      GetMeatAssets.btnAddPhoto,
                                      width: 30,
                                      height: 30,
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 26.h,
              ),
              Column(
                children: [
                  Text(
                    'Cokorda Gde Agung',
                    style: GetMeatTextStyle.blackFontStyle3,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    'cokkagung@gmail.com',
                    style: GetMeatTextStyle.grayFontStyle2.copyWith(
                      fontSize: ScreenUtil().setSp(14),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 88.h,
                  ),
                  GetMeatButton(
                    label: 'Upload dan Lanjutkan',
                    width: 280.w,
                    height: 45.h,
                    buttonColor: GetMeatColors.lightBlue,
                    style: GetMeatTextStyle.whiteFontStyle1,
                    onPress: (_image != null)
                        ? () {
                            print('Test');
                          }
                        : null,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                    child: TextButton(
                      child: Text(
                        'Lewati tahap ini',
                        style: GetMeatTextStyle.grayFontStyle2.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(
                    Icons.folder,
                    size: 24,
                  ),
                  title: Text(
                    "Upload dari galeri",
                    style:
                        GetMeatTextStyle.blackFontStyle2.copyWith(fontSize: 16),
                  ),
                  onTap: () {
                    _imageFromGallery();
                    Navigator.of(context).pop();
                  }),
              ListTile(
                leading: const Icon(
                  Icons.camera_alt,
                  size: 24,
                ),
                title: Text(
                  "Ambil gambar",
                  style:
                      GetMeatTextStyle.blackFontStyle2.copyWith(fontSize: 16),
                ),
                onTap: () {
                  _imageForCamera();
                  Get.back();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
