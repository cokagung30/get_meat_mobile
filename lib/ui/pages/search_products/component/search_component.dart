part of '../search_product_screen.dart';

class _SearchComponent extends StatelessWidget {
  const _SearchComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: GetMeatColors.darkBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: FormBuilderTextField(
              name: 'Search',
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: 'Cari Produk Disini',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                suffixIconConstraints: BoxConstraints(maxHeight: 48.h),
                suffixIcon: IconButton(
                  onPressed: () {
                    context.read<SearchProductCubit>().loadProduct();
                  },
                  icon: const Icon(Icons.search),
                ),
                isDense: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsets.only(top: 12.h, bottom: 12.h, left: 12.w),
              ),
              onChanged: (value) {
                context.read<SearchProductCubit>().searchProduct(value ?? '');
              },
            ),
          ),
        ],
      ),
    );
  }
}
