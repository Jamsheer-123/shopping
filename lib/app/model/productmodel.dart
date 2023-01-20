class Product {
  String? pname;
  int? pid;
  num? pcost;
  int? pavailability;
  String? pdetails;
  String? pcategory;
  String? image;
  String? description;

  Product(
      {this.pname,
      this.description,
      this.image,
      required this.pid,
      this.pcost,
      this.pavailability,
      this.pdetails,
      this.pcategory});

  Product.fromJson(Map<String, dynamic> json) {
    pname = json['p_name'];
    image = json['image'];
    pid = json['p_id'];
    pcost = json['p_cost'];
    pavailability = json['p_availability'];
    pdetails = json['p_details'];
    pcategory = json['p_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['p_name'] = pname;
    data['image'] = image;
    data['p_id'] = pid;
    data['p_cost'] = pcost;
    data['p_availability'] = pavailability;
    data['p_details'] = pdetails;
    data['p_category'] = pcategory;
    return data;
  }
}
