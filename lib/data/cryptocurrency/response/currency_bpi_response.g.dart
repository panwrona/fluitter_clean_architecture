// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_bpi_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyBPIResponse _$CurrencyBPIResponseFromJson(Map<String, dynamic> json) =>
    CurrencyBPIResponse(
      code: json['code'] as String,
      rateFloat: (json['rate_float'] as num).toDouble(),
    );

Map<String, dynamic> _$CurrencyBPIResponseToJson(
        CurrencyBPIResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'rate_float': instance.rateFloat,
    };
