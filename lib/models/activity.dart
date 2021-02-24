import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Activity {
  String nameOfActivity;
  String categoryOfActivity;
  Map<String, double> inputParameters;
  double approximationFactor;
  double averageConsumptionYearly;
  double lastDayEmissionCount;
  double lastDayPercentageChange;
  DateTime lastCheckedAt;
  Map<String, dynamic> previouslyRecordedEmission;

  Activity(
      {@required this.nameOfActivity,
      @required this.categoryOfActivity,
      @required this.inputParameters,
      @required this.approximationFactor,
      @required this.averageConsumptionYearly,
      @required this.lastDayPercentageChange,
      @required this.lastCheckedAt,
      @required this.previouslyRecordedEmission});
}
