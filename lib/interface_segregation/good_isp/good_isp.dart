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
  void speakWithColleagues() {}
  void attendMeetings() {}
}

void main() {
  final Worker programmer = Programmer();
  programmer.work();
  programmer.rest();

  final Person retired = RetiredPerson();
  retired.rest();
}
