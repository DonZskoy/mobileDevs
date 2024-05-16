abstract interface class iCoffe {
  int get coffeBeans;
  int get milk;
  int get water;
  int get cash;

  set coffeBeans(int value) => coffeBeans = value;
  set milk(int value) => milk = value;
  set water(int value) => water = value;
  set cash(int value) => cash = value;

}

class Espresso implements iCoffe {
  Espresso({
    required int coffeBeans,
    required int milk,
    required int water,
    required int cash});

  int coffeBeans = 0;
  int milk = 0;
  int water = 0;
  int cash = 0;

}