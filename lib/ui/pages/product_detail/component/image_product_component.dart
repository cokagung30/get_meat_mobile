part of '../product_detail_screen.dart';

class _ImageProductComponent extends StatelessWidget {
  const _ImageProductComponent({Key? key, this.productPic}) : super(key: key);

  final String? productPic;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200.h,
          width: double.infinity,
          child: CachedNetworkImage(
            imageUrl: "$imageURL$productPic",
            placeholder: (context, url) =>
                const CircularProgressIndicator(strokeWidth: 2),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 200.h,
          width: double.infinity,
          color: Colors.black.withOpacity(0.4),
        ),
      ],
    );
  }
}
