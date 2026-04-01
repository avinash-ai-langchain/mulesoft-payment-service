// Add null check to prevent exception
if (payment == null) {
    logger.error("Payment object is null");
    throw new IllegalArgumentException("Payment cannot be null");
}

// Add validation before processing
if (!payment.isValid()) {
    logger.warn("Invalid payment detected: {}", payment.getId());
    return PaymentResponse.failed("Invalid payment data");
}

// Proceed with payment processing
return processValidPayment(payment);