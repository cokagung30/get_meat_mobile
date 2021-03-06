import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/state_manager.dart';
import 'package:get_meat_apps/data/preferences/auth_preferences.dart';
import 'package:get_meat_apps/helper/file_compress_helper.dart';
import 'package:get_meat_apps/injection.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/routes/get_meat_screen.dart';
import 'package:get_meat_apps/shared/assets.dart';
import 'package:get_meat_apps/shared/colors.dart';
import 'package:get_meat_apps/shared/text_style.dart';
import 'package:get_meat_apps/ui/base/custom_view_with_toolbar.dart';
import 'package:get_meat_apps/ui/pages/sign_in/cubit/sign_in_cubit.dart';
import 'package:get_meat_apps/ui/pages/sign_up/cubit/sign_up_cubit.dart';
import 'package:get_meat_apps/ui/pages/upload_photo/cubit/upload_photo_cubit.dart';
import 'package:get_meat_apps/ui/widget/widget.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

part 'splash/splash_screen.dart';
part 'get_started/get_started_screen.dart';
part 'sign_in/sign_in_screen.dart';
part 'sign_up/sign_up_screen.dart';
part 'upload_photo/upload_photo_screen.dart';

part 'sign_in/component/email_field.dart';
part 'sign_in/component/password_field.dart';
part 'sign_in/component/sign_in_button.dart';

part 'sign_up/component/customer_name_field.dart';
part 'sign_up/component/email_field.dart';
part 'sign_up/component/phone_number_field.dart';
part 'sign_up/component/whatsapp_number_field.dart';
part 'sign_up/component/password_customer_field.dart';
part 'sign_up/component/address_field.dart';
part 'sign_up/component/province_dropdown_field.dart';
part 'sign_up/component/cities_dropdown_field.dart';
part 'sign_up/component/sign_up_button.dart';

part 'upload_photo/component/profile_photo_component.dart';
part 'upload_photo/component/upload_photo_bottomsheet.dart';
part 'upload_photo/component/upload_photo_button.dart';
