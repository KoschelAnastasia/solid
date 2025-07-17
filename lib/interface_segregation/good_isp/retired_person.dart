import 'good_interface.dart';

class RetiredPerson extends Person {
  @override
  void rest() {
    print('Enjoying retirement...');
  }

  @override
  void eat() {
    print('Eating a healthy meal...');
  }

  @override
  void exercise() {
    print('Taking a walk in the park...');
  }

  @override
  void read() {
    print('Reading a book...');
  }

  @override
  void sleep() {
    print('Sleeping peacefully... dreaming about Titanic... and Jack Dawson...');
  }

  @override
  void socialize() {
    print('Meeting friends for tea...');
  }

  @override
  void travel() {
    print('Traveling to a new country...');
  }
}
