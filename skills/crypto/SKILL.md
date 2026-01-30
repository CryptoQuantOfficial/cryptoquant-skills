---
name: crypto
description: |
  On-chain analytics for Bitcoin, Ethereum, and cryptocurrency markets using CryptoQuant data.
  Use when user asks about "bitcoin outlook", "price analysis", "market valuation", "is BTC overvalued",
  "whale activity", "exchange flows", "market cycle", "bull or bear market", "on-chain analysis",
  "비트코인 전망", "가격 분석", "고평가", "저평가", "시장 사이클", or wants data-driven crypto market insights.
  Provides MVRV, SOPR, NVT, funding rates, and 200+ on-chain metrics.
license: MIT
metadata:
  author: CryptoQuant
  version: 1.0.0
  mcp-server: cryptoquant
  category: on-chain-analytics
  tags: [bitcoin, ethereum, on-chain, market-analysis]
allowed-tools:
  - mcp__plugin_cryptoquant_cryptoquant__initialize
  - mcp__plugin_cryptoquant_cryptoquant__query_data
  - mcp__plugin_cryptoquant_cryptoquant__discover_endpoints
  - mcp__plugin_cryptoquant_cryptoquant__describe_metric
  - mcp__plugin_cryptoquant_cryptoquant__list_assets
  - mcp__plugin_cryptoquant_cryptoquant__get_endpoint_info
---

# CryptoQuant On-Chain Analytics

Access CryptoQuant's on-chain data for cryptocurrency market analysis.

## Response Language

**Always respond in the same language as the user's prompt.** If the user asks in Korean, respond in Korean. If in English, respond in English.

---

## Quick Start

```
/crypto                   # Initialize session (run first!)
/crypto-market            # Quick market summary
/crypto-signal btc        # Get buy/sell/hold signal
/crypto-whale             # Track whale activity
```

---

## Session Initialization

**MUST run `/crypto` before any data request.**

```
/crypto
    ↓
┌─────────────────────────────────────┐
│ Check for API key:                  │
│ 1. Environment variable             │
│ 2. Stored credentials               │
│    (~/.cryptoquant/credentials)     │
└─────────────────────────────────────┘
    ↓
┌─────────────────────────────────────┐
│ No key found?                       │
│ → Browser opens automatically       │
│ → User enters API key               │
│ → Key saved locally                 │
└─────────────────────────────────────┘
    ↓
Authenticated → Shows plan/permissions
```

---

## Available Commands

| Command | Description |
|---------|-------------|
| `/crypto` | Initialize session, show status |
| `/crypto-market [asset]` | Quick 30-second market summary |
| `/crypto-signal [asset]` | Buy/Sell/Hold trading signal |
| `/crypto-whale [asset]` | Whale activity tracker |

---

## Available Agents

| Agent | Trigger | Description |
|-------|---------|-------------|
| `market-analyst` | "full analysis", "market report" | Comprehensive multi-metric analysis |
| `whale-tracker` | "whale tracking", "smart money" | Deep whale movement monitoring |

---

## Intent-to-Metric Quick Reference

| User Question | Intent | Primary Metric | Plan |
|---------------|--------|----------------|------|
| "Is BTC overvalued?" | VALUATION | mvrv | Professional+ |
| "Network utility vs price?" | NETWORK_VALUATION | nvt | Professional+ |
| "Profit taking happening?" | PROFIT_BEHAVIOR | sopr | Professional+ |
| "Exchange accumulation?" | EXCHANGE_FLOWS | netflow | Professional+ |
| "Coins on exchanges?" | EXCHANGE_RESERVE | reserve | Professional+ |
| "Whale activity?" | WHALE_ACTIVITY | whale-ratio | Professional+ |
| "Funding rate?" | LEVERAGE_SENTIMENT | funding-rates | Professional+ |
| "Open positions?" | OPEN_INTEREST | open-interest | Professional+ |
| "Old coins moving?" | COIN_AGE | cdd | Professional+ |
| "HODL behavior?" | HODL_BEHAVIOR | mca | Professional+ |
| "Stablecoin buying power?" | STABLECOIN_LIQUIDITY | ssr | Professional+ |
| "Miners selling?" | MINER_ACTIVITY | mpi | Professional+ |
| "Miner profitability?" | MINER_PROFITABILITY | puell-multiple | Professional+ |
| "US institutional buying?" | COINBASE_PREMIUM | coinbase-premium | Professional+ |
| "Korean retail FOMO?" | KIMCHI_PREMIUM | korea-premium | Professional+ |
| "ETF inflows?" | ETF_FLOWS | etf-netflow | Professional+ |
| "Bull or bear market?" | MARKET_CYCLE | mvrv + sopr | Professional+ |

**Note**: Basic/Advanced plans only have access to `price-ohlcv`. All on-chain metrics require Professional or Premium plan.

See [INTENT_MAP.md](INTENT_MAP.md) for full routing details.

---

## Interpretation Quick Reference

### Valuation Metrics

| Metric | 🟢 Bullish | 🟡 Neutral | 🔴 Bearish |
|--------|------------|------------|------------|
| MVRV | < 1.5 | 1.5 - 2.5 | > 3.5 |
| NVT | < 50 | 50 - 90 | > 120 |
| Puell | < 0.5 | 0.5 - 1.0 | > 2.0 |

### Behavior Metrics

| Metric | 🟢 Bullish | 🟡 Neutral | 🔴 Bearish |
|--------|------------|------------|------------|
| SOPR | < 0.95 (capitulation) | 0.95 - 1.05 | > 1.10 |
| CDD | Baseline | Normal | Major spike |
| MCA | Rising | Stable | Declining |

### Flow Metrics

| Metric | 🟢 Bullish | 🟡 Neutral | 🔴 Bearish |
|--------|------------|------------|------------|
| Netflow | < -1,000 BTC | ±1,000 | > +5,000 BTC |
| Reserve | Decreasing | Stable | Increasing |
| Whale Ratio | < 0.3 | 0.3 - 0.5 | > 0.7 |

### Derivatives Metrics

| Metric | 🟢 Bullish | 🟡 Neutral | 🔴 Bearish |
|--------|------------|------------|------------|
| Funding | < -0.01% | ±0.01% | > 0.05% |
| OI + Price | Both rising | Mixed | OI up, Price down |

### Miner & Liquidity

| Metric | 🟢 Bullish | 🟡 Neutral | 🔴 Bearish |
|--------|------------|------------|------------|
| MPI | < 0.5 | 0.5 - 1.0 | > 2.0 |
| SSR | < 10 | 10 - 20 | > 20 |

### Premium & ETF Metrics

| Metric | 🟢 Bullish | 🟡 Neutral | 🔴 Bearish |
|--------|------------|------------|------------|
| Coinbase Premium | > +$20 | ±$20 | < -$100 |
| Kimchi Premium | < -2% | ±2% | > +10% (FOMO) |
| ETF Netflow | > +$100M/day | ±$100M | < -$500M/day |

See [INTERPRETATION.md](INTERPRETATION.md) for detailed thresholds and definitions.

---

## MCP Tools Reference

### Authentication
| Tool | Description |
|------|-------------|
| `initialize()` | **MUST CALL FIRST** - Initialize session |
| `reset_session(clear_stored?)` | Clear session/credentials |

### Data Access
| Tool | Description |
|------|-------------|
| `list_assets()` | List supported assets (btc, eth) |
| `discover_endpoints(asset?, category?)` | Find available endpoints |
| `query_data(endpoint, params)` | Query raw data |
| `describe_metric(metric_id)` | Get metric description |

### Typical Workflow
```
1. initialize()              # Authenticate
2. INTENT_MAP.md 참조        # Get EXACT endpoint path & required params
3. query_data()              # Query with correct path and params
4. Interpret using INTERPRETATION.md
```

**CRITICAL**: Do NOT guess endpoint paths. Always check INTENT_MAP.md for:
- Exact endpoint path (e.g., `/v1/btc/market-indicator/sopr`, NOT `network-indicator`)
- Required parameters (e.g., `exchange` for netflow)

---

## Plan Information

| Plan | Accessible Endpoints | Data Range | Rate Limit |
|------|---------------------|------------|------------|
| Premium | All (245+) | Unlimited | 800/min |
| Professional | All (245+) | 1 year | 20/min |
| Advanced | price-ohlcv only | 7 days | 50/day |
| Basic | price-ohlcv only | 7 days | 50/day |

### Plan Access Details

**Basic / Advanced Plans**:
- Only `price-ohlcv` endpoint accessible
- 7-day historical data limit
- Covers: BTC, ETH, TRX, Stablecoin, ERC20, XRP, ALT
- For timely on-chain analysis and market insights, visit: https://cryptoquant.com/quicktake

**Professional Plan** (all metrics, 1 year history):
- Valuation: MVRV, NVT, SOPR, NUPL, Puell Multiple
- Exchange Flows: Netflow, Reserve, Inflow, Outflow
- Network Indicators: CDD, Mean Coin Age, Dormancy
- Flow Indicators: Whale Ratio, Fund Flow Ratio, MPI
- Derivatives: Funding Rates, Open Interest, Liquidations
- Premium Indicators: Coinbase Premium, Korea Premium
- And 200+ more metrics

**Premium Plan** (all metrics, unlimited history):
- Same endpoints as Professional
- Unlimited historical data access
- Higher rate limit (800/min)

---

## Error Handling

### Not Initialized
```
Run /crypto first to connect.
Get API key at: https://cryptoquant.com/settings/api
```

### Access Denied
```
[Metric] requires [Plan] plan.
Your plan: [Current]
Alternative: price-ohlcv (7-day price data)
Free analysis: https://cryptoquant.com/quicktake
```

---

## Reference Files

- **Intent routing**: [INTENT_MAP.md](INTENT_MAP.md)
- **Value interpretation**: [INTERPRETATION.md](INTERPRETATION.md)
