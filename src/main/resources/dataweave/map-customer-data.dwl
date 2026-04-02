%dw 2.0
output application/json
---
{
  customers: (payload.customers default []) map (customer, index) -> {
    id: customer.id,
    name: (customer.firstName default "") ++ " " ++ (customer.lastName default ""),
    // Safely convert accountBalance to Number before applying arithmetic.
    // Defaults null/missing values to 0 to avoid TypeMismatchException and preserve flow execution.
    balance: ((customer.accountBalance default 0) as Number) * 1.15,
    // Protect against null status values before calling upper()
    status: upper((customer.status default "") as String)
  }
}