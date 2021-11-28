part of '../detail_order_screen.dart';

class _PhotoProofTransfer extends StatelessWidget {
  const _PhotoProofTransfer({Key? key, this.photoProofTransfer})
      : super(key: key);

  final String? photoProofTransfer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bukti Transfer',
            style: GetMeatTextStyle.blackFontStyle2.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(ScreenUtil().radius(8)),
              child: CachedNetworkImage(
                imageUrl: "$imageURL$photoProofTransfer",
                imageBuilder: (context, imageProvider) => Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
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
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
