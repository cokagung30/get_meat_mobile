import 'package:equatable/equatable.dart';

class RatingRequest extends Equatable {
  const RatingRequest({
    required this.userId,
    required this.rating,
    required this.comment,
  });

  final int rating;
  final String comment;
  final int userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      "rating": rating,
      "comment": comment,
      "user_id": userId,
    };
    return map;
  }

  @override
  List<Object?> get props => [
        rating,
        comment,
        userId,
      ];
}
