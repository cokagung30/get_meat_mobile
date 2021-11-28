import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:get_meat_apps/data/async_state.dart';
import 'package:get_meat_apps/data/preferences/auth_preferences.dart';
import 'package:get_meat_apps/injection.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/model/request/rating_request.dart';
import 'package:get_meat_apps/services/services.dart';
import 'package:get_meat_apps/shared/typedef.dart';
import 'package:tuple/tuple.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit() : super(const RatingState());

  void onRatingChanged(int value) {
    emit(state.copyWith(ratingValue: value));
  }

  void commentChanged(String value, bool validated) {
    emit(state.copyWith(comments: Tuple2(value, validated)));

    checkIsValidated();
  }

  void checkIsValidated() {
    final validated = state.comments.item2;

    emit(state.copyWith(validated: validated));
  }

  void sendRating() async {
    var userId = locator<AuthPreferences>().getCustomerId();
    emit(state.copyWith(asyncRating: const AsyncState.loading()));

    try {
      var response = await RatingServices.sendRating(
        RatingRequest(
          userId: int.parse(userId ?? '0'),
          rating: state.ratingValue,
          comment: state.comments.item1 ?? '',
        ),
      );

      emit(state.copyWith(
          asyncRating: AsyncState.success(response.value!.rating)));
    } catch (e) {
      print(e);
      if (e is DioError) {
        emit(state.copyWith(asyncRating: AsyncState.error(e)));
      }
    }
  }
}
