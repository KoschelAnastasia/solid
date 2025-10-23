// Идея простая: не всем птицам нужен fly(). Поэтому мы не заставляем весь базовый тип Bird «обещать» полёт.
// Вместо этого разделяем контракт: есть общий Bird (общее поведение) и есть FlyingBird — «летающие птицы».
// Так мы гарантируем: любой FlyingBird действительно умеет fly(), а обычный Bird — не обязан.
//
// Что это даёт:
// - Мы сохраняем контракт: клиенты, которым нужен полёт, работают с FlyingBird и не получают сюрпризов.
// - Нелетающие птицы (например, Penguin) больше не реализуют fly() и не бросают исключения.
// - LSP соблюдён: подтипы не ослабляют постусловия и не нарушают инварианты базового типа.
// - Бонусом это соответствует ISP: клиенты зависят только от нужного интерфейса.
//
// В итоге код предсказуем: Duck — FlyingBird и летает, Penguin — просто Bird и не пытается «летать через исключение».

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
