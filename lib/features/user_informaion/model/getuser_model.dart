import 'package:equatable/equatable.dart';

class GetUserModel extends Equatable {
  final int id;
  final String name;
  final String phone;
  final String? nationality;
  final String? idNumber;
  final String? homePhone;
  final String? workPhone;
  final String maritalStatus;
  final int visible;
  final String job;
  final int complexId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? verifiedAt;

  GetUserModel({
    required this.id,
    required this.name,
    required this.phone,
    this.nationality,
    this.idNumber,
    this.homePhone,
    this.workPhone,
    required this.maritalStatus,
    required this.visible,
    required this.job,
    required this.complexId,
    required this.createdAt,
    required this.updatedAt,
    this.verifiedAt,
  });

  factory GetUserModel.fromJson(Map<String, dynamic> json) => GetUserModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        phone: json["phone"] ?? '',
        nationality: json["nationality"] ?? null,
        idNumber: json["id_number"] ?? null,
        homePhone: json["home_phone"] ?? null,
        workPhone: json["work_phone"] ?? null,
        maritalStatus: json["marital_status"] ?? '',
        visible: json["visible"] ?? 0,
        job: json["job"] ?? '',
        complexId: json["complex_id"] ?? 0,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        verifiedAt: json["verified_at"] != null
            ? DateTime.parse(json["verified_at"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "nationality": nationality,
        "id_number": idNumber,
        "home_phone": homePhone,
        "work_phone": workPhone,
        "marital_status": maritalStatus,
        "visible": visible,
        "job": job,
        "complex_id": complexId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "verified_at": verifiedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
        nationality,
        idNumber,
        homePhone,
        workPhone,
        maritalStatus,
        visible,
        job,
        complexId,
        createdAt,
        updatedAt,
        verifiedAt,
      ];
}
