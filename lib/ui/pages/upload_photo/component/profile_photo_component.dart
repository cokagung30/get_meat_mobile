part of '../../pages.dart';

class _ProfilePhotoComponent extends StatelessWidget {
  const _ProfilePhotoComponent({Key? key}) : super(key: key);

  Future<void> _onCameraPick(BuildContext context) async {
    final cubit = context.read<UploadPhotoCubit>();

    final ImagePicker _picker = ImagePicker();

    final image = await _picker.pickImage(source: ImageSource.camera);

    Get.back();

    if (image != null) {
      final compress = await FileCompressHelper.compressFile(File(
        image.path,
      ));

      cubit.addPathFile(compress!.path);
    }
  }

  Future<void> _onGalleryPick(BuildContext context) async {
    final cubit = context.read<UploadPhotoCubit>();

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
      allowCompression: true,
    );

    Get.back();

    if (result != null) {
      final compress = await FileCompressHelper.compressFile(
        File(result.paths.first!),
      );

      cubit.addPathFile(compress!.path);
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: _UploadPhotoBottomsheet(
            onTapCamera: () => _onCameraPick(context),
            onTapGallery: () => _onGalleryPick(context),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final cubit = context.read<UploadPhotoCubit>();
    return GestureDetector(
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
          child: BlocSelector<UploadPhotoCubit, UploadPhotoState, String?>(
            selector: (state) => state.photoPathLocal,
            builder: (_, path) {
              return Stack(
                children: [
                  (path != null)
                      ? ClipRRect(
                          borderRadius:
                              BorderRadius.circular(ScreenUtil().radius(100)),
                          child: Image.file(
                            File(path),
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
                        child: (path != null)
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
              );
            },
          ),
        ),
      ),
    );
  }
}
