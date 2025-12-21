# FaithFrontier PRO Steward - Trading Guide

## 🛡️ GOVERNANCE PRINCIPLES
**SACRED RULE: Never risk more than 1% of capital per trade**

## 📊 Supported Pairs
- US30 (Dow Jones Index)
- AUD/USD (Australian Dollar)
- NZD/USD (New Zealand Dollar)
- EUR/USD (Euro)
- USD/JPY (Japanese Yen)
- GBP/USD (British Pound)
- XAU/USD (Gold)

## ⏰ Optimal Trading Times (EST)
### BEST: London+NY Overlap (08:00-11:00 EST)
- Highest liquidity and volatility
- Tightest spreads
- Most reliable signals

### London Session (02:00-11:00 EST)
- Major European market moves
- High volume on EUR, GBP pairs

### New York Session (08:00-17:00 EST)
- USD pairs most active
- US economic data releases

### Asian Session (19:00-04:00 EST) - OPTIONAL
- Lower volatility
- Best for AUD/USD, NZD/USD, USD/JPY

## 📅 Best Trading Days
- **Tuesday-Thursday**: Peak volatility and liquidity
- **Monday**: Acceptable (avoid first hour)
- **Friday**: AVOID (early closes, weekend risk)

## 🎯 Entry Strategy
### Bullish Entry
1. RSI < 30 (oversold)
2. Fast EMA (9) crosses above Slow EMA (21)
3. Price closes below EMA then bounces up

### Bearish Entry
1. RSI > 70 (overbought)
2. Fast EMA (9) crosses below Slow EMA (21)
3. Price closes above EMA then breaks down

## 📏 Risk Management (MATHEMATICAL)
```
Risk Amount = Account Balance × 1%
Stop Loss Distance = ATR × 2.0
Take Profit Distance = ATR × 3.0
Lot Size = Risk Amount ÷ (Stop Loss in Points × Point Value)
Risk/Reward Ratio = 1:1.5 (minimum)
```

## 🚨 Circuit Breakers
1. **Daily Loss Limit**: 3% max per day
2. **Max Trades**: 5 trades per day maximum
3. **One Trade Rule**: Only one position open at a time
4. **News Filter**: Pause 30min before/after high-impact news

## ⚙️ EA Parameters
- `RiskPercentPerTrade`: 1.0% (NEVER EXCEED)
- `MaxDailyLossPercent`: 3.0%
- `MaxTradesPerDay`: 5
- `ATR_StopLossMultiplier`: 2.0 (dynamic SL based on volatility)
- `ATR_TakeProfitMultiplier`: 3.0 (1:1.5 RR ratio)

## 🔧 Installation
1. Copy `FaithFrontier_PRO_Steward.mq4` to MetaTrader 4 `Experts` folder
2. Restart MT4 or compile in MetaEditor
3. Attach to chart of desired pair (H1 timeframe recommended)
4. Enable AutoTrading
5. Configure inputs (keep 1% risk rule)

## 📈 Expected Performance
- Win Rate Target: 55-65%
- Risk/Reward: 1:1.5
- Max Drawdown: <10%
- Trades per Week: 5-15 (depending on market conditions)

## ⚠️ Warnings
- ALWAYS backtest on demo account first (minimum 3 months)
- Never override 1% risk rule
- Respect circuit breakers
- Avoid trading during major news (NFP, FOMC, CPI)
- Monitor VPS uptime if running 24/7

## 📞 Support
Built by D. Tyler for Faith Frontier  
WWW.TILLER.EARTH
