// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bpi_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BPIResponse _$BPIResponseFromJson(Map<String, dynamic> json) => BPIResponse(
      usd: CurrencyBPIResponse.fromJson(json['USD'] as Map<String, dynamic>),
      gbp: CurrencyBPIResponse.fromJson(json['GBP'] as Map<String, dynamic>),
      eur: CurrencyBPIResponse.fromJson(json['EUR'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BPIResponseToJson(BPIResponse instance) =>
    <String, dynamic>{
      'USD': instance.usd,
      'GBP': instance.gbp,
      'EUR': instance.eur,
    };
