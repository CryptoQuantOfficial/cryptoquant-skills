---
name: session-start
trigger: skill_activation
description: Initialize CryptoQuant session when skill is first activated
---

# Session Start Hook

When the CryptoQuant skill is activated for the first time in a conversation:

## Automatic Actions

1. **Check if already initialized**
   ```
   Call: mcp__cryptoquant__get_permissions()
   If authenticated: Skip initialization
   If not authenticated: Proceed to step 2
   ```

2. **Initialize session**
   ```
   Call: mcp__cryptoquant__initialize()
   - Uses CRYPTOQUANT_API_KEY from environment
   - Returns plan and permissions
   ```

3. **Report to user**
   ```
   Show brief connection status:
   "✓ CryptoQuant connected | Plan: [plan] | [X] endpoints available"
   ```

## If No API Key

Prompt the user:
```
"CryptoQuant API key not found.

Get your API key at: https://cryptoquant.com/settings/api

Then either:
1. Set environment variable: export CRYPTOQUANT_API_KEY=your_key
2. Or provide directly: /crypto your_api_key"
```

## Context Caching

After successful initialization, the following is cached:
- User plan (free/professional/enterprise)
- Available metrics list
- Available charts list
- Rate limit information
- Feature flags

This cache remains valid for the session duration.
