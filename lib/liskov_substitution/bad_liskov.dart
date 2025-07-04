abstract class Bird {
  void fly();
}

class Duck implements Bird {
  @override
  void fly() => print('Duck flying!');
}

class Penguin implements Bird {
  @override
  void fly() => throw UnsupportedError("Penguins can't fly!");
}
