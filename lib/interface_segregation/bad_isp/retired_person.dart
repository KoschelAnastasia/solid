import 'bad_interface.dart';

class RetiredPerson implements Person {
  @override
  void work() {
    // Этот метод не должен вызываться для пенсионера,
  }

  @override
  void rest() {
    print('Retired Person: Enjoying retirement...');
  }

  @override
  void eat() {
    print('Retired Person: Eating a healthy meal...');
  }

  @override
  void exercise() {
    print('Retired Person: Taking a walk in the park...');
  }

  @override
  void read() {
    print('Retired Person: Reading a book...');
  }

  @override
  void sleep() {
    print('Retired Person: Sleeping peacefully... dreaming about Titanic... and Jack Dawson...');
  }

  @override
  void socialize() {
    print('Retired Person: Meeting friends for tea...');
  }

  @override
  void travel() {
    print('Retired Person: Traveling to a new country...');
  }
}
