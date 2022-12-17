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
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 200,
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
      ),
      child:
        Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(trainName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(trainNumber,
                  style: const TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                  ),),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 5),
                child: Row(
                  children: [
                    const Icon(Icons.stairs,
                    color: Colors.blueAccent,),
                    const SizedBox(width: 5),
                    const Text("Platform Number: ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),),
                    Text(platformNumber,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 5),
              child: Row(
                children: [
                  const Icon(Icons.access_time_filled_rounded,
                  color: Colors.blueAccent,),
                  const SizedBox(width: 5),
                  Text(startTime,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16
                  ),),
                  const SizedBox(width: 5),
                  const Text("-", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),),
                  const SizedBox(width: 5),
                  Text(endTime,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16
                  ),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 15),
              child: Row(
                children: [
                  const Icon(Icons.map_rounded,
                  color: Colors.blueAccent,),
                  const SizedBox(width: 5),
                  const Text("Distance: ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),),
                  Text(distance,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16
                  ),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 15),
              child: Row(
                children: [
                  const Icon(Icons.location_on,
                  color: Colors.blueAccent,),
                  const SizedBox(width: 5),
                  const Text("Includes Stop: ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),),
                  Text(boolStop,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),)
                ],
              ),
            )
          ],

      )
    );
  }
}
