part of 'models.dart';

class CostPayment extends Equatable {
  const CostPayment(
      {required this.value, required this.estimation, required this.note});

  final int value;
  final String estimation;
  final String note;

  CostPayment.fromJson(Map<String, dynamic> json)
      : value = json['value'],
        estimation = json['etd'],
        note = json['note'];

  @override
  List<Object?> get props => [value, estimation, note];
}
