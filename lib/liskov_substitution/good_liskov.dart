// Для того чтобы исправить нарушение принципа Лисков, мы можем создать иерархию классов, которая будет разделять птиц на
// летающих и нелетающих. Таким образом, мы можем гарантировать, что все летающие птицы будут иметь метод fly, а нелетающие
// птицы не будут.
// При этом мы не нарушаем кон

abstract class Bird {
  void eat() => print('Bird is eating');
}

abstract class FlyingBird extends Bird {
  void fly();
  @override
  void eat() => print('Eat like a duck');
}

class Duck extends FlyingBird {
  @override
  void fly() => print('Duck is flying');
}

class Penguin extends Bird {
  void swim() => print('Penguin is swimming');
  @override
  void eat() => print('Eat like a penguin');
}
