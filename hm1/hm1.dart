void main() {

  // TASK 1
  for (int i = 1; i <= 10; i++) {
    for (int j = 1; j <= 10; j++) {
      print("$i * $j = ${i * j}");
    }
  }

  // TASK 2
  List<String> dates = [
    "05.09.2026",
    "28.02.2024",
    "28.02.2026",
    "29.02.2026",
    "28.02.2100",
    "31.12.2025"
  ];

  for (String date in dates) {
    print("$date -> ${getNextDay(date)}");
  }  

  
  // TASK 3
  String text = "flutter mobile development";
  List<String> vowels = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'];
  int count = 0;

  for (int i = 0; i < text.length; i++) {
    if (vowels.contains(text[i])) {
      count++;
    }
  }
  print('"$text" -> $count');


  // TASK 4
  List<int> numbers1 = [14, 88, 3, 42, 99, 12, 67];
  List<int> numbers2 = [234, 34, 123, 44, 949, 112, 67];

  findMinMax(numbers1);
  findMinMax(numbers2);

  // TASK 5
  checkPrime(3);
  checkPrime(6);
  checkPrime(17);
}


String getNextDay(String date) {
  List<String> parts = date.split('.');
  int day = int.parse(parts[0]);
  int month = int.parse(parts[1]);
  int year = int.parse(parts[2]);

  bool isLeap = (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);

  List<int> daysInMonth = [
    31, isLeap ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
  ];

  if (month < 1 || month > 12) return "invalid date";
  if (day < 1 || day > daysInMonth[month - 1]) return "invalid date";

  day++;
  if (day > daysInMonth[month - 1]) {
    day = 1;
    month++;
    if (month > 12) {
      month = 1;
      year++;
    }
  }

  String d = day < 10 ? "0$day" : "$day";
  String m = month < 10 ? "0$month" : "$month";

  return "$d.$m.$year";
}

void findMinMax(List<int> list) {
  int min = list[0];
  int max = list[0];

  for (int num in list) {
    if (num > max) max = num;
    if (num < min) min = num;
  }

  print("max: $max, min: $min");
}

void checkPrime(int number) {
  if (number < 2) {
    print("$number -> not prime number");
    return;
  }

  bool isPrime = true;
  for (int i = 2; i < number; i++) {
    if (number % i == 0) {
      isPrime = false;
      break;
    }
  }

  if (isPrime) {
    print("$number -> prime number");
  } else {
    print("$number -> not prime number");
  }
}