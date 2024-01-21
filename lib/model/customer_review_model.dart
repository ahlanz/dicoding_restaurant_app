class CustomerReviewModel {
  String? name;
  String? review;
  String? date;

  CustomerReviewModel({
    required this.name,
    required this.review,
    required this.date,
  });

  @override
  String toString() {
    return 'CustomerReviewModel('
        'name: $name,'
        'review:$review,'
        'date:$date)';
  }

  factory CustomerReviewModel.fromJson(Map<String, dynamic> json) {
    return CustomerReviewModel(
      name: json['name'],
      review: json['review'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'review': review,
      'date': date,
    };
  }
}
