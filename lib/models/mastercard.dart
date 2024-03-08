class MasterCard {
  late int id;
  late String numberCard;
  late String expiredDate;
  late String cvv;
  late String fullname;

  MasterCard({
    required this.id,
    required this.numberCard,
    required this.expiredDate,
    required this.cvv,
    required this.fullname,
  });

  MasterCard.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    numberCard = json['numberCard'];
    expiredDate = json['expiredDate'];
    cvv = json['cvv'];
    fullname = json['fullname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['numberCard'] = numberCard;
    data['expiredDate'] = expiredDate;
    data['cvv'] = cvv;
    data['fullname'] = fullname;
    return data;
  }

  @override
  String toString() {
    return '{"id":$id,"numberCard":$numberCard,"expiredDate":$expiredDate,"cvv":$cvv,"fullname":$fullname,"fullname":$fullname}';
  }
}
