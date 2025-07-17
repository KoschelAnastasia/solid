import 'bad_interface.dart';

class Programmer implements Person {
  @override
  void work() {
    print('Programmer working: Writing code. Drinking coffee.');
  }

  @override
  void rest() {
    print('Programmer take a break: Drinking coffee.');
  }

  @override
  void eat() {
    print('Programmer eat: Eating a pizza while coding...');
  }

  @override
  void exercise() {
    print('Programmer exercise: Standing up to take a coffee.');
  }

  @override
  void read() {
    print('Programmer read: Reading documentation.');
  }

  @override
  void sleep() {
    print(
      'Programmer sleep: Sleeping after a long day of coding... dreaming of algorithms... having nightmares about bugs...',
    );
  }

  @override
  void socialize() {
    print('Programmer sozialize: Make a pull request.');
  }

  @override
  void travel() {
    print('Programmer: Traveling to a tech conference.');
  }
}
