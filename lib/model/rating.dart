part of 'models.dart';

class ResRating extends Equatable {
  const ResRating({
    required this.message,
    required this.rating,
  });

  final String message;
  final Rating rating;

  ResRating.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        rating = Rating.fromJson(json['ratings']);

  @override
  List<Object?> get props => [];
}

class Rating extends Equatable {
  const Rating({
    required this.id,
    required this.comment,
    required this.rating,
    required this.userId,
  });

  final int id;
  final int rating;
  final String comment;
  final int userId;

  Rating.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        rating = json['rating'],
        comment = json['comments'],
        userId = json['user_id'];

  @override
  List<Object?> get props => [];
}
