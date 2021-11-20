part of '../payment_screen.dart';

class _PaymentTypeOption extends StatelessWidget {
  const _PaymentTypeOption(
      {Key? key,
      required this.onTapTransferBank,
      required this.onTapPaymentGateway})
      : super(key: key);

  final GestureTapCallback onTapTransferBank;

  final GestureTapCallback onTapPaymentGateway;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16),
        ListTile(
          leading: const Icon(
            Icons.payments_sharp,
            size: 24,
          ),
          title: Text(
            "Bank Transfer",
            style: GetMeatTextStyle.blackFontStyle2.copyWith(fontSize: 16),
          ),
          onTap: onTapTransferBank,
        ),
        ListTile(
          leading: const Icon(
            Icons.payment,
            size: 24,
          ),
          title: Text(
            "Midtrans Payment Gateway",
            style: GetMeatTextStyle.blackFontStyle2.copyWith(fontSize: 16),
          ),
          onTap: onTapPaymentGateway,
        ),
      ],
    );
  }
}
