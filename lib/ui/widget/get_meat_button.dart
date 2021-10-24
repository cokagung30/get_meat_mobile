part of 'widget.dart';

class GetMeatButton extends StatelessWidget {
  const GetMeatButton(
      {Key? key,
      required this.label,
      required this.width,
      required this.height,
      required this.buttonColor,
      this.onPress,
      required this.style})
      : super(key: key);

  final String label;
  final double width;
  final double height;
  final Color buttonColor;
  final Function()? onPress;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
        primary: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),
        ),
      ),
      child: Text(
        label,
        style: style,
      ),
    );
  }
}
