class Report {
  String description;
  String tags;
  String imageUrl;

  Report({this.description, this.tags, this.imageUrl});

  Report.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    tags = json['tags'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['tags'] = this.tags;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
