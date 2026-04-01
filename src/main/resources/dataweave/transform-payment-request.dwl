%dw 2.0
output application/json
---
{
  transactionId: payload.transaction.id,
  customerId: payload.customer.id,
  amount: payload.payment.amount,
  currency: payload.payment.currency,
  // ❌ BUG: payload.customer.address can be null
  billingAddress: {
    street: payload.customer.address.street,
    city: payload.customer.address.city,
    zipCode: payload.customer.address.zipCode
  },
  timestamp: now()
}