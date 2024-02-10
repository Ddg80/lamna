class Travel {
  late int id;
  late String startHour;
  late String cityStart;
  late String finishHour;
  late String cityFinish;
  late double pricePerPerson;
  late String timeTravel;
  late int percent;
  late String category;

  Travel({
    required this.id,
    required this.startHour,
    required this.cityStart,
    required this.finishHour,
    required this.cityFinish,
    required this.pricePerPerson,
    required this.timeTravel,
    required this.percent,
    required this.category,
  });

  Travel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startHour = json['startHour'];
    cityStart = json['cityStart'];
    finishHour = json['finishHour'];
    cityFinish = json['cityFinish'];
    pricePerPerson = json['pricePerPerson'];
    timeTravel = json['timeTravel'];
    percent = json['percent'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['startHour'] = startHour;
    data['cityStart'] = cityStart;
    data['finishHour'] = finishHour;
    data['cityFinish'] = cityFinish;
    data['pricePerPerson'] = pricePerPerson;
    data['timeTravel'] = timeTravel;
    data['percent'] = percent;
    data['category'] = category;
    return data;
  }

  @override
  String toString() {
    return '{"id":$id,"startHour":$startHour,"cityStart":$cityStart,"finishHour":$finishHour,"cityFinish":$cityFinish,"cityFinish":$cityFinish,"pricePerPerson":$pricePerPerson,"timeTravel": $timeTravel,"percent":$percent,"category":$category}';
  }
}
