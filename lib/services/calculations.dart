import 'package:flutter/material.dart';

double poundToKg = 0.45392;

// ------ AVERAGE -------
double vehicle = 10484*poundToKg/52;
double waste = 692*poundToKg/12;
double electricity = 5455*poundToKg/12;
double lpg = 2243*poundToKg/12;
var tele = 189*4;

// -------  WASTE --------
double wasteCalc(var waste, var paper, var plastic, var glass, var metal) {
  double ans = waste - paper - plastic - glass - metal;
  if(ans < 0) {
    return 0;
  }
  return ans;
}

// ------- TRANSPORTATION --------
double journeyCalc(var distance, var mileage) {
  double ans = (5.178*distance*poundToKg)/mileage;
  return ans;
}

// ------- ELECTRICITY ------
double electricityCalc(double consumption, int size) {
  double ans = (consumption*1.2385*poundToKg)/size;
  return ans;
}

// -------- HOME APPLIANCES ------
double homeCalc(var television, var ac, var geyser, var refrigerator) {
  double ans = 490 * ac + 189 * television + 1260 * geyser + 189 * refrigerator;
  return ans;
}

// -------- LPG(PROPANE) ---------
double lpgCalc(var cylinders, int size) {
  double ans = (12.43*cylinders*15)/size;
  return ans;
}

double compareFromLastMonth(double now, double prev) {
  if (prev == 0) {
    return 0.0;
  }
  double ans = (now - prev) / prev;
  print(ans);
  return ans * 100;
}

double compareFromYesterday(double now, double prev) {
  if (prev == 0) {
    return 0.0;
  }
  double ans = (now-prev)/prev;
  return ans*100;
}

int points(double emission, int ind) {
  double ans;
  if(ind == 1) {
    ans = (vehicle-emission)*100/vehicle;
  }
  else if(ind == 2) {
    ans = (waste-emission)*100/waste;
  }
  else if(ind == 3) {
    ans = (electricity-emission)*100/electricity;
  }
  else if(ind == 4) {
    ans = (lpg-emission)*100/lpg;
  }
  else if(ind == 5) {
    ans = (tele-emission)*100/tele;
  }
  else {

  }
  return (ans.toInt() + 10);
}