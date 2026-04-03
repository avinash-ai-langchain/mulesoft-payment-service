%dw 2.0
output application/json
---
{
  transactionId: payload.transaction.id,
  customerId: payload.customer.id,
  amount: payload.payment.amount,
  currency: payload.payment.currency,
  // Fix: safely handle a null/missing address object and default fields to null
  // to prevent NullPointerException while preserving the existing response shape.
  billingAddress: {
    street: payload.customer.address?.street default null,
    city: payload.customer.address?.city default null,
    zipCode: payload.customer.address?.zipCode default null
  },
  // Fix: explicitly cast to String for a stable JSON representation
  timestamp: (now() as String)
}