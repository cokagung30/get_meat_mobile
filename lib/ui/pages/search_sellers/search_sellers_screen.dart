import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/services/services.dart';
import 'package:get_meat_apps/shared/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_meat_apps/shared/text_style.dart';
import 'package:get_meat_apps/ui/pages/search_sellers/cubit/search_seller_cubit.dart';
import 'package:get_meat_apps/ui/widget/widget.dart';

part 'component/search_input_component.dart';
part 'component/seller_list_component.dart';

class SearchSellersScreen extends StatefulWidget {
  const SearchSellersScreen({Key? key}) : super(key: key);

  @override
  _SearchSellersScreenState createState() => _SearchSellersScreenState();
}

class _SearchSellersScreenState extends State<SearchSellersScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchSellerCubit(),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              const _SearchInputComponent(),
              BlocBuilder<SearchSellerCubit, SearchSellerState>(
                builder: (_, state) {
                  if (state.sellers.isSuccess) {
                    return _SellerListComponent(
                        sellers: state.sellers.data ?? []);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
