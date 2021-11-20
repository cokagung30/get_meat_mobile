part of '../transfer_bank_screen.dart';

class _UploadPhotoBottomsheet extends StatelessWidget {
  const _UploadPhotoBottomsheet(
      {required this.onTapCamera, required this.onTapGallery});

  final GestureTapCallback onTapGallery;

  final GestureTapCallback onTapCamera;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16),
        ListTile(
          leading: const Icon(
            Icons.folder,
            size: 24,
          ),
          title: Text(
            "Upload dari galeri",
            style: GetMeatTextStyle.blackFontStyle2.copyWith(fontSize: 16),
          ),
          onTap: onTapGallery,
        ),
        ListTile(
          leading: const Icon(
            Icons.camera_alt,
            size: 24,
          ),
          title: Text(
            "Ambil gambar",
            style: GetMeatTextStyle.blackFontStyle2.copyWith(fontSize: 16),
          ),
          onTap: onTapCamera,
        ),
      ],
    );
  }
}
