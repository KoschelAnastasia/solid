import 'good_interface.dart';

class Programmer extends Worker {
  @override
  void work() {
    print('Writing code... Drinking coffee...');
  }

  @override
  void rest() {
    print('Taking a break... Drinking coffee...');
  }

  @override
  void speakWithColleagues() {
    print('Discussing the latest tech trends with colleagues...');
  }

  @override
  void eat() {
    print('Eating a pizza while coding...');
  }

  @override
  void exercise() {
    print('Standing up to take a coffee');
  }

  @override
  void read() {
    print('Reading documentation.');
  }

  @override
  void sleep() {
    print('Sleeping after a long day of coding... dreaming of algorithms... having nightmares about bugs...');
  }

  @override
  void socialize() {
    print('Make a pull request');
  }

  @override
  void travel() {
    print('Traveling to a tech conference');
  }
}
