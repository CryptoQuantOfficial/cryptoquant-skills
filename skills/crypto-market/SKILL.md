---
name: crypto-market
description: |
  Quick 30-second market status summary using key on-chain metrics (MVRV, SOPR, Netflow, Reserve).
  Use when user asks for "market summary", "quick overview", "current market status", "market snapshot",
  "what's happening in crypto", "시장 요약", "시장 상황", or wants fast analysis without deep dive.
  Generates combined bullish/bearish signal from 4 weighted metrics.
argument-hint: [asset]
license: MIT
metadata:
  author: CryptoQuant
  version: 1.0.0
  mcp-server: cryptoquant
  category: on-chain-analytics
allowed-tools:
  - mcp__plugin_cryptoquant_cryptoquant__initialize
  - mcp__plugin_cryptoquant_cryptoquant__query_data
---

# /crypto-market Command

Quick market status summary using key on-chain metrics.

## Usage

```
/crypto-market          # Bitcoin (default)
/crypto-market btc      # Bitcoin
/crypto-market eth      # Ethereum
```

## Workflow

```
1. Ensure session initialized (call initialize() if needed)

2. Query metrics in PARALLEL:
   - MVRV: /v1/{asset}/market-indicator/mvrv (window: day, limit: 1)
   - SOPR: /v1/{asset}/market-indicator/sopr (window: day, limit: 1)
   - Netflow: /v1/{asset}/exchange-flows/netflow (window: day, limit: 1, exchange: all_exchange)
   - Reserve: /v1/{asset}/exchange-flows/reserve (window: day, limit: 7, exchange: all_exchange)

3. Interpret using thresholds below

4. Generate combined signal
```

## Interpretation Thresholds

| Metric | Bullish | Neutral | Bearish |
|--------|---------|---------|---------|
| MVRV | < 1.0 | 1.0 - 2.5 | > 3.5 |
| SOPR | < 0.95 | 0.95 - 1.05 | > 1.10 |
| Netflow | < -1,000 BTC | ±1,000 | > +5,000 BTC |
| Reserve (7d) | Declining | Stable | Rising |

## Output Format

```
## BTC Market Summary

| Metric | Value | Signal |
|--------|-------|--------|
| MVRV | 2.14 | Neutral |
| SOPR | 1.02 | Neutral |
| Netflow | -2,450 BTC | Bullish |
| Reserve | -12.5K (7d) | Bullish |

**Overall**: Slightly Bullish

Key insight: Exchange outflows suggest accumulation.
```

## Signal Logic

| Condition | Status |
|-----------|--------|
| 4/4 bullish | Bullish |
| 3/4 bullish | Slightly Bullish |
| 2/2 each way | Neutral |
| 3/4 bearish | Slightly Bearish |
| 4/4 bearish | Bearish |

## Plan Requirements

This command requires **Professional or Premium** plan for full on-chain metrics.

**Basic / Advanced Plans**:
- Only `price-ohlcv` endpoint is accessible (7-day price data)
- On-chain metrics (MVRV, SOPR, Netflow, Reserve) are not available
- For timely on-chain analysis and market insights, visit: https://cryptoquant.com/quicktake

## Reference

- Main skill: [/crypto](../crypto/SKILL.md)
- Interpretation guide: [INTERPRETATION.md](../crypto/INTERPRETATION.md)
- Deeper analysis: `/crypto-signal` or ask for "full market analysis"
