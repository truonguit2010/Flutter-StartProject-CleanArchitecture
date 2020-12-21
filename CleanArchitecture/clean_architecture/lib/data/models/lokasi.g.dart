// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lokasi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LokasiListResponse _$LokasiListResponseFromJson(Map<String, dynamic> json) {
  return LokasiListResponse(
    (json['listLokasi'] as List)
        ?.map((e) =>
            e == null ? null : Lokasi.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LokasiListResponseToJson(LokasiListResponse instance) =>
    <String, dynamic>{
      'listLokasi': instance.listLokasi,
    };

Lokasi _$LokasiFromJson(Map<String, dynamic> json) {
  return Lokasi()
    ..nama = json['nama'] as String
    ..latitude = (json['latitude'] as num).toDouble()
    ..longitude = (json['longitude'] as num).toDouble()
    ..alamat = json['alamat'] as String
    ..foto = json['foto'] as String
    ..telepon = json['telepon'] as String;
}

Map<String, dynamic> _$LokasiToJson(Lokasi instance) => <String, dynamic>{
      'nama': instance.nama,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'alamat': instance.alamat,
      'foto': instance.foto,
      'telepon': instance.telepon,
    };
