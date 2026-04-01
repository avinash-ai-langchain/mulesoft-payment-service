%dw 2.0
output application/json
---
{
  customers: payload.customers map (customer, index) -> {
    id: customer.id,
    name: customer.firstName ++ " " ++ customer.lastName,
    // ❌ BUG: customer.accountBalance might be null or string
    balance: customer.accountBalance * 1.15,
    status: upper(customer.status)
  }
}