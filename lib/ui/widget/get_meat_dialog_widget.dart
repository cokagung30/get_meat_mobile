part of 'widget.dart';

class GetMeatDialogButtonModel {
  GetMeatDialogButtonModel({
    required this.label,
    required this.onTap,
    required this.color,
  });

  final String label;

  final GestureTapCallback onTap;

  final Color color;
}

class GetMeatDialogWidget extends StatelessWidget {
  const GetMeatDialogWidget({
    Key? key,
    required this.subtitle,
    this.title,
    this.asset,
    this.positiveButton,
    this.negativeButton,
  }) : super(key: key);

  final String? title;

  final String? asset;

  final String subtitle;

  final GetMeatDialogButtonModel? positiveButton;

  final GetMeatDialogButtonModel? negativeButton;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: title == null && asset != null ? 24 : 8),
            if (title != null)
              Text(
                title!,
                style: GetMeatTextStyle.blackFontStyle1.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (title == null && asset != null) SvgPicture.asset(asset!),
            const SizedBox(height: 20),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: GetMeatTextStyle.blackFontStyle1.copyWith(
                fontSize: 14,
                height: 1.8,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                if (positiveButton != null)
                  Expanded(
                    child: TextButton(
                      onPressed: () => positiveButton!.onTap.call(),
                      child: Text(
                        positiveButton!.label,
                        style: GetMeatTextStyle.blackFontStyle1.copyWith(
                          color: positiveButton!.color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                if (negativeButton != null)
                  Expanded(
                    child: TextButton(
                      onPressed: () => negativeButton!.onTap.call(),
                      child: Text(
                        negativeButton!.label,
                        style: GetMeatTextStyle.blackFontStyle1.copyWith(
                          color: negativeButton!.color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
