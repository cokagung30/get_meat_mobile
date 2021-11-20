part of '../transfer_bank_screen.dart';

class PaymentProofComponent extends StatelessWidget {
  const PaymentProofComponent({Key? key}) : super(key: key);

  Future<void> _onCameraPick(BuildContext context) async {
    final cubit = context.read<TransferBankCubit>();

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
    final cubit = context.read<TransferBankCubit>();

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showPicker(context);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.sp),
          color: Colors.white,
        ),
        child: BlocSelector<TransferBankCubit, TransferBankState, String?>(
          selector: (state) => state.photoPathLocal,
          builder: (_, path) {
            return Stack(
              children: [
                (path != null)
                    ? Center(
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(ScreenUtil().radius(20)),
                          child: Image.file(
                            File(path),
                            width: double.infinity,
                            height: 300.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Center(
                        child: LottieBuilder.asset(
                          GetMeatAssets.fileUpload,
                          width: 150.w,
                          height: 150.h,
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
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
}
