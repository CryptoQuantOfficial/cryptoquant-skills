# Metric Interpretation Guide

Convert raw metric values to actionable signals using CryptoQuant's professional on-chain analysis framework.

---

## Signal Legend

| Symbol | Signal | Action |
|--------|--------|--------|
| 🟢 | Bullish / Buy opportunity | Consider accumulating |
| 🟡 | Neutral | Hold / Wait for clearer signal |
| 🟠 | Caution | Be cautious, potential reversal |
| 🔴 | Bearish / Sell signal | Consider reducing exposure |

---

## Valuation Metrics

### MVRV (Market Value to Realized Value)

**Definition**: MVRV ratio is defined as an asset's market capitalization divided by realized capitalization.

**Interpretation**: Reveals whether Bitcoin is trading above or below its average acquisition cost. Ratios significantly above 1.0 suggest overvaluation; ratios near 1.0 or below indicate undervaluation.

| Value | Signal | Meaning |
|-------|--------|---------|
| < 1.0 | 🟢 Undervalued | Below average cost basis - historical buy zone |
| 1.0 - 1.5 | 🟢 Accumulation | Fair value, favorable entry |
| 1.5 - 2.5 | 🟡 Neutral | Fair value range |
| 2.5 - 3.5 | 🟠 Elevated | Caution, potential correction |
| > 3.5 | 🔴 Overheated | High risk - historically signals cycle tops |

**Key Thresholds**:
- MVRV < 1: Historically excellent buy zone (below average cost)
- MVRV > 3.5: Historically signals cycle tops
- Rapidly declining MVRV: Bearish even at moderate values

---

### NVT Ratio (Network Value to Transactions)

**Definition**: Defined as the ratio of market capitalization divided by transacted volume in the specified window.

**Interpretation**: Like a P/E ratio for Bitcoin. High NVT suggests overvaluation relative to network utility; low NVT indicates potential undervaluation.

| Value | Signal | Meaning |
|-------|--------|---------|
| < 50 | 🟢 Undervalued | High utility relative to price |
| 50 - 90 | 🟡 Neutral | Fair value |
| > 90 | 🟠 Elevated | Network value exceeds utility |
| > 120 | 🔴 Overheated | Bubble territory |

**Key Insight**: Compare to 6-month moving average. Above average = overvalued, below = undervalued.

---

### Puell Multiple

**Definition**: Defined as the ratio of the daily value of the issued coin in USD divided by 365-day moving average.

**Interpretation**: Measures miner profitability relative to historical average. High values indicate miner profitability peaks (potential sell signals); lows suggest accumulation phases.

| Value | Signal | Meaning |
|-------|--------|---------|
| < 0.5 | 🟢 Undervalued | Miners under stress - accumulation zone |
| 0.5 - 1.0 | 🟡 Neutral | Normal profitability |
| 1.0 - 2.0 | 🟠 Elevated | Elevated profitability |
| > 2.0 | 🔴 Extreme | Miner euphoria - potential top signal |

---

## Profit Behavior Metrics

### SOPR (Spent Output Profit Ratio)

**Definition**: Evaluates the profit ratio of whole market participants by comparing the value of outputs at the spent time to created time.

**Interpretation**: Values above 1.0 indicate profitable exits; below 1.0 suggests loss-taking.

| Value | Signal | Meaning |
|-------|--------|---------|
| < 0.95 | 🟢 Capitulation | Panic selling, often near bottom |
| 0.95 - 1.0 | 🟡 Near breakeven | Support/resistance test |
| 1.0 - 1.05 | 🟡 Light profit | Normal market activity |
| 1.05 - 1.10 | 🟠 Profit taking | Distribution phase beginning |
| > 1.10 | 🔴 Heavy profit taking | Strong distribution |

**Key Insight**:
- SOPR < 1 sustained = bear market capitulation
- SOPR bouncing off 1.0 = bull market support level

### aSOPR (Adjusted SOPR)

**Definition**: Ratio of spent outputs (lived more than an hour) in profit at the time of the window. Filters out short-term noise.

**Use Case**: More reliable than base SOPR for market analysis as it excludes same-day transactions.

### STH-SOPR (Short-Term Holder SOPR)

**Definition**: Ratio of spent outputs alive more than 1 hour and less than 155 days in profit.

**Interpretation**: Shows short-term trader behavior.
- STH-SOPR < 1: Short-term holders selling at loss (local bottom signal)
- STH-SOPR > 1.05: Short-term profit taking (potential local top)

### LTH-SOPR (Long-Term Holder SOPR)

**Definition**: Ratio of spent outputs lived more than 155 days in profit.

**Interpretation**: Shows long-term holder conviction.
- LTH-SOPR dropping sharply: Long-term holders capitulating (major bottom signal)
- LTH-SOPR > 1.5: Long-term holders taking significant profits (cycle top warning)

---

## Exchange Flow Metrics

### Exchange Netflow

**Definition**: Exchange Inflow - Outflow = Netflow. Measures net coin movement to/from exchanges.

**Interpretation**: Large inflows suggest selling pressure; outflows indicate accumulation. Rapid changes signal shifting market sentiment.

| Value (BTC) | Signal | Meaning |
|-------------|--------|---------|
| < -5,000 | 🟢 Strong accumulation | Heavy withdrawal from exchanges |
| -5,000 to -1,000 | 🟢 Accumulation | Coins leaving exchanges |
| -1,000 to 1,000 | 🟡 Neutral | Balanced flow |
| 1,000 to 5,000 | 🟠 Distribution | Coins entering exchanges |
| > 5,000 | 🔴 Strong distribution | Heavy deposit to exchanges |

**Key Insight**: Always consider 7-day trend, not just daily values.

### Exchange Reserve

**Definition**: The total amount of coins held in exchange addresses.

**Interpretation**: Declining reserves often precede price increases as holders withdraw coins. Rising reserves indicate selling preparation.

| Trend | Signal | Meaning |
|-------|--------|---------|
| Decreasing (7d) | 🟢 Bullish | Supply squeeze developing |
| Stable | 🟡 Neutral | No significant trend |
| Increasing (7d) | 🔴 Bearish | Potential selling pressure |

---

## Whale & Entity Metrics

### Exchange Whale Ratio

**Definition**: The total BTC amount of top 10 transactions (in terms of total BTC sent) divided by the total BTC amount flowing into exchange.

**Interpretation**: High ratios indicate large players dominating inflows, potentially signaling coordinated selling or market manipulation risk.

| Value | Signal | Meaning |
|-------|--------|---------|
| < 0.3 | 🟡 Retail dominated | Small players active |
| 0.3 - 0.5 | 🟡 Mixed | Balanced activity |
| 0.5 - 0.7 | 🟠 Whale heavy | Large players active |
| 0.7 - 0.85 | 🔴 Whale dominated | Watch for large moves |
| > 0.85 | 🔴 Extreme | Major whale activity - high manipulation risk |

**Key Insight**: High whale ratio + positive netflow = potential coordinated dump

### Fund Flow Ratio

**Definition**: The total BTC amount flowing into or out of exchange divided by the total BTC amount transferred on the whole Bitcoin network.

**Interpretation**: Helps contextualize exchange activity relative to overall network activity.

| Value | Signal | Meaning |
|-------|--------|---------|
| < 0.05 | 🟢 Low exchange focus | Most activity is transfers, not trading |
| 0.05 - 0.15 | 🟡 Normal | Typical exchange activity |
| > 0.15 | 🟠 High exchange focus | Unusual trading activity |

---

## Derivatives Metrics

### Funding Rate

**Definition**: Periodic payments between traders to make the perpetual futures contract price close to the index price.

**Interpretation**: Extreme positive rates indicate excessive long leverage; negative rates suggest short dominance—both carry reversal risk.

| Value | Signal | Meaning |
|-------|--------|---------|
| < -0.03% | 🟢 Extreme fear | Shorts overcrowded - squeeze risk |
| -0.03% to -0.01% | 🟢 Bearish sentiment | More shorts |
| -0.01% to 0.01% | 🟡 Neutral | Balanced sentiment |
| 0.01% to 0.03% | 🟠 Bullish sentiment | More longs |
| 0.03% to 0.05% | 🟠 Elevated | Longs overcrowded |
| > 0.05% | 🔴 Extreme greed | High correction risk - long squeeze likely |

**Key Insight**: Extreme funding often precedes reversal.

### Open Interest

**Definition**: The amount of open positions (including both long and short positions) currently on derivative exchanges.

**Interpretation**: Rising open interest during price rallies confirms conviction; declining OI during rallies suggests weakening momentum.

| Trend | Price | Signal | Meaning |
|-------|-------|--------|---------|
| Rising | Rising | 🟢 Strong confirmation | Trend has conviction |
| Rising | Falling | 🔴 Bearish | Shorts building aggressively |
| Falling | Rising | 🟠 Weak rally | Short covering, not new longs |
| Falling | Falling | 🟡 Capitulation | Position unwinding, trend weakening |

---

## UTxO Age-Based Metrics

### CDD (Coin Days Destroyed)

**Definition**: When UTxO is destroyed, CDD is calculated as the sum value of (number of days between created and spent) × (UTxO amount).

**Interpretation**: Spikes in CDD signal long-term holders moving coins (potential capitulation or profit taking). Baseline CDD reflects normal market activity.

| Trend | Signal | Meaning |
|-------|--------|---------|
| Baseline (normal) | 🟡 Neutral | Normal coin movement |
| Moderate spike | 🟠 Attention | Old coins moving |
| Major spike | 🔴 Alert | Long-term holders capitulating or distributing |

**Key Insight**: CDD spike + falling price = capitulation (bullish contrarian). CDD spike + rising price = distribution (bearish).

### Mean Coin Age (MCA)

**Definition**: The mean value of products of (coins unspent transaction output alive days) × (its value).

**Interpretation**: Rising MCA indicates coins aging (holders HODLing); declining MCA shows accelerating circulation and potential distribution.

| Trend | Signal | Meaning |
|-------|--------|---------|
| Rising | 🟢 HODLing | Coins aging, accumulation |
| Stable | 🟡 Neutral | Balance of old and new |
| Declining | 🟠 Circulation | Old coins moving, potential distribution |

---

## Stablecoin Metrics

### SSR (Stablecoin Supply Ratio)

**Definition**: Defined as Market Cap of BTC divided by Market Cap of all Stablecoins.

**Interpretation**: Rising stablecoin reserves relative to Bitcoin indicate capital readiness to purchase; depleting reserves suggest ongoing buying already occurred.

| Value | Signal | Meaning |
|-------|--------|---------|
| Low (< 10) | 🟢 Buying power ready | High stablecoin supply vs BTC |
| Normal (10-20) | 🟡 Neutral | Balanced |
| High (> 20) | 🟠 Reduced dry powder | Less stablecoin buying power |

**Key Insight**: Low SSR during bear market = accumulation opportunity.

---

## Miner Behavior Metrics

### MPI (Miners' Position Index)

**Definition**: Defined as the ratio of all miners' outflows in USD divided by 365-day moving average.

**Interpretation**: Elevated MPI indicates miners accelerating sales—often preceding bearish moves.

| Value | Signal | Meaning |
|-------|--------|---------|
| < 0.5 | 🟢 Accumulating | Miners holding |
| 0.5 - 1.0 | 🟡 Normal | Average selling rate |
| 1.0 - 2.0 | 🟠 Elevated selling | Miners more active |
| > 2.0 | 🔴 Heavy selling | Miners distributing aggressively |

### Miner to Exchange Flow

**Interpretation**: Direct miner deposits to exchanges indicate immediate selling intention. Spike patterns reveal coordinated liquidation risk.

| Trend | Signal | Meaning |
|-------|--------|---------|
| Low/Stable | 🟢 Holding | Miners not selling directly |
| Rising | 🟠 Selling | Miners moving to exchanges |
| Spike | 🔴 Capitulation | Coordinated miner selling |

---

## Premium Metrics

### Coinbase Premium

**Definition**: The price gap between Coinbase (USD pair) and other exchanges (USDT pairs). Measures US institutional buying pressure.

**Interpretation**: Positive premium indicates US institutional demand; negative premium suggests US selling pressure relative to global market.

| Value | Signal | Meaning |
|-------|--------|---------|
| > +$100 | 🟢 Strong US demand | Institutions buying aggressively |
| +$20 to +$100 | 🟢 US premium | Healthy institutional interest |
| -$20 to +$20 | 🟡 Neutral | Balanced global pricing |
| -$100 to -$20 | 🟠 US discount | US sellers dominating |
| < -$100 | 🔴 Heavy US selling | Institutional distribution |

**Key Insight**: Sustained Coinbase premium often precedes major rallies. Premium during price drops = institutional accumulation.

### Kimchi Premium (Korea Premium)

**Definition**: The price gap between Korean exchanges (KRW pairs) and global exchanges. Measures Korean retail demand intensity.

**Interpretation**: High Kimchi premium historically signals retail FOMO and potential local tops; negative premium indicates Korean selling pressure.

| Value | Signal | Meaning |
|-------|--------|---------|
| > +10% | 🔴 Extreme FOMO | Korean retail euphoria - caution |
| +5% to +10% | 🟠 High demand | Strong Korean buying |
| +2% to +5% | 🟡 Moderate premium | Healthy local demand |
| -2% to +2% | 🟡 Neutral | Normal arbitrage range |
| < -2% | 🟢 Discount | Korean selling - contrarian opportunity |

**Key Insight**: Kimchi premium > 10% has historically marked local tops. Premium collapse often signals trend reversal.

---

## ETF & Institutional Flow Metrics

### ETF Fund Netflow

**Definition**: Net flow of BTC into/out of spot Bitcoin ETFs (BlackRock, Fidelity, etc.). Tracks institutional capital movement.

**Interpretation**: Positive netflow = institutional accumulation; negative netflow = institutional distribution. Most important institutional demand indicator.

| Value (Daily) | Signal | Meaning |
|---------------|--------|---------|
| > +$500M | 🟢 Strong accumulation | Massive institutional buying |
| +$100M to +$500M | 🟢 Accumulation | Healthy institutional demand |
| -$100M to +$100M | 🟡 Neutral | Balanced flow |
| -$500M to -$100M | 🟠 Distribution | Institutional selling |
| < -$500M | 🔴 Heavy outflow | Significant institutional exit |

**Weekly Context**:
| 7-Day Net | Interpretation |
|-----------|----------------|
| > +$1B | 🟢 Strong institutional conviction |
| +$500M to +$1B | 🟢 Sustained buying |
| -$500M to +$500M | 🟡 Mixed signals |
| < -$500M | 🔴 Sustained distribution |

**Key Insight**: ETF flows are now a primary demand driver. Multi-day positive streaks strongly bullish; consecutive outflow days signal risk-off.

### GBTC Premium/Discount

**Definition**: Price difference between GBTC (Grayscale Bitcoin Trust) and its NAV (Net Asset Value).

**Interpretation**: Discount indicates weak institutional demand or arbitrage pressure; premium (rare post-ETF) indicates exceptional demand.

| Value | Signal | Meaning |
|-------|--------|---------|
| Premium > 0% | 🟢 Rare demand | Exceptional buying (historically rare) |
| Discount 0-5% | 🟡 Normal | Typical post-ETF state |
| Discount 5-15% | 🟡 Moderate | Standard discount range |
| Discount > 15% | 🟠 Deep discount | Selling pressure / arbitrage |

---

## Combined Analysis (Market Cycle Detection)

### Bull Market Signals (need 2+ of these)

- MVRV > 1.5 and rising
- SOPR consistently > 1.0
- Exchange netflow negative (accumulation)
- Funding rate positive but < 0.03%
- Exchange reserve declining
- MCA rising (HODLing)

### Bear Market Signals (need 2+ of these)

- MVRV < 1.5 and falling
- SOPR frequently < 1.0
- Exchange netflow positive (distribution)
- Funding rate negative or extremely positive
- Exchange reserve increasing
- CDD spikes (capitulation)

### Cycle Phases

| Phase | MVRV | SOPR | Netflow | Funding | Reserve | CDD |
|-------|------|------|---------|---------|---------|-----|
| Accumulation | < 1.5 | ≈ 1.0 | Negative | Neutral/Neg | Stable/Down | Low |
| Markup (Early Bull) | 1.5 - 2.5 | > 1.0 | Negative | Low positive | Declining | Low |
| Distribution | 2.5 - 3.5 | > 1.05 | Positive | High positive | Rising | Spikes |
| Markdown (Bear) | Falling | < 1.0 | Positive | Negative | Rising | Spikes |

---

## Signal Aggregation

For `/crypto-signal` command, weight metrics:

| Metric | Weight | Rationale |
|--------|--------|-----------|
| MVRV | 30% | Long-term valuation |
| SOPR | 25% | Behavioral signal |
| Netflow | 25% | Supply/demand |
| Funding | 20% | Sentiment |

**Optional Enhancers** (if available):
- NVT confirms valuation
- Whale Ratio confirms large player activity
- Reserve trend confirms flow direction

**Final Signal**:
- Score > 70: **BUY**
- Score 40-70: **HOLD**
- Score < 40: **SELL**

---

## Key Thresholds Summary

| Metric | 🟢 Bullish | 🟡 Neutral | 🔴 Bearish |
|--------|------------|------------|------------|
| MVRV | < 1.5 | 1.5 - 2.5 | > 3.5 |
| SOPR | < 0.95 (capitulation) | 0.95 - 1.05 | > 1.10 |
| Netflow | < -1,000 BTC | -1,000 to +1,000 | > +5,000 BTC |
| Reserve | Decreasing | Stable | Increasing |
| Funding | < -0.01% | ±0.01% | > 0.05% |
| Whale Ratio | < 0.3 | 0.3 - 0.5 | > 0.7 |
| CDD | Baseline | Normal | Major spike |
| NVT | < 50 | 50 - 90 | > 120 |
| Puell | < 0.5 | 0.5 - 1.0 | > 2.0 |
| MPI | < 0.5 | 0.5 - 1.0 | > 2.0 |
| Coinbase Premium | > +$20 | ±$20 | < -$100 |
| Kimchi Premium | < -2% (discount) | ±2% | > +10% (FOMO) |
| ETF Netflow | > +$100M/day | ±$100M | < -$500M/day |

---

## Important Notes

1. **No single metric is definitive** - always use multiple confirmations
2. **Context matters** - same values mean different things in bull vs bear
3. **Compare to history** - use moving averages and historical extremes
4. **On-chain validates derivatives** - flows confirm positioning
5. **This is not financial advice** - metrics are informational only
