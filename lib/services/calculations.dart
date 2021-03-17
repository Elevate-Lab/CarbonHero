double poundToKg = 0.45392;

// ------ AVERAGE -------
double vehicle = 10484 * poundToKg;
double waste = 692 * poundToKg;
double electricity = 5455 * poundToKg;
double lpg = 2243 * poundToKg;

// -------  WASTE --------
double wasteCalc(var waste, var paper, var plastic, var glass, var metal) {
  double ans = waste - paper - plastic - glass - metal;
  return ans;
}

// ------- TRANSPORTATION --------
double journeyCalc(var distance, var mileage) {
  double ans = (5.178 * distance * poundToKg) / mileage;
  return ans;
}

// ------- ELECTRICITY ------
double electricityCalc(double consumption, int size) {
  double ans = (consumption * 12 * 1.2385 * poundToKg) / size;
  return ans;
}

// -------- HOME APPLIANCES ------
double homeCalc(var television, var ac, var geyser, var refrigerator) {
  double ans = 490*ac + 189*television + 1260*geyser + 189*refrigerator;
  return ans;
}

// -------- LPG(PROPANE) ---------
double lpgCalc(var cylinders) {
  double ans = (12 * 12.43 * cylinders * 15);
  return ans;
}

double compareFromLastMonth(double now, double prev)
{
  if(prev == 0)
  {
    return 0.0;
  }
  double ans = (now-prev)/prev;
  print(ans);
  return ans*100;
}

double compareFromYesterday(double now, double prev)
{
  if(prev == 0)
  {
    return 0.0;
  }
  double ans = (now-prev)/prev;
  return ans*100;
}