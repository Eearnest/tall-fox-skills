# 🦊 Tall Fox Skills — IronClaw Agent Skill Pack

A production-ready skill pack for [IronClaw](https://ironclaw.com) agents built by [@Eearnest](https://github.com/Eearnest) — covering trading, research, market analysis, DeFi, community tools, and more.

> **43 skills. 2 tool proposals. 1 community bot.**
> Built for the NEAR ecosystem. Open to everyone.

---

## 🤖 Live Agents

| Agent | Purpose | Bot |
|-------|---------|-----|
| **Main Trading Agent** | 42-skill trading + research agent | Private |
| **LegionPulse** | Community digest bot for NEAR Legion Nigeria | [@LegionPulseBot](https://t.me/LegionPulseBot) |

---

## 📦 Skills (43 total)

### 🔍 Research & Data
| Skill | Description |
|-------|-------------|
| `web-search` | Search the web and return summarized, sourced answers |
| `crypto-tracker` | Fetch and interpret crypto prices and market data |
| `news-fetcher` | Pull and summarize latest news from reliable sources |

### 💬 Communication
| Skill | Description |
|-------|-------------|
| `email-writer` | Draft professional emails from natural language |
| `summarizer` | Condense long content into clear key points |
| `translator` | Translate text between languages with tone preservation |

### 💻 Dev & Tech
| Skill | Description |
|-------|-------------|
| `code-reviewer` | Review code for bugs, style, and security issues |
| `bug-finder` | Identify and fix bugs with root cause analysis |
| `api-caller` | Structure and debug API requests across protocols |

### 🧠 Reasoning
| Skill | Description |
|-------|-------------|
| `decision-maker` | Weigh options and deliver clear recommendations |
| `planner` | Break goals into sequenced action plans |
| `fact-checker` | Verify claims and assess source credibility |

### 💰 Finance & DeFi
| Skill | Description |
|-------|-------------|
| `portfolio-analyzer` | Assess investment allocation and diversification |
| `defi-navigator` | Guide through DeFi protocols and yield strategies |
| `on-chain-reader` | Interpret NEAR blockchain data and transactions |

### 📊 Market Analysis
| Skill | Description |
|-------|-------------|
| `chart-reader` | Interpret candlesticks, patterns, and S/R levels |
| `indicator-analyst` | Read RSI, MACD, Bollinger Bands, moving averages |
| `trend-detector` | Identify bull/bear trends, breakouts, reversals |

### 📰 Sentiment & News
| Skill | Description |
|-------|-------------|
| `market-sentiment` | Gauge fear/greed, social sentiment, funding rates |
| `alpha-hunter` | Spot early signals from whale moves and on-chain data |
| `news-trader` | React to market-moving news with directional ideas |

### ⚙️ Strategy
| Skill | Description |
|-------|-------------|
| `trade-planner` | Build complete trade plans with entry, stop, and target |
| `risk-manager` | Position sizing, R:R ratios, drawdown rules |
| `dca-strategist` | Dollar cost averaging plans for long-term accumulation |

### 🔁 Execution (planning-only)
| Skill | Description |
|-------|-------------|
| `order-builder` | Structure limit, market, and stop orders correctly |
| `defi-trader` | Guide token swaps on DEXs with optimal routing |
| `arbitrage-spotter` | Identify price differences across exchanges |

### 🐸 Memecoin Trading
| Skill | Description |
|-------|-------------|
| `memecoin-scanner` | Spot early memecoins with volume and social signals |
| `rug-detector` | Identify honeypots, unlocked liquidity, dev wallet risks |
| `memecoin-entry` | Time memecoin entries using momentum signals |
| `memecoin-exit` | Know when to take profit or cut losses |

### 🎯 Polymarket
| Skill | Description |
|-------|-------------|
| `market-researcher` | Deep research on prediction market questions |
| `odds-analyzer` | Identify mispriced markets and find value bets |
| `event-tracker` | Monitor events that move prediction probabilities |
| `position-manager` | Size, scale, hedge, and exit Polymarket positions |

### 📈 Perps Trading
| Skill | Description |
|-------|-------------|
| `perps-setup` | Leverage selection and liquidation price calculator |
| `funding-rate-watcher` | Track funding rates to time long/short entries |
| `liquidation-hunter` | Spot liquidation clusters and trade around them |
| `perps-risk-manager` | Max leverage rules, position sizing, drawdown limits |

### 🧬 Learning & Meta
| Skill | Description |
|-------|-------------|
| `trade-memory` | Log trade decisions and analyze win rates by signal |
| `self-critique` | Evaluate reasoning quality before and after trades |

### 📡 Community
| Skill | Description |
|-------|-------------|
| `telegram-digest` | Summarize last 24hrs of Telegram group activity |

---

## 🛠️ Tool Proposals

Specs for image generation tools pending Rust/WASM implementation:

| Tool | Description | Auth |
|------|-------------|------|
| `dalle` | Generate images via OpenAI DALL-E 3 | OPENAI_API_KEY |
| `pollinations` | Generate images via Pollinations.ai | None — free |

Looking for a Rust/WASM developer to build these. Open an issue or reach out on IronClaw Discord.

---

## 🚀 Install

```bash
# Clone the repo
git clone https://github.com/Eearnest/tall-fox-skills.git
cd tall-fox-skills

# Run the installer
bash install-skills.sh
```

The script creates the correct folder structure and copies all skills into `~/.ironclaw/skills/`.

---

## 📋 IronHub PRs

Skills submitted to the official [nearai/ironhub](https://github.com/nearai/ironhub) registry:

| PR | Skills | Status |
|----|--------|--------|
| [#150](https://github.com/nearai/ironhub/pull/150) | 42 skills (original batch) | Closed — split per reviewer |
| [PR A](#) | 14 read-only informational skills | Open — under review |
| [PR B](#) | 11 planning-only trading skills | Open — under review |
| PR C | Execution skills | Waiting for IronClaw execution runtime |

---

## 🤝 Contributing

Found a bug in a skill? Want to improve one?

1. Fork this repo
2. Edit the skill `.md` file
3. Open a PR with what you changed and why

---

## 📄 License

MIT — free to use, modify, and distribute.

---

## 👤 Author

**Earnest** — NEAR Legion Nigeria community builder
- GitHub: [@Eearnest](https://github.com/Eearnest)
- Telegram: [Modify](https://t.me/mod_ify)
- IronClaw skills contributor: [nearai/ironhub](https://github.com/nearai/ironhub)
