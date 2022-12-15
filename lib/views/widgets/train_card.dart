import 'package:flutter/material.dart';

class TrainCard extends StatelessWidget {
  final String trainName;
  final String trainNumber;
  final String platformNumber;
  final String startTime;
  final String endTime;
  final String distance;
  final String boolStop;

  const TrainCard({super.key,
    required this.trainName,
    required this.trainNumber,
    required this.platformNumber,
    required this.startTime,
    required this.endTime,
    required this.distance,
    required this.boolStop
});

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: const Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),
          image: NetworkImage(trainName),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(
              children: [
                Text(trainName),
                Text(trainNumber,
                style: const TextStyle(color: Colors.grey),)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  const Text("Platform Number: "),
                  Text(platformNumber)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  const Icon(Icons.access_time),
                  const SizedBox(width: 5),
                  Text(startTime),
                  const SizedBox(width: 10),
                  Text(endTime)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  const Text("Distance: "),
                  Text(distance)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  const Text("Includes Stop: "),
                  Text(boolStop)
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
