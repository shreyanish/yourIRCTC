class Train{
  final String trainName;
  final String trainNumber;
  //final String platformNumber;
  final String startTime;
  final String endTime;
  final String distance;
  //final String boolStop;

  Train({required this.trainNumber, required this.trainName, required this.startTime, required this.endTime, required this.distance,});

  factory Train.fromJson(dynamic json){
    return Train(
      trainName: json['train_name'] as String,
      trainNumber: json['train_number'] as String,
      startTime: json['depart_time'] as String,
      endTime: json['arrival_time'] as String,
      distance: json['distance'] as String,
    );
  }

  static List<Train> trainFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Train.fromJson(data);
    }).toList();
  }

  }

