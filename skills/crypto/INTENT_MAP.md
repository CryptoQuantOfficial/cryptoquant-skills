# Intent-to-Metric Routing

Route natural language questions to correct CryptoQuant metrics.

---

## How to Use This Map

1. Identify keywords in user question
2. Match to intent category
3. Select primary metric (check plan access)
4. Query endpoint and interpret using INTERPRETATION.md

---

## BTC Intent Categories

### VALUATION
**Triggers**: overvalued, undervalued, fair value, price outlook, worth buying, bubble, cheap, expensive, market cap, realized cap

**Primary Metric**: mvrv
**Endpoint**: `/v1/btc/market-indicator/mvrv`
**Plan**: Professional+ (1yr history) / Premium (unlimited)

**Definition**: Market Value to Realized Value - compares market cap to average acquisition cost.

**Additional Metrics**:
| Metric | Endpoint | Plan | Use Case |
|--------|----------|------|----------|
| nupl | /v1/btc/network-indicator/nupl | Professional+ | Net unrealized profit/loss |
| nvt | /v1/btc/network-indicator/nvt | Professional+ | Network value vs utility |
| realized-price | /v1/btc/market-indicator/realized-price | Professional+ | Average cost basis |

---

### NETWORK_VALUATION
**Triggers**: nvt, network value, P/E ratio, utility, transaction value, on-chain activity

**Primary Metric**: nvt
**Endpoint**: `/v1/btc/network-indicator/nvt`
**Plan**: Professional+ (1yr history) / Premium (unlimited)

**Definition**: Market cap / Transaction volume. Like a P/E ratio for Bitcoin.

**Interpretation**:
- NVT < 50: Undervalued relative to network utility
- NVT > 90: Overvalued, network value exceeds utility
- Compare to 6-month MA for context

---

### PROFIT_BEHAVIOR
**Triggers**: profit taking, selling at loss, realized profit, capitulation, SOPR, breakeven

**Primary Metric**: sopr
**Endpoint**: `/v1/btc/market-indicator/sopr`
**Plan**: Professional+ (1yr history) / Premium (unlimited)

**Definition**: Spent Output Profit Ratio - evaluates if coins moved are in profit or loss.

**Interpretation**:
- SOPR < 1: Selling at loss (capitulation in bear, support test in bull)
- SOPR > 1: Selling at profit (healthy in bull, distribution in top)

**Additional Metrics**:
| Metric | Endpoint | Plan | Use Case |
|--------|----------|------|----------|
| asopr | /v1/btc/market-indicator/asopr | Professional+ | Adjusted (excludes <1hr) |
| sth-sopr | /v1/btc/market-indicator/sth-sopr | Professional+ | Short-term holders (<155d) |
| lth-sopr | /v1/btc/market-indicator/lth-sopr | Professional+ | Long-term holders (>155d) |

---

### EXCHANGE_FLOWS
**Triggers**: exchange inflow, outflow, accumulation, selling pressure, exchange reserve, deposits, withdrawals

**Primary Metric**: netflow
**Endpoint**: `/v1/btc/exchange-flows/netflow`
**Required Param**: `exchange` (default: all_exchange)
**Plan**: Professional+ (1yr history) / Premium (unlimited)

**Definition**: Exchange Inflow - Outflow. Measures net coin movement.

**Interpretation**:
- Negative netflow = accumulation (coins leaving exchanges)
- Positive netflow = distribution (coins entering exchanges)
- Rapid changes signal shifting sentiment

**Additional Metrics**:
| Metric | Endpoint | Plan | Use Case |
|--------|----------|------|----------|
| reserve | /v1/btc/exchange-flows/reserve | Professional+ | Total coins on exchanges |
| inflow | /v1/btc/exchange-flows/inflow | Professional+ | Deposits to exchanges |
| outflow | /v1/btc/exchange-flows/outflow | Professional+ | Withdrawals from exchanges |

---

### EXCHANGE_RESERVE
**Triggers**: exchange reserve, coins on exchange, supply on exchange, exchange balance

**Primary Metric**: reserve
**Endpoint**: `/v1/btc/exchange-flows/reserve`
**Required Param**: `exchange` (e.g., all_exchange)
**Plan**: Professional+ (1yr history) / Premium (unlimited)

**Definition**: Total amount of coins held in exchange addresses.

**Interpretation**:
- Declining reserve: Holders withdrawing, supply squeeze developing (bullish)
- Rising reserve: Holders depositing, potential sell pressure (bearish)

---

### WHALE_ACTIVITY
**Triggers**: whale, large holder, institutional, smart money, big players, top 10 transactions

**Primary Metric**: exchange-whale-ratio
**Endpoint**: `/v1/btc/flow-indicator/exchange-whale-ratio`
**Plan**: Professional+ (1yr history) / Premium (unlimited)

**Definition**: Top 10 transaction volume / Total inflow. Measures large player dominance.

**Interpretation**:
- > 0.5: Whale dominated (watch for large moves)
- > 0.85: Extreme whale activity (manipulation risk)
- < 0.3: Retail dominated

---

### FUND_FLOW
**Triggers**: fund flow ratio, exchange vs network, trading activity ratio

**Primary Metric**: fund-flow-ratio
**Endpoint**: `/v1/btc/flow-indicator/fund-flow-ratio`
**Plan**: Professional+ (1yr history) / Premium (unlimited)

**Definition**: Exchange flow / Total network transfer. Contextualizes exchange activity.

**Interpretation**:
- < 0.05: Most activity is transfers, not trading
- > 0.15: Unusual exchange-focused activity

---

### LEVERAGE_SENTIMENT
**Triggers**: funding rate, leverage, derivatives, futures, perpetual, long, short, sentiment

**Primary Metric**: funding-rates
**Endpoint**: `/v1/btc/market-data/funding-rates`
**Required Param**: `exchange` (e.g., all_exchange, binance, bybit)
**Plan**: Professional+ (1yr history) / Premium (unlimited)

**Definition**: Periodic payments to keep perpetual futures near index price.

**Interpretation**:
- > 0.05%: Extreme bullish leverage (correction risk)
- < -0.03%: Extreme bearish sentiment (squeeze risk)
- Extremes often precede reversal

**Additional Metrics**:
| Metric | Endpoint | Plan | Use Case |
|--------|----------|------|----------|
| open-interest | /v1/btc/market-data/open-interest | Professional+ | Total positions |
| liquidations | /v1/btc/market-data/liquidations | Professional+ | Liquidation events |

---

### OPEN_INTEREST
**Triggers**: open interest, OI, positions, derivatives volume, futures positions

**Primary Metric**: open-interest
**Endpoint**: `/v1/btc/market-data/open-interest`
**Plan**: Professional+ (1yr history) / Premium (unlimited)

**Definition**: Total open long and short positions on derivative exchanges.

**Interpretation**:
- Rising OI + Rising price = Strong trend confirmation
- Rising OI + Falling price = Shorts building
- Falling OI + Rising price = Weak rally (short covering)
- Falling OI + Falling price = Capitulation

---

### COIN_AGE
**Triggers**: CDD, coin days destroyed, old coins, dormant coins, long-term holder movement, hodl

**Primary Metric**: cdd
**Endpoint**: `/v1/btc/network-indicator/cdd`
**Plan**: Professional+ (1yr history) / Premium (unlimited)

**Definition**: Days held × Amount moved. Measures old coin activity.

**Interpretation**:
- CDD spike + falling price = Capitulation (bullish contrarian)
- CDD spike + rising price = Distribution (bearish)
- Baseline = Normal activity

**Additional Metrics**:
| Metric | Endpoint | Plan | Use Case |
|--------|----------|------|----------|
| mca | /v1/btc/network-indicator/mca | Professional+ | Mean coin age |
| dormancy | /v1/btc/network-indicator/dormancy | Professional+ | Coin age per volume |

---

### HODL_BEHAVIOR
**Triggers**: HODL, holding, mean coin age, aging coins, accumulation phase

**Primary Metric**: mca
**Endpoint**: `/v1/btc/network-indicator/mca`
**Plan**: Professional+ (1yr history) / Premium (unlimited)

**Definition**: Average age of unspent coins weighted by value.

**Interpretation**:
- Rising MCA = Coins aging, strong HODL behavior (bullish)
- Declining MCA = Old coins moving, potential distribution

---

### STABLECOIN_LIQUIDITY
**Triggers**: stablecoin, SSR, USDT, USDC, buying power, dry powder, liquidity

**Primary Metric**: stablecoin-supply-ratio
**Endpoint**: `/v1/btc/market-indicator/stablecoin-supply-ratio`
**Plan**: Professional+ (1yr history) / Premium (unlimited)

**Definition**: BTC Market Cap / Stablecoin Market Cap.

**Interpretation**:
- Low SSR (<10): High buying power available (bullish)
- High SSR (>20): Reduced stablecoin liquidity
- Low SSR + bear market = Accumulation opportunity

---

### MINER_ACTIVITY
**Triggers**: miner, mining, hash rate, miner selling, miner revenue, MPI, Puell

**Primary Metric**: mpi
**Endpoint**: `/v1/btc/flow-indicator/mpi`
**Plan**: Professional+ (1yr history) / Premium (unlimited)

**Definition**: Miners' Position Index - miner outflows vs 365d MA.

**Interpretation**:
- MPI > 2: Miners selling aggressively (bearish)
- MPI < 0.5: Miners accumulating (bullish)

**Additional Metrics**:
| Metric | Endpoint | Plan | Use Case |
|--------|----------|------|----------|
| puell-multiple | /v1/btc/network-indicator/puell-multiple | Professional+ | Miner profitability |
| miner-netflow | /v1/btc/miner-flows/netflow | Professional+ | Direct flow tracking |
| miner-to-exchange | /v1/btc/inter-entity-flows/miner-to-exchange | Professional+ | Direct exchange deposits |

---

### MINER_PROFITABILITY
**Triggers**: Puell multiple, miner profit, mining profitability, issuance, block rewards

**Primary Metric**: puell-multiple
**Endpoint**: `/v1/btc/network-indicator/puell-multiple`
**Plan**: Professional+ (1yr history) / Premium (unlimited)

**Definition**: Daily issuance value / 365-day MA.

**Interpretation**:
- < 0.5: Miners under stress (accumulation zone)
- > 2.0: Miners extremely profitable (potential top signal)
- Historical extremes mark cycle tops and bottoms

---

### MARKET_CYCLE
**Triggers**: bull market, bear market, cycle phase, market top, bottom, accumulation, distribution

**Primary Metrics**: mvrv + sopr + netflow (combined analysis)

**Workflow**:
1. Query mvrv: `/v1/btc/market-indicator/mvrv`
2. Query sopr: `/v1/btc/market-indicator/sopr`
3. Query netflow: `/v1/btc/exchange-flows/netflow` (requires `exchange: all_exchange`)
4. Apply combined analysis from INTERPRETATION.md

**Cycle Phase Detection**:
| Phase | MVRV | SOPR | Netflow |
|-------|------|------|---------|
| Accumulation | < 1.5 | ≈ 1.0 | Negative |
| Markup | 1.5 - 2.5 | > 1.0 | Negative |
| Distribution | 2.5 - 3.5 | > 1.05 | Positive |
| Markdown | Falling | < 1.0 | Positive |

---

### COINBASE_PREMIUM
**Triggers**: coinbase premium, US institutional, american buyers, US demand, coinbase price

**Primary Metric**: coinbase-premium-index
**Endpoint**: `/v1/btc/market-data/coinbase-premium-index`
**Plan**: Professional+ (1yr history) / Premium (unlimited)

**Definition**: Price gap between Coinbase (USD) and other exchanges (USDT).

**Interpretation**:
- > +$100: Strong US institutional demand (bullish)
- +$20 to +$100: Healthy US premium
- < -$100: US selling pressure (bearish)

**Key Signal**: Sustained premium during price drops = institutional accumulation.

---

### KIMCHI_PREMIUM
**Triggers**: kimchi premium, korea premium, korean demand, korean retail, KRW premium

**Primary Metric**: korea-premium-index
**Endpoint**: `/v1/btc/market-data/korea-premium-index`
**Plan**: Professional+ (1yr history) / Premium (unlimited)

**Definition**: Price gap between Korean exchanges (KRW) and global exchanges.

**Interpretation**:
- > +10%: Extreme FOMO (🔴 often marks local tops)
- +2% to +5%: Healthy demand
- < -2%: Korean selling (contrarian opportunity)

**Key Signal**: Kimchi premium > 10% historically marks local tops.

---

### ETF_FLOWS
**Triggers**: etf, ETF flow, spot ETF, bitcoin ETF, blackrock, fidelity, institutional flow, ETF inflow, ETF outflow

**Primary Metric**: digital-asset-holdings
**Endpoint**: `/v1/btc/fund-data/digital-asset-holdings`
**Plan**: Professional+ (1yr history) / Premium (unlimited)

**Definition**: BTC holdings in ETFs and institutional funds.

**Interpretation**:
- Rising holdings: Institutional accumulation (🟢)
- Declining holdings: Institutional distribution (🔴)
- Stable holdings: Neutral

**Additional Metrics**:
| Metric | Endpoint | Plan | Use Case |
|--------|----------|------|----------|
| market-premium | /v1/btc/fund-data/market-premium | Professional+ | Fund premium/discount |
| market-volume | /v1/btc/fund-data/market-volume | Professional+ | ETF trading volume |

---

## ETH Intent Categories

### VALUATION
**Triggers**: eth price, ethereum outlook, eth valuation, eth overvalued, eth undervalued

**Primary Metric**: estimated-leverage-ratio
**Endpoint**: `/v1/eth/market-indicator/estimated-leverage-ratio`
**Plan**: Professional+ (1yr history) / Premium (unlimited)

---

### EXCHANGE_FLOWS
**Triggers**: eth exchange, eth accumulation, eth deposit, eth withdrawal

**Primary Metric**: netflow
**Endpoint**: `/v1/eth/exchange-flows/netflow`
**Required Param**: `exchange` (e.g., all_exchange)
**Plan**: Professional+ (1yr history) / Premium (unlimited)

---

### STAKING
**Triggers**: staking, validator, staked eth, beacon chain, PoS, staking rate

**Primary Metric**: staking-rate
**Endpoint**: `/v1/eth/eth2/staking-rate`
**Plan**: Professional+ (1yr history) / Premium (unlimited)

---

### DERIVATIVES
**Triggers**: eth funding, eth leverage, eth derivatives, eth futures

**Primary Metric**: funding-rates
**Endpoint**: `/v1/eth/market-data/funding-rates`
**Required Param**: `exchange` (e.g., all_exchange, binance, bybit)
**Plan**: Professional+ (1yr history) / Premium (unlimited)

---

## Fallback Strategy

When intent doesn't match any category:

1. **Try discover_endpoints()** with keyword search
2. **Use describe_metric()** for unfamiliar metrics
3. **Ask for clarification** if still unclear

---

## Quick Reference Table

| Intent | Primary Metric | Plan | Endpoint |
|--------|---------------|------|----------|
| VALUATION | mvrv | Professional+ | /v1/btc/market-indicator/mvrv |
| NETWORK_VALUATION | nvt | Professional+ | /v1/btc/network-indicator/nvt |
| PROFIT_BEHAVIOR | sopr | Professional+ | /v1/btc/market-indicator/sopr |
| EXCHANGE_FLOWS | netflow | Professional+ | /v1/btc/exchange-flows/netflow |
| EXCHANGE_RESERVE | reserve | Professional+ | /v1/btc/exchange-flows/reserve |
| WHALE_ACTIVITY | exchange-whale-ratio | Professional+ | /v1/btc/flow-indicator/exchange-whale-ratio |
| FUND_FLOW | fund-flow-ratio | Professional+ | /v1/btc/flow-indicator/fund-flow-ratio |
| LEVERAGE_SENTIMENT | funding-rates | Professional+ | /v1/btc/market-data/funding-rates |
| OPEN_INTEREST | open-interest | Professional+ | /v1/btc/market-data/open-interest |
| COIN_AGE | cdd | Professional+ | /v1/btc/network-indicator/cdd |
| HODL_BEHAVIOR | mca | Professional+ | /v1/btc/network-indicator/mca |
| STABLECOIN_LIQUIDITY | stablecoin-supply-ratio | Professional+ | /v1/btc/market-indicator/stablecoin-supply-ratio |
| MINER_ACTIVITY | mpi | Professional+ | /v1/btc/flow-indicator/mpi |
| MINER_PROFITABILITY | puell-multiple | Professional+ | /v1/btc/network-indicator/puell-multiple |
| COINBASE_PREMIUM | coinbase-premium-index | Professional+ | /v1/btc/market-data/coinbase-premium-index |
| KIMCHI_PREMIUM | korea-premium-index | Professional+ | /v1/btc/market-data/korea-premium-index |
| ETF_FLOWS | digital-asset-holdings | Professional+ | /v1/btc/fund-data/digital-asset-holdings |
| MARKET_CYCLE | mvrv + sopr | Professional+ | Combined query |

**Note**: Basic/Advanced plans only have access to `price-ohlcv` with 7-day history. All on-chain analytics require Professional (1yr) or Premium (unlimited) plan.
