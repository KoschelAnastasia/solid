abstract class Bird {}

abstract class FlyingBird extends Bird {
  void fly();
}

class Duck extends FlyingBird {
  @override
  void fly() => print('Duck is flying');
}

class Penguin extends Bird {
  void swim() => print('Penguin is swimming');
}
