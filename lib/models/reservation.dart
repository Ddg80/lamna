class Reservation {
  late int id;
  late String startHour;
  late String cityStart;
  late String startDate;
  late String finishHour;
  late String cityFinish;
  late String returnDate;
  late double pricePerPerson;
  late String timeTravel;
  late int percent;
  late String category;
  late int numberPassengers;
  late double total;
  late double commission;

  Reservation({
    required this.id,
    required this.startHour,
    required this.cityStart,
    required this.startDate,
    required this.finishHour,
    required this.cityFinish,
    required this.returnDate,
    required this.pricePerPerson,
    required this.timeTravel,
    required this.percent,
    required this.category,
    required this.numberPassengers,
    required this.total,
    required this.commission,
  });

  @override
  String toString() {
    return '{"id":$id,"startHour":$startHour,"cityStart":$cityStart,"startDate": $startDate,"finishHour":$finishHour,"cityFinish":$cityFinish,"returnDate":$returnDate, "pricePerPerson":$pricePerPerson,"timeTravel": $timeTravel,"percent":$percent,"category":$category, "numberPassengers": $numberPassengers, "total":$total, "commission":$commission}';
  }
}
