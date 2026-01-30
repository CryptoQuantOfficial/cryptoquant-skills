---
name: crypto-signal
description: |
  Generate buy/sell/hold trading signals with confidence scores (0-100) using weighted on-chain analysis.
  Use when user asks for "trading signal", "should I buy", "buy or sell", "market signal", "investment recommendation",
  "매수 신호", "매도 신호", "투자 신호", "사야 하나", or wants actionable trading guidance.
  Weighs MVRV (30%), SOPR (25%), Netflow (25%), Funding Rate (20%) for data-driven recommendation.
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

# /crypto-signal Command

Generate Buy/Sell/Hold trading signal based on weighted on-chain metrics.

## Usage

```
/crypto-signal          # Bitcoin (default)
/crypto-signal btc      # Bitcoin
/crypto-signal eth      # Ethereum
```

## Workflow

```
1. Ensure session initialized

2. Query metrics in PARALLEL:
   - MVRV (30%): /v1/{asset}/market-indicator/mvrv
     params: { window: "day", limit: 1 }
   - SOPR (25%): /v1/{asset}/market-indicator/sopr
     params: { window: "day", limit: 1 }
   - Netflow (25%): /v1/{asset}/exchange-flows/netflow
     params: { window: "day", limit: 1, exchange: "all_exchange" }
   - Funding (20%): /v1/{asset}/market-data/funding-rates
     params: { window: "day", limit: 1, exchange: "all_exchange" }

3. Score each metric (0-100)

4. Calculate weighted average

5. Generate verdict:
   - Score > 70: BUY
   - Score 40-70: HOLD
   - Score < 40: SELL
```

## Scoring Reference

### MVRV (30% weight)
| Value | Score |
|-------|-------|
| < 1.0 | 90 |
| 1.0 - 1.5 | 75 |
| 1.5 - 2.0 | 60 |
| 2.0 - 2.5 | 45 |
| 2.5 - 3.0 | 30 |
| > 3.0 | 15 |

### SOPR (25% weight)
| Value | Score |
|-------|-------|
| < 0.95 | 85 |
| 0.95 - 1.0 | 60 |
| 1.0 - 1.05 | 50 |
| > 1.05 | 30 |

### Netflow (25% weight)
| Value (BTC) | Score |
|-------------|-------|
| < -5,000 | 95 |
| -5K to -1K | 75 |
| -1K to +1K | 50 |
| > +5,000 | 15 |

### Funding Rate (20% weight)
| Value | Score |
|-------|-------|
| < -0.03% | 80 |
| -0.03% to +0.01% | 55 |
| +0.01% to +0.03% | 40 |
| > +0.05% | 15 |

## Output Format

```
## BTC Trading Signal

Signal: BUY (72% confidence)

| Metric | Value | Score | Weight |
|--------|-------|-------|--------|
| MVRV | 1.45 | 75 | 30% |
| SOPR | 0.98 | 60 | 25% |
| Netflow | -3,200 | 75 | 25% |
| Funding | 0.01% | 50 | 20% |

Bullish: MVRV fair value, accumulation via outflows
Neutral: Funding balanced
Bearish: None

This is not financial advice. DYOR.
```

## Signal Thresholds

| Score | Signal |
|-------|--------|
| 80-100 | STRONG BUY |
| 70-79 | BUY |
| 55-69 | HOLD |
| 40-54 | CAUTION |
| < 40 | SELL |

## Plan Requirements

This command requires **Professional or Premium** plan for full on-chain metrics.

**Basic / Advanced Plans**:
- Only `price-ohlcv` endpoint is accessible (7-day price data)
- On-chain metrics (MVRV, SOPR, Netflow, Funding) are not available
- For timely on-chain analysis and market insights, visit: https://cryptoquant.com/quicktake

## Reference

- Main skill: [/crypto](../crypto/SKILL.md)
- Interpretation guide: [INTERPRETATION.md](../crypto/INTERPRETATION.md)
