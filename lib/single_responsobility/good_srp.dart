// Для того чтобы код было проще поддерживать мы можем следовать принципу SRP, а именно сделать так, чтобы классы/функции
// имели только одну ответственности или роль. Таким образом разделяя ответсвенности мы добиваемся того, что у нас как у
// программистов, есть по сути только одна причина модифицировать код и те изменения, которые мы вносим имееют легко
// прогнозированные последствия для остального кода
//
// К примеру:
// Мы взяли пример плохого кода из lib\single_responsobility\bad_srp.dart и переписали его следуюя принципу SRP. И теперь
// класс TravelBooking имеет конкретную ответсвеннсть он отвечает только за информацию о путешествии, которое человек хотел
// бы оплатить с релевантной информацией в нашем случае: Направление и цена
//
// Также мы вынесли

class TravelBooking {
  String destination;
  double price;

  TravelBooking(this.destination, this.price);
}

abstract class PaymentMethod {
  void pay(double amount, {String? destination});
}

class CreditCardPayment implements PaymentMethod {
  @override
  void pay(double amount, {String? destination}) {
    print('Paying with credit card for booking to $destination with amount: \$$amount');
  }
}

class PayPalPayment implements PaymentMethod {
  @override
  void pay(double amount, {String? destination}) {
    print('Paying with PayPal for booking to $destination with amount: \$$amount');
  }
}

void main() {
  var booking = TravelBooking("Paris", 1000.0);

  PaymentMethod paymentMethod = CreditCardPayment();
  paymentMethod.pay(booking.price);
}
