# CryptoQuant Plugin for Claude

<p align="center">
  <strong>On-Chain Analytics in Your AI Assistant</strong>
</p>

<p align="center">
  <a href="#installation">Installation</a> •
  <a href="#features">Features</a> •
  <a href="#slash-commands">Slash Commands</a>
</p>

---

## What is this?

CryptoQuant Plugin for Claude brings on-chain analytics directly into your Claude experience:

- **Natural language queries**: Ask in any language - "비트코인 가격 전망?" or "Is BTC overvalued?"
- **Real-time metrics**: MVRV, SOPR, Exchange Flows, Funding Rates
- **Market insights**: AI-powered interpretation of on-chain data
- **Whale tracking**: Monitor large holder movements

---

## How It Works: MCP + Skills

This plugin combines two layers for optimal AI-powered analytics:

### MCP Server ([cryptoquant-mcp](https://www.npmjs.com/package/cryptoquant-mcp))
- Connects Claude to CryptoQuant's real-time on-chain data
- Provides 245+ metrics via tool calls
- Handles API authentication and rate limiting
- **What Claude can do** - raw data access

### Skills (this repository)
- Teaches Claude how to interpret on-chain metrics
- Routes user intents ("Is BTC overvalued?") to correct metrics
- Embeds domain expertise and market analysis frameworks
- Provides multi-lingual support (English/Korean)
- **How Claude should do it** - workflow guidance

### Together

You get AI-powered on-chain analysis - ask questions in natural language, get data-driven insights instantly.

| Scenario | Without Skills | With Skills |
|----------|---------------|-------------|
| User asks "Is Bitcoin overvalued?" | Calls random metrics, struggles to interpret | Routes to MVRV, NVT, Puell; interprets "MVRV at 2.1 = Fair value" |
| User asks "고래들 움직임?" | May not understand Korean intent | Routes to whale-ratio, netflow; responds in Korean |
| User asks "Quick market check" | Verbose multi-step process | `/crypto-market` → 30-second summary with signal |

---

## Installation

### Claude Code

**Step 1**: Install the plugin

```bash
/plugin marketplace add CryptoQuantOfficial/cryptoquant-skills
/plugin install cryptoquant
```

**Step 2**: Restart Claude Code

**Step 3**: Run `/crypto` to initialize. Done!

### MCP Server

The MCP server is available as a separate package: [cryptoquant-mcp](https://www.npmjs.com/package/cryptoquant-mcp)

Add to your MCP config file:

| App | Config File |
|-----|-------------|
| **Claude Desktop (Mac)** | `~/Library/Application Support/Claude/claude_desktop_config.json` |
| **Claude Desktop (Windows)** | `%APPDATA%\Claude\claude_desktop_config.json` |
| **Claude Code** | `~/.claude/mcp.json` or project `.mcp.json` |
| **Cursor** | Project `.cursor/mcp.json` |

```json
{
  "mcpServers": {
    "cryptoquant": {
      "command": "npx",
      "args": ["-y", "cryptoquant-mcp"]
    }
  }
}
```

---

## Features

### Skills (Slash Commands)
| Skill | Command | Description |
|-------|---------|-------------|
| [`crypto`](skills/crypto/SKILL.md) | `/crypto` | Main skill - initialize session, on-chain data analysis |
| [`crypto-market`](skills/crypto-market/SKILL.md) | `/crypto-market` | Quick market summary |
| [`crypto-signal`](skills/crypto-signal/SKILL.md) | `/crypto-signal` | Buy/sell/hold trading signal |
| [`crypto-whale`](skills/crypto-whale/SKILL.md) | `/crypto-whale` | Track whale activity |

### Agents
| Agent | Role |
|-------|------|
| [`market-analyst`](agents/market-analyst.md) | Comprehensive market analysis |
| [`whale-tracker`](agents/whale-tracker.md) | Large holder movement monitoring |

---

## Natural Language Queries

Ask questions in any language - Claude will route to the right metrics:

| Query | Intent | Metric |
|-------|--------|--------|
| "비트코인 가격 전망이 어때?" | VALUATION | MVRV |
| "Is BTC overvalued?" | VALUATION | MVRV |
| "고래들 움직임 보여줘" | WHALE_ACTIVITY | whale-ratio |
| "What's the funding rate?" | LEVERAGE | funding-rates |
| "익절/손절 상황?" | PROFIT_BEHAVIOR | SOPR |

See [INTENT_MAP.md](skills/crypto/INTENT_MAP.md) for full intent-to-metric routing.

---

## Slash Commands

### /crypto
Initialize your CryptoQuant session:
```
/crypto
→ Authenticates and shows your plan/permissions
```

### /crypto-market
Quick market summary:
```
/crypto-market        # Bitcoin (default)
/crypto-market eth    # Ethereum
```

### /crypto-signal
Get buy/sell/hold trading signal:
```
/crypto-signal        # Bitcoin (default)
/crypto-signal eth    # Ethereum
```

### /crypto-whale
Track whale movements:
```
/crypto-whale          # Last 24h
/crypto-whale 7d       # Last 7 days
```

---

## Authentication

### Option A. Environment Variable (Recommended)

Add your API key to the MCP config:

```json
{
  "mcpServers": {
    "cryptoquant": {
      "command": "npx",
      "args": ["-y", "cryptoquant-mcp"],
      "env": {
        "CRYPTOQUANT_API_KEY": "your-api-key"
      }
    }
  }
}
```

### Option B. Direct Parameter

Call `initialize()` with your API key:

```
initialize(api_key="your-api-key")
```

The key will be saved to `~/.cryptoquant/credentials` for future sessions.

**Get your API key**: [https://cryptoquant.com/settings/api](https://cryptoquant.com/settings/api)

---

## License

MIT License - see [LICENSE](LICENSE)

---

<p align="center">
  <a href="https://cryptoquant.com">CryptoQuant</a> •
  <a href="https://docs.cryptoquant.com">Docs</a> •
  <a href="https://github.com/CryptoQuantOfficial/cryptoquant-skills/issues">Issues</a>
</p>
