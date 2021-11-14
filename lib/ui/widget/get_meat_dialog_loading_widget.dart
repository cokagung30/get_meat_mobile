part of 'widget.dart';

Future<void> showDialogLoading(BuildContext context) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return const DiscasDialogLoadingWidget();
    },
  );
}

Future<void> showGetDialogLoading() async {
  await Get.dialog(
    const DiscasDialogLoadingWidget(),
    barrierDismissible: false,
  );
}

class DiscasDialogLoadingWidget extends StatelessWidget {
  const DiscasDialogLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      insetPadding: EdgeInsets.all(Get.width * 0.25),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(
              color: GetMeatColors.lightBlue,
            ),
            const SizedBox(height: 24),
            Text(
              'Loading...',
              style: GetMeatTextStyle.blackFontStyle1,
            ),
          ],
        ),
      ),
    );
  }
}
