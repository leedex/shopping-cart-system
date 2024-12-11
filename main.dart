void main() {
  // List of item prices in the cart
  List<double> cartItems = [15.99, 5.49, 25.75, 7.99, 12.89];
  
  // Apply discount (e.g., 10% off)
  var discountFunction = (double price) => price * 0.90;  // 10% discount
  List<double> discountedItems = applyDiscount(cartItems, discountFunction);

  // Calculate the total price with tax (e.g., 8% tax)
  double total = calculateTotal(discountedItems, tax: 0.08);

  // Calculate special factorial discount based on the number of items in the cart
  double finalPrice = calculateFactorialDiscount(total, discountedItems.length);

  print("Final price after discount and tax: \$${finalPrice.toStringAsFixed(2)}");
}

// Standard Function: Calculate the total price with optional tax
double calculateTotal(List<double> itemPrices, {double tax = 0.0}) {
  double sum = 0;
  for (var price in itemPrices) {
    sum += price;
  }
  return sum * (1 + tax);  // Include tax if provided
}

// Anonymous Function: Filter out items below a certain threshold
List<double> filterItems(List<double> items, double threshold) {
  return items.where((item) => item >= threshold).toList();
}

// Higher-Order Function: Apply a discount function to a list of prices
List<double> applyDiscount(List<double> prices, double Function(double) discountFunction) {
  List<double> discountedPrices = prices.map(discountFunction).toList();
  return discountedPrices;
}

// Recursive Function: Apply a factorial discount based on the number of items
double calculateFactorialDiscount(double totalPrice, int numItems) {
  if (numItems <= 1) {
    return totalPrice;
  }
  int factorial = factorial(numItems);
  return totalPrice * (1 - factorial / 100);  // Apply factorial discount as a percentage
}

// Helper function to calculate factorial
int factorial(int num) {
  if (num == 0 || num == 1) {
    return 1;
  } else {
    return num * factorial(num - 1);
  }
}
