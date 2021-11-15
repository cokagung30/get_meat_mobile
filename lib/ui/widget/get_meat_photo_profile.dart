part of 'widget.dart';

class GetMeatPhotoProfile extends StatelessWidget {
  const GetMeatPhotoProfile({
    Key? key,
    this.imageUrl,
    this.width = 72,
    this.height = 72,
  }) : super(key: key);

  final String? imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: imageUrl != null && imageUrl!.isNotEmpty
          ? CachedNetworkImage(
              imageUrl: imageUrl!,
              imageBuilder: (context, imageProvider) => Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black.withOpacity(0.4),
                  ),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) {
                return Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: GetMeatColors.gray.withOpacity(0.2),
                    border: Border.all(
                      color: GetMeatColors.gray,
                    ),
                  ),
                  child: const Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                      ),
                    ),
                  ),
                );
              },
              errorWidget: (context, url, error) {
                return Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: GetMeatColors.gray.withOpacity(0.2),
                    border: Border.all(
                      color: GetMeatColors.gray,
                    ),
                  ),
                  child: const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                );
              },
            )
          : Image.asset(
              GetMeatAssets.userPhotoNull,
              width: 80,
              height: 80,
            ),
    );
  }
}
