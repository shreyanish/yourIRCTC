import 'dart:async';

var s1;
var s2;
List ListTrains = [];
bool apicall = false;
bool apicall2 = true;
var trainBetweenStations;


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

trainDetails () async {
  await waitWhile(() => apicall);
  if (apicall) {
    return trainBetweenStations;
  }
}

