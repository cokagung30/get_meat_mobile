part of 'models.dart';

class Cities extends Equatable {
  const Cities({
    required this.cityId,
    required this.name,
  });

  final int cityId;
  final String name;

  factory Cities.fromJson(Map<String, dynamic> data) => Cities(
        cityId: data['id'],
        name: data['name'],
      );

  @override
  List<Object?> get props => [
        cityId,
        name,
      ];
}
