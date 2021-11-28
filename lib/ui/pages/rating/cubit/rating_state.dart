part of 'rating_cubit.dart';

class RatingState extends Equatable {
  const RatingState({
    this.ratingValue = 3,
    this.comments = const Tuple2(null, false),
    this.validated = false,
    this.asyncRating = const AsyncState.uninitialized(),
  });

  final int ratingValue;
  final FieldValidation comments;
  final bool validated;
  final AsyncState<Rating> asyncRating;

  RatingState copyWith(
      {int? ratingValue,
      FieldValidation? comments,
      bool? validated,
      AsyncState<Rating>? asyncRating}) {
    return RatingState(
      ratingValue: ratingValue ?? this.ratingValue,
      comments: comments ?? this.comments,
      validated: validated ?? this.validated,
      asyncRating: asyncRating ?? this.asyncRating,
    );
  }

  @override
  List<Object> get props => [
        ratingValue,
        comments,
        validated,
        asyncRating,
      ];
}
