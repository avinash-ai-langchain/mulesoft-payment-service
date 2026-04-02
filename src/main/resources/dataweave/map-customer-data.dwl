%dw 2.0
output application/json
---
{
  customers: (payload.customers default []) map (customer, index) -> {
    id: customer.id,
    name: (customer.firstName default "") ++ " " ++ (customer.lastName default ""),
    // Safely coerce accountBalance to Number before arithmetic; default to 0 when null/missing
    balance: ((customer.accountBalance default 0) as Number) * 1.15,
    // Preserve behavior while preventing null-related failures on status
    status: upper((customer.status default "") as String)
  }
}