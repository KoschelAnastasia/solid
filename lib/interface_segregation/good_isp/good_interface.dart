import 'programmer.dart';
import 'retired_person.dart';

abstract class Person {
  void rest();
  void eat();
  void sleep();
  void exercise();
  void socialize();
  void read();
  void travel();
}

abstract class Worker extends Person {
  void work();
  void speakWithColleagues();
}

void main() {
  final Worker programmer = Programmer();
  programmer.work();
  programmer.eat();
  programmer.rest();
  programmer.sleep();

  print('\n---------------------------------\n');

  final Person retired = RetiredPerson();
  retired.rest();
  retired.eat();
  retired.sleep();
}
