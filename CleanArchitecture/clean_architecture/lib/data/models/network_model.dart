import 'dart:convert';

enum Status {
  LOADING,
  COMPLETED,
  ERROR
}

class NetworkModel<T> {

  T t;
  String loadingString;
  String errorString;
  Status status;

  NetworkModel.loading(this.loadingString) {
    this.status = Status.LOADING;
  }

  NetworkModel.completed(this.t) {
    this.status = Status.COMPLETED;
  }

  NetworkModel.error(this.errorString) {
    this.status = Status.ERROR;
  }


//  NetworkModel<String>.loading(String str) {
//    this.loadingString = str;
//  }

//  DKBanner.fromJson(Map<String, dynamic> json) {
//    this.id = json['id'];
//    this.img = json['img'];
//    this.action = json['action'];
//    this.actionData = json['action_data'];
//  }


}