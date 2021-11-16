part of 'widget.dart';

class GetMeatFloatingActionButtonWidget extends StatelessWidget {
  const GetMeatFloatingActionButtonWidget({
    Key? key,
    this.count = 0,
  }) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Stack(
        alignment: const Alignment(1.4, -1.5),
        children: [
          FloatingActionButton(
            // Your actual Fab
            onPressed: () {},
            child: const Icon(Icons.shopping_bag),
            backgroundColor: GetMeatColors.darkBlue,
          ),
          (count == 0)
              ? Container()
              : Container(
                  child: Center(
                    child: Text("$count",
                        style: GetMeatTextStyle.whiteFontStyle2
                            .copyWith(fontSize: 12.sp)),
                  ),
                  padding: const EdgeInsets.all(8),
                  constraints:
                      const BoxConstraints(minHeight: 32, minWidth: 32),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 5,
                          color: Colors.black.withAlpha(50))
                    ],
                    borderRadius: BorderRadius.circular(16),
                    color:
                        GetMeatColors.green, // This would be color of the Badge
                  ),
                ),
        ],
      ),
    );
  }
}
