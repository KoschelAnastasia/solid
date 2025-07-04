import 'programmer.dart';
import 'retired_person.dart';

abstract class Person {
  void work();
  void rest();
  void eat();
  void sleep();
  void exercise();
  void socialize();
  void read();
  void travel();
}

void main() {
  // Программист работает, как и положено
  Person programmer = Programmer();
  programmer.work();
  programmer.socialize();
  programmer.exercise();
  programmer.rest();
  programmer.sleep();

  print('\n---------------------------------------------------------------------------\n');

  // Пенсионер пытается работать, но реализации метода work нет
  // Но и ошибки не возникает

  Person retired = RetiredPerson();
  retired.work();

  retired.socialize();
  retired.exercise();
  retired.rest();
  retired.sleep();
}
