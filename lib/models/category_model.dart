class CategoryModel {
  List<Data>? _data;

  CategoryModel({List<Data>? data}) {
    if (data != null) {
      this._data = data;
    }
  }

  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(new Data.fromJson(v));
      });
    }
  }

}

class Data {
  int? _id;
  String? _link;
  int? _status;
  Null? _createdAt;
  String? _updatedAt;

  Data(
      {int? id,
        String? link,
        int? status,
        Null? createdAt,
        String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (link != null) {
      this._link = link;
    }
    if (status != null) {
      this._status = status;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get link => _link;
  set link(String? link) => _link = link;
  int? get status => _status;
  set status(int? status) => _status = status;
  Null? get createdAt => _createdAt;
  set createdAt(Null? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _link = json['link'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }


}