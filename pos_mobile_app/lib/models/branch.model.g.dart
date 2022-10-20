// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Branch _$BranchFromJson(Map<String, dynamic> json) => Branch(
      id: json['id'] as String?,
      name: json['name'] as String?,
      uid: json['uid'] as String?,
      location: json['location'] as String?,
      numberOfMerchants: json['numberOfMerchants'] as int?,
      kioskName: json['kioskName'] as String?,
      accountIds: (json['accountIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      adminId: json['adminId'] as String?,
    );

Map<String, dynamic> _$BranchToJson(Branch instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'location': instance.location,
      'numberOfMerchants': instance.numberOfMerchants,
      'kioskName': instance.kioskName,
      'accountIds': instance.accountIds,
      'adminId': instance.adminId,
    };
