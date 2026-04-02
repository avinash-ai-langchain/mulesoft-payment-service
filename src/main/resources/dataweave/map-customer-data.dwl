%dw 2.0
output application/json
---
{
  customers: (payload.customers default []) map (customer, index) -> {
    id: customer.id,
    name: (customer.firstName default "") ++ " " ++ (customer.lastName default ""),
    // Fix: accountBalance may arrive as Number, String, or null.
    // Safely coerce to Number only when present; otherwise preserve backward compatibility with null.
    balance: if (customer.accountBalance == null)
               null
             else
               ((customer.accountBalance as Number) * 1.15),
    // Fix: prevent upper() from failing when status is null
    status: upper((customer.status default "") as String)
  }
}