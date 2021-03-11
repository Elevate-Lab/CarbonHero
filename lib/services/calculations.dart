double poundToKg = 0.45392;

// ------ AVERAGE -------
double vehicle = 10484 * poundToKg;
double waste = 692 * poundToKg;
double electricity = 5455 * poundToKg;
double lpg = 2243 * poundToKg;

// -------  WASTE --------
int wasteCalc(int waste, int paper, int plastic, int glass, int metal) {
  int ans = waste - paper - plastic - glass - metal;
  return ans;
}

// ------- TRANSPORTATION --------
int journeyCalc(int distance, int mileage) {
  double ans = (5.178 * distance * poundToKg) / mileage;
  return ans.toInt();
}

// ------- ELECTRICITY ------
int electricityCalc(int consumption, int size) {
  double ans = (consumption * 12 * 1.2385 * poundToKg) / size;
  return ans.toInt();
}

// -------- HOME APPLIANCES ------
int homeCalc(int television, int ac, int geyser, int refrigerator) {
  int ans = 490 * ac + 189 * television + 1260 * geyser + 189 * refrigerator;
  return ans.toInt();
}

// -------- LPG(PROPANE) ---------
int lpgCalc(int cylinders) {
  double ans = (12 * 12.43 * cylinders * 15);
  return ans.toInt();
}

double compareFromLastMonth(double now, double prev)
{
  if(prev == 0)
  {
    return 0.0;
  }
  double ans = (now-prev)/prev;
  return ans;
}

double compareFromYesterday(double now, double prev)
{
  if(prev == 0)
  {
    return 0.0;
  }
  double ans = (now-prev)/prev;
  return ans;
}