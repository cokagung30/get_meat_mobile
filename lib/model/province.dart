part of 'models.dart';

class Province extends Equatable {
  const Province({
    required this.provinceId,
    required this.name,
  });

  final int provinceId;
  final String name;

  factory Province.fromJson(Map<String, dynamic> data) => Province(
        provinceId: data['province_id'],
        name: data['name'],
      );

  @override
  List<Object?> get props => [provinceId, name];
}
