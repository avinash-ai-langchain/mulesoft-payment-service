%dw 2.0
output application/json
---
{
  summary: {
    totalTransactions: sizeOf(payload.transactions),
    // ❌ BUG: Assumes transactions array always has items
    firstTransaction: payload.transactions[0].id,
    lastTransaction: payload.transactions[-1].id,
    totalAmount: sum(payload.transactions map $.amount)
  }
}