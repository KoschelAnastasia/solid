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
