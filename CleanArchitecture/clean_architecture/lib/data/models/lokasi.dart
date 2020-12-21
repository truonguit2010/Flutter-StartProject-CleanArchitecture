import 'package:json_annotation/json_annotation.dart';
part 'lokasi.g.dart';

@JsonSerializable()
class LokasiListResponse {
  List<Lokasi> listLokasi;

  LokasiListResponse(this.listLokasi);
}

@JsonSerializable(nullable: false)
class Lokasi {
  String nama;
  double latitude;
  double longitude;
  String alamat;
  String foto;
  String telepon;

  Lokasi();

  factory Lokasi.fromJson(Map<String, dynamic> json) => _$LokasiFromJson(json);
  Map<String, dynamic> toJson() => _$LokasiToJson(this);
}