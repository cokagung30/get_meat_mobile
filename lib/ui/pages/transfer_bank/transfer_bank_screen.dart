import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:get_meat_apps/helper/file_compress_helper.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/routes/get_meat_screen.dart';
import 'package:get_meat_apps/shared/assets.dart';
import 'package:get_meat_apps/shared/colors.dart';
import 'package:get_meat_apps/shared/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_meat_apps/ui/pages/transfer_bank/cubit/transfer_bank_cubit.dart';
import 'package:get_meat_apps/ui/widget/widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

part 'component/header_component.dart';
part 'component/bank_detail_component.dart';
part 'component/payment_proof_component.dart';
part 'component/upload_photo_bottomsheet.dart';
part 'component/upload_proof_button_component.dart';

class TransferBankScreen extends StatefulWidget {
  const TransferBankScreen({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

  @override
  _TransferBankScreenState createState() => _TransferBankScreenState();
}

class _TransferBankScreenState extends State<TransferBankScreen> {
  Future<void> _onUploadPhoto(TransferBankState state) async {
    if (state.asyncUpload.isSuccess) {
      if (state.asyncUpload.data!.isSuccess != false) {
        Get.offAllNamed(GetMeatScreen.main);
      } else {
        Get.back();
        showDialog(
            context: context,
            builder: (_) {
              return GetMeatDialogWidget(
                title: 'Upload Gagal',
                subtitle: state.asyncUpload.data!.message!,
                asset: GetMeatAssets.crossCircle,
              );
            });
      }
    } else if (state.asyncUpload.isError) {
      Get.back();
      showDialog(
          context: context,
          builder: (_) {
            return const GetMeatDialogWidget(
              title: 'Upload foto gagal',
              subtitle: 'Terdapat kesalahan, silahkan coba kembali !!',
              asset: GetMeatAssets.crossCircle,
            );
          });
    } else {
      showDialogLoading(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TransferBankCubit(),
      child: BlocListener<TransferBankCubit, TransferBankState>(
        listenWhen: (prev, curr) {
          return prev.asyncUpload != curr.asyncUpload;
        },
        listener: (_, state) {
          _onUploadPhoto(state);
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white70,
            body: Column(
              children: [
                const _HeaderComponent(),
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 24.h,
                      ),
                      _BankDetailComponent(
                        order: widget.order,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      const PaymentProofComponent(),
                      BlocBuilder<TransferBankCubit, TransferBankState>(
                          builder: (_, state) {
                        return (state.photoPathLocal != null)
                            ? _UploadProofButtonComponent(
                                orderId: widget.order.id)
                            : Container();
                      })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
