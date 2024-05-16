class ShoeResponses {
  List<ShoeData>? data;
  int? status;

  ShoeResponses({this.data, this.status});

  ShoeResponses.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ShoeData>[];
      json['data'].forEach((v) {
        data!.add(new ShoeData.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class ShoeData {
  int? id;
  String? name;
  double? price;
  String? image;
  String? description;
  int? quantity;
  Rating? rating;

  ShoeData(
      {this.id,
        this.name,
        this.price,
        this.image,
        this.description,
        this.quantity,
        this.rating});

  ShoeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
    quantity = json['quantity'];
    rating =
    json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.image;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    return data;
  }
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}
