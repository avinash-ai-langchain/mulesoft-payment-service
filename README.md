# MuleSoft Payment Service

Sample MuleSoft application with **intentional bugs** for AI-powered fix demo.

## ⚠️ Intentional Bugs

This repository contains intentional bugs for demonstration purposes:

### Java/Mule Errors
- NullPointerException handling
- Array index out of bounds
- Database connection issues
- Concurrent modification

### DataWeave Errors
- Null pointer in transformations
- Type mismatches
- Array access without bounds checking
- Missing default values

### YAML Configuration Errors
- Invalid indentation
- Missing required properties
- Type mismatches (string vs int)
- Missing environment variables

## Purpose

This repository is used by an AI-powered monitoring system that:
1. Detects errors from production logs
2. Fetches the relevant source code
3. Generates fixes automatically
4. Creates pull requests with inline comments

## Structure

```
src/
├── main/
│   ├── mule/              # MuleSoft flow definitions
│   └── resources/
│       ├── dataweave/     # DataWeave transformations
│       └── properties/    # YAML configurations
└── test/
    └── java/              # Unit tests
```

## Note

**Do not use this code in production!** It contains intentional bugs for demo purposes.
