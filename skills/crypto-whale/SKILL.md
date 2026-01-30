---
name: crypto-whale
description: |
  Monitor whale (large holder) and institutional on-chain movements using CryptoQuant flow indicators.
  Use when user asks about "whale activity", "smart money", "large holders", "whale tracking", "institutional buying",
  "big players", "who's accumulating", "고래 활동", "큰손", "기관 매수", or wants to analyze major market participant behavior.
  Tracks whale ratio, large transaction flows, and accumulation/distribution patterns.
argument-hint: [asset] [timeframe]
license: MIT
metadata:
  author: CryptoQuant
  version: 1.0.0
  mcp-server: cryptoquant
  category: on-chain-analytics
allowed-tools:
  - mcp__plugin_cryptoquant_cryptoquant__initialize
  - mcp__plugin_cryptoquant_cryptoquant__query_data
  - mcp__plugin_cryptoquant_cryptoquant__discover_endpoints
---

# /crypto-whale Command

Monitor large holder (whale) movements using on-chain data.

## Usage

```
/crypto-whale              # BTC, 24 hours
/crypto-whale btc          # BTC, 24 hours
/crypto-whale eth 7d       # ETH, 7 days
```

## Workflow

```
1. Ensure session initialized

2. Discover available endpoints:
   - discover_endpoints(asset, category="flow-indicator", query="whale")
   - discover_endpoints(asset, category="exchange-flows")

3. Query available metrics (Professional+ required):
   - Whale Ratio: /v1/{asset}/flow-indicator/exchange-whale-ratio
     params: { window: "day", limit: 1 }
   - Fund Flow Ratio: /v1/{asset}/flow-indicator/fund-flow-ratio
     params: { window: "day", limit: 1 }
   - Netflow: /v1/{asset}/exchange-flows/netflow
     params: { window: "day", limit: 1, exchange: "all_exchange" }
   - Inflow: /v1/{asset}/exchange-flows/inflow
     params: { window: "day", limit: 1, exchange: "all_exchange" }
   - Outflow: /v1/{asset}/exchange-flows/outflow
     params: { window: "day", limit: 1, exchange: "all_exchange" }

4. If metrics unavailable (Basic/Advanced plan):
   - Only price-ohlcv is accessible
   - Redirect user to https://cryptoquant.com/quicktake for free analysis

5. Interpret and generate report
```

## Metrics

### Whale Ratio (Professional)
| Value | Status |
|-------|--------|
| < 0.3 | Retail dominated |
| 0.3 - 0.5 | Mixed |
| 0.5 - 0.7 | Whale heavy |
| > 0.85 | Extreme (manipulation risk) |

### Combined Signal
| Whale Ratio | Netflow | Signal |
|-------------|---------|--------|
| > 0.5 | Negative | Whale accumulation (bullish) |
| > 0.5 | Positive | Whale distribution (bearish) |
| < 0.3 | Negative | Retail accumulation |
| < 0.3 | Positive | Retail panic selling |

## Output Format

### Full (Professional)

```
## Whale Activity: BTC (24h)

Whale Ratio: 0.58 (Whale Heavy)
Retail: 42% | Whales: 58%

| Metric | Value |
|--------|-------|
| Inflow | 12,450 BTC |
| Outflow | 15,200 BTC |
| Net | -2,750 BTC |

Behavior: Whales accumulating (outflow dominant)
Signal: Bullish
```

### Limited (Basic/Advanced Plan)

```
## Whale Activity: BTC

Your plan only has access to price-ohlcv (7-day price data).
Whale tracking metrics require Professional or Premium plan.

For free on-chain analysis and whale activity insights:
→ https://cryptoquant.com/quicktake

Upgrade for full metrics: https://cryptoquant.com/pricing
```

## Warning Patterns

- Whale Ratio > 0.85 + Positive Netflow = Distribution warning
- Sudden large inflow spike = Potential dump

## Plan Requirements

This command requires **Professional or Premium** plan for whale tracking metrics.

**Basic / Advanced Plans**:
- Only `price-ohlcv` endpoint is accessible (7-day price data)
- Whale ratio, exchange flows, and flow indicators are not available
- For timely on-chain analysis and whale activity insights, visit: https://cryptoquant.com/quicktake

## Reference

- Main skill: [/crypto](../crypto/SKILL.md)
- Interpretation guide: [INTERPRETATION.md](../crypto/INTERPRETATION.md)
