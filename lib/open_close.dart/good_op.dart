// Что мы сделали, чтобы избежать нарушения принципа открытости/закрытости?
// Если внимательно посмотреть на код, то можно увидеть, что мы больше не привязываемся к конкретным клиентам. Для улучшения
// кодовой базы мы прибегаем к паттерну дизайна Stratagy:
//
// 1. Мы создаем абстрактный класс DiscountStrategy, который определяет метол calculate.
// 2. Затем мы создаем конкретные классы для каждого типа клиента, которые реализуют этот интерфейс, каждый из них реализует
// метод calculate по своему.
// 3. Затем мы содаем класс DiscountCalculator, который ничего не знает о конкретной имплементации конкретной стратегии,
// его главная задача - принимать стратегию и использовать ее для расчета скидки.
//
// Таким образом мы получаем понятную, расширяемую структуру, которая позволяет нам легко добавлять новые стратении скидок
// не боясь нарушить существующий код.
abstract class DiscountStrategy {
  double calculate(double amount);
}

class RegularDiscount implements DiscountStrategy {
  @override
  double calculate(double amount) => amount * 0.05;
}

class PremiumDiscount implements DiscountStrategy {
  @override
  double calculate(double amount) => amount * 0.10;
}

class VipDiscount implements DiscountStrategy {
  @override
  double calculate(double amount) => amount * 0.20;
}

class DiscountCalculator {
  final DiscountStrategy strategy;

  DiscountCalculator(this.strategy);

  double applyDiscount(double amount) {
    return strategy.calculate(amount);
  }
}

void main() {
  var vip = DiscountCalculator(VipDiscount());
  print(vip.applyDiscount(200));

  var regular = DiscountCalculator(RegularDiscount());
  print(regular.applyDiscount(200));
}
