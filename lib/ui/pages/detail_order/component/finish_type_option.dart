part of '../detail_order_screen.dart';

class _FinishTypeOption extends StatelessWidget {
  const _FinishTypeOption(
      {Key? key,
      required this.onTapFinishOrder,
      required this.onTapToUploadSendedProof})
      : super(key: key);

  final GestureTapCallback onTapFinishOrder;

  final GestureTapCallback onTapToUploadSendedProof;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16),
        ListTile(
          leading: const Icon(
            Icons.check,
            size: 24,
          ),
          title: Text(
            "Selesaikan Transaksi",
            style: GetMeatTextStyle.blackFontStyle2.copyWith(fontSize: 16),
          ),
          onTap: onTapFinishOrder,
        ),
        ListTile(
          leading: const Icon(
            Icons.upload,
            size: 24,
          ),
          title: Text(
            "Upload Bukti Pesanan Anda",
            style: GetMeatTextStyle.blackFontStyle2.copyWith(fontSize: 16),
          ),
          onTap: onTapToUploadSendedProof,
        ),
      ],
    );
  }
}
