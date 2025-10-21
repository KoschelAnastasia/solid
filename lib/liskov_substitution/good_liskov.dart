// Для того чтобы исправить нарушение принципа Лисков, мы можем создать иерархию классов, которая будет разделять птиц на
// летающих и нелетающих. Таким образом, мы можем гарантировать, что все летающие птицы будут иметь метод fly, а нелетающие
// птицы не будут.
// При этом мы не нарушаем контракт, который определен в базовом классе Bird. Класс FlyingBird стоит в иерархии между
// Bird и его подклассами, такими как Duck, который по сути выполняет контракт класса FlyingBird. А так как класс FlyingBird
// наследует от Bird летающая птица обязуется в том числе реализовать методы определенные в Bird.
// Таким образом, мы можем быть уверены, что все летающие птицы будут иметь метод fly, а нелетающие птицы, такие как
// Penguin, не будут иметь этот метод и не будут его реализовывать, не нарушая тем самым принцип подстановки Лисков.

abstract class Bird {
  void eat() => print('Bird is eating');
}

abstract class FlyingBird extends Bird {
  void fly();
}

class Duck extends FlyingBird {
  @override
  void fly() => print('Duck is flying');
  @override
  void eat() => print('Eat like a duck');
}

class Penguin extends Bird {
  void swim() => print('Penguin is swimming');
  @override
  void eat() => print('Eat like a penguin');
}
