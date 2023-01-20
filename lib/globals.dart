import 'dart:async';

var s1;
var s2;
bool cardClicked = false;
List ListTrains = [];
bool apicall = false;
bool apicall2 = true;
var trainBetweenStations;
var trainSchedule;


Future waitWhile(bool test(), [Duration pollInterval = Duration.zero]) {
  var completer = Completer();
  check() {
    if (test()) {
      completer.complete();
    } else {
       Timer(pollInterval, check);
    }
  }
  check();
  return completer.future;
}

trainbwStations () async {
  await waitWhile(() => apicall);
  if (apicall) {
    return trainBetweenStations;
  }
}

trainDetails () async {
  await waitWhile(() => apicall2);
  if (apicall2) {
    return trainSchedule;
  }
}
