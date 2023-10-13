// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cryptocurrency_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptocurrencyResponse _$CryptocurrencyResponseFromJson(
        Map<String, dynamic> json) =>
    CryptocurrencyResponse(
      bpi: BPIResponse.fromJson(json['bpi'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CryptocurrencyResponseToJson(
        CryptocurrencyResponse instance) =>
    <String, dynamic>{
      'bpi': instance.bpi,
    };
