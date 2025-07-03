class TravelBooking {
  String destination;
  double price;

  TravelBooking(this.destination, this.price);
}

class BookingService {
  void book(TravelBooking booking) {
    print("Booking to ${booking.destination}");
  }
}

class NotificationService {
  void sendConfirmation(String destination) {
    print("Sending confirmation for $destination");
  }
}

abstract class PaymentMethod {
  void pay(double amount);
}

class CreditCardPayment implements PaymentMethod {
  @override
  void pay(double amount) {
    print("Charging credit card for \$$amount");
  }
}

class PayPalPayment implements PaymentMethod {
  @override
  void pay(double amount) {
    print("Charging PayPal for \$$amount");
  }
}

void main() {
  var booking = TravelBooking("Paris", 1000.0);

  var bookingService = BookingService();
  bookingService.book(booking);

  var notificationService = NotificationService();
  notificationService.sendConfirmation(booking.destination);

  PaymentMethod paymentMethod = CreditCardPayment();
  paymentMethod.pay(booking.price);
}
