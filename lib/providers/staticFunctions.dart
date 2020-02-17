class StaticFunctions {
  static int getAge(DateTime birthDay){
     DateTime currentDate = DateTime.now();
  int age = currentDate.year - birthDay.year;
  int month1 = currentDate.month;
  int month2 = birthDay.month;
  if (month2 > month1) {
    age--;
  } else if (month1 == month2) {
    int day1 = currentDate.day;
    int day2 = birthDay.day;
    if (day2 > day1) {
      age--;
    }
  }
  return age;
  }
}