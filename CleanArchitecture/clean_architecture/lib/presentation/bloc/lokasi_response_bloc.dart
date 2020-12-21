import 'dart:async';

import 'package:clean_architecture/data/models/network_model.dart';
import 'package:clean_architecture/data/models/lokasi.dart';
import 'package:clean_architecture/data/repositories/LokasiRepository.dart';


class LokasiResponseBloc {
  StreamController _recentSearchController;
  LokasiRepository _lokasiRepository;
  StreamController _lokasiListController;

  StreamSink<NetworkModel<LokasiListResponse>> get recentSearchSink => _recentSearchController.sink;
  Stream<NetworkModel<LokasiListResponse>> get recentSearchStream => _recentSearchController.stream;

  StreamSink<NetworkModel<LokasiListResponse>> get lokasiListSink => _lokasiListController.sink;
  Stream<NetworkModel<LokasiListResponse>> get lokasiListStream => _lokasiListController.stream;

  LokasiResponseBloc() {
    _recentSearchController = StreamController<NetworkModel<LokasiListResponse>>();
    _lokasiListController = StreamController<NetworkModel<LokasiListResponse>>();
    _lokasiRepository = LokasiRepository();

    fetchLokasiList();
  }

  fetchLokasiList() async {
    lokasiListSink.add(NetworkModel.loading('Getting Locations'));
    try {
      final lokasiListResponse = await _lokasiRepository.fetchLokasi();
      lokasiListSink.add(NetworkModel.completed(lokasiListResponse));
    } catch (e) {
      lokasiListSink.add(NetworkModel.error(e.toString()));
    }
  }

  fetchRecentSearch() async {

  }

  saveRecentSearch(Lokasi search) async {

  }

  dispose() {
    _lokasiListController?.close();
  }

}