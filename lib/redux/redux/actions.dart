abstract class Action {}

class Convert extends Action {}

class UpdateKm extends Action {
  String payload;
  UpdateKm({
    required this.payload,
  });
}

class UpdateKmCleaned extends Action {
  String payload;
  UpdateKmCleaned({
    required this.payload,
  });
}

class UpdateMiles extends Action {
  String payload;
  UpdateMiles({
    required this.payload,
  });
}
