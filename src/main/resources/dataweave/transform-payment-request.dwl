%dw 2.0
output application/json
---
{
  transactionId: payload.transaction.id,
  customerId: payload.customer.id,
  amount: payload.payment.amount as Number?,
  currency: payload.payment.currency as String?,
  // Fix: safely handle cases where customer.address is null/missing to avoid NPEs
  // Maintains backward compatibility by preserving billingAddress in the output
  billingAddress: {
    street: payload.customer.address.street default null,
    city: payload.customer.address.city default null,
    zipCode: payload.customer.address.zipCode default null
  },
  timestamp: now()
}