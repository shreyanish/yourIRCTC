class TrainBetweenStations {
  TrainBetweenStations({
    required this.trainNumber,
    required this.trainName,
    required this.departTime,
    required this.arrivalTime,
    required this.distance,
  });

  String trainNumber;
  String trainName;
  String departTime;
  String arrivalTime;
  String distance;

  factory TrainBetweenStations.fromJson(Map<String, dynamic> json) =>
      TrainBetweenStations(
        trainNumber: json["data"]["train_number"],
        trainName: json["data"]["train_name"],
        departTime: json["data"]["depart_time"],
        arrivalTime: json["data"]["arrival_time"],
        distance: json["data"]["distance"],
      );

  Map<String, dynamic> toJson() =>
      {
        "train_number": trainNumber,
        "train_name": trainName,
        "depart_time": departTime,
        "arrival_time": arrivalTime,
        "distance": distance,
      };
}