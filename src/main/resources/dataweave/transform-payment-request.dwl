%dw 2.0
output application/json
---
{
  transactionId: payload.transaction.id,
  customerId: payload.customer.id,
  amount: payload.payment.amount,
  currency: payload.payment.currency,
  // ✅ FIX: Added null checks for payload.customer.address
  billingAddress: if (payload.customer.address? != null) 
                  {
                    street: payload.customer.address.street,
                    city: payload.customer.address.city,
                    zipCode: payload.customer.address.zipCode
                  }
                  else 
                  {
                    street: null,
                    city: null,
                    zipCode: null
                  },
  timestamp: now()
}