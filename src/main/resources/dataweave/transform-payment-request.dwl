%dw 2.0
output application/json
---
{
  transactionId: payload.transaction.id,
  customerId: payload.customer.id,
  amount: payload.payment.amount,
  currency: payload.payment.currency,
  // Fix: safely handle a null/missing customer.address object to avoid NullPointerException.
  // Using safe navigation returns null for nested fields when address is absent, preserving backward compatibility.
  billingAddress: {
    street: payload.customer.address?.street,
    city: payload.customer.address?.city,
    zipCode: payload.customer.address?.zipCode
  },
  // Fix: explicitly cast timestamp to String for consistent JSON serialization downstream.
  timestamp: (now() as String)
}