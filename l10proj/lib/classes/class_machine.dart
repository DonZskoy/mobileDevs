// class Machine {
//   Machine({
//     required int coffeBeans,
//     required int milk,
//     required int water,
//     required int cash
//   }) :  _coffeBeans = coffeBeans,
//         _milk = milk,
//         _water = water,
//         _cash = cash;
//
//   int get coffeBeans => _coffeBeans;
//   int get milk => _milk;
//   int get water => _water;
//   int get cash => _cash;
//
//   set coffeBeans(int value) => _coffeBeans = value;
//   set milk(int value) => _milk = value;
//   set water(int value) => _water = value;
//   set cash(int value) => _cash = value;
//
//   int _coffeBeans;
//   int _milk;
//   int _water;
//   int _cash;
//
//   bool isAvailable() {
//     return ((coffeBeans >= 50) &&(water >= 100));
//   }
//
//   void subatractResouces() {
//     coffeBeans -= 50;
//     water -= 100;
//   }
//
//   String makingCoffee() {
//     if (isAvailable() == true) {
//       subatractResouces();
//       return 'Кофе готово';
//     }
//     else {
//       return 'Недостаточно ингридиентов';
//     }
//
//   }
//
// }