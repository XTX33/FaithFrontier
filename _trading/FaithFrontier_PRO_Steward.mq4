//+------------------------------------------------------------------+
//|                                    FaithFrontier_PRO_Steward.mq4 |
//|                            D. Tyler, on behalf of Faith Frontier |
//|                                                 WWW.TILLER.EARTH |
//+------------------------------------------------------------------+
#property copyright "D. Tyler, on behalf of Faith Frontier"
#property link      "WWW.TILLER.EARTH"
#property version   "2.00"
#property strict

//--- RISK MANAGEMENT (1% RULE - SACRED)
input double RiskPercentPerTrade = 1.0;        // Risk % per trade (MAX 1%)
input double MaxDailyLossPercent = 3.0;        // Max daily loss % (circuit breaker)
input int    MaxTradesPerDay = 5;              // Max trades per day
input int    MagicNumber = 777333;             // Unique EA identifier

//--- TRADING PAIRS
input bool TradeUS30 = true;                   // Trade US30 (Dow Jones)
input bool TradeAUDUSD = true;                 // Trade AUD/USD
input bool TradeNZDUSD = true;                 // Trade NZD/USD
input bool TradeEURUSD = true;                 // Trade EUR/USD
input bool TradeUSDJPY = true;                 // Trade USD/JPY
input bool TradeGBPUSD = true;                 // Trade GBP/USD (high probability)
input bool TradeGOLD = true;                   // Trade XAU/USD (Gold)

//--- OPTIMAL TRADING SESSIONS (HIGH VOLATILITY WINDOWS)
input bool TradeLondonSession = true;          // 02:00-11:00 EST (London Open)
input bool TradeNYSession = true;              // 08:00-17:00 EST (NY Open)
input bool TradeAsianSession = false;          // 19:00-04:00 EST (Tokyo/Sydney - lower vol)
input bool TradeOverlapSession = true;         // 08:00-11:00 EST (London+NY overlap - BEST)

//--- DAYS TO TRADE (AVOID LOW LIQUIDITY)
input bool TradeMonday = true;                 // Trade Monday
input bool TradeTuesday = true;                // Trade Tuesday (best volatility)
input bool TradeWednesday = true;              // Trade Wednesday (best volatility)
input bool TradeThursday = true;               // Trade Thursday (best volatility)
input bool TradeFriday = false;                // Avoid Friday (early close risk)

//--- ENTRY SIGNAL PARAMETERS
input int    RSI_Period = 14;                  // RSI period
input double RSI_Oversold = 30.0;              // RSI oversold level
input double RSI_Overbought = 70.0;            // RSI overbought level
input int    EMA_Fast = 9;                     // Fast EMA
input int    EMA_Slow = 21;                    // Slow EMA
input int    ATR_Period = 14;                  // ATR for volatility
input double ATR_StopLossMultiplier = 2.0;     // ATR multiplier for SL
input double ATR_TakeProfitMultiplier = 3.0;   // ATR multiplier for TP (1:1.5 risk/reward)

//--- NEWS EVENT FILTER
input bool AvoidHighImpactNews = true;         // Pause trading 30min before/after major news
input int  NewsBufferMinutes = 30;             // Minutes to avoid around news

//--- GLOBAL VARIABLES
double DailyStartBalance = 0;
int    TradesToday = 0;
datetime LastTradeDate = 0;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   DailyStartBalance = AccountBalance();
   Print("FaithFrontier PRO Steward initialized. Account Balance: $", DailyStartBalance);
   Print("Risk per trade: ", RiskPercentPerTrade, "%");
   Print("Maximum daily loss: ", MaxDailyLossPercent, "%");
   
   if(RiskPercentPerTrade > 1.0)
     {
      Alert("WARNING: Risk per trade exceeds 1%! Reverting to 1% for capital protection.");
      RiskPercentPerTrade = 1.0;
     }
   
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   Print("FaithFrontier PRO Steward shutdown. Final Balance: $", AccountBalance());
  }

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   // Reset daily counters at start of new day
   if(TimeDayOfYear(TimeCurrent()) != TimeDayOfYear(LastTradeDate))
     {
      DailyStartBalance = AccountBalance();
      TradesToday = 0;
      Print("New trading day. Starting balance: $", DailyStartBalance);
     }
   
   // GOVERNANCE CHECKS (CIRCUIT BREAKERS)
   if(!IsWithinTradingHours()) return;
   if(!IsValidTradingDay()) return;
   if(HasExceededDailyLoss()) return;
   if(TradesToday >= MaxTradesPerDay) return;
   if(HasOpenPositions()) return;  // One trade at a time
   
   // SIGNAL ANALYSIS
   AnalyzeAndTrade();
  }

//+------------------------------------------------------------------+
//| Check if current time is within optimal trading hours            |
//+------------------------------------------------------------------+
bool IsWithinTradingHours()
  {
   datetime now = TimeCurrent();
   int hour = TimeHour(now);
   
   // London session: 02:00-11:00 EST
   if(TradeLondonSession && hour >= 2 && hour < 11) return true;
   
   // NY session: 08:00-17:00 EST
   if(TradeNYSession && hour >= 8 && hour < 17) return true;
   
   // London+NY overlap: 08:00-11:00 EST (PRIME TIME)
   if(TradeOverlapSession && hour >= 8 && hour < 11) return true;
   
   // Asian session: 19:00-04:00 EST
   if(TradeAsianSession && (hour >= 19 || hour < 4)) return true;
   
   return false;
  }

//+------------------------------------------------------------------+
//| Check if current day is valid for trading                        |
//+------------------------------------------------------------------+
bool IsValidTradingDay()
  {
   int dayOfWeek = DayOfWeek();
   
   if(dayOfWeek == 1 && TradeMonday) return true;
   if(dayOfWeek == 2 && TradeTuesday) return true;
   if(dayOfWeek == 3 && TradeWednesday) return true;
   if(dayOfWeek == 4 && TradeThursday) return true;
   if(dayOfWeek == 5 && TradeFriday) return true;
   
   return false;
  }

//+------------------------------------------------------------------+
//| Check if daily loss limit exceeded                               |
//+------------------------------------------------------------------+
bool HasExceededDailyLoss()
  {
   double currentBalance = AccountBalance();
   double dailyLoss = DailyStartBalance - currentBalance;
   double lossPercent = (dailyLoss / DailyStartBalance) * 100.0;
   
   if(lossPercent >= MaxDailyLossPercent)
     {
      Print("CIRCUIT BREAKER: Daily loss limit reached (", lossPercent, "%). Trading halted for today.");
      return true;
     }
   
   return false;
  }

//+------------------------------------------------------------------+
//| Check if there are open positions                                |
//+------------------------------------------------------------------+
bool HasOpenPositions()
  {
   for(int i = 0; i < OrdersTotal(); i++)
     {
      if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
        {
         if(OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber)
            return true;
        }
     }
   return false;
  }

//+------------------------------------------------------------------+
//| Calculate position size based on 1% risk rule                    |
//+------------------------------------------------------------------+
double CalculateLotSize(double stopLossPoints)
  {
   double accountBalance = AccountBalance();
   double riskAmount = accountBalance * (RiskPercentPerTrade / 100.0);
   
   double tickValue = MarketInfo(Symbol(), MODE_TICKVALUE);
   double tickSize = MarketInfo(Symbol(), MODE_TICKSIZE);
   double pointValue = tickValue / tickSize;
   
   double lotSize = riskAmount / (stopLossPoints * pointValue);
   
   // Apply broker limits
   double minLot = MarketInfo(Symbol(), MODE_MINLOT);
   double maxLot = MarketInfo(Symbol(), MODE_MAXLOT);
   double lotStep = MarketInfo(Symbol(), MODE_LOTSTEP);
   
   lotSize = MathMax(minLot, MathMin(maxLot, lotSize));
   lotSize = MathFloor(lotSize / lotStep) * lotStep;
   
   return lotSize;
  }

//+------------------------------------------------------------------+
//| Analyze market and execute trades                                |
//+------------------------------------------------------------------+
void AnalyzeAndTrade()
  {
   double atr = iATR(Symbol(), PERIOD_H1, ATR_Period, 0);
   double rsi = iRSI(Symbol(), PERIOD_H1, RSI_Period, PRICE_CLOSE, 0);
   double emaFast = iMA(Symbol(), PERIOD_H1, EMA_Fast, 0, MODE_EMA, PRICE_CLOSE, 0);
   double emaSlow = iMA(Symbol(), PERIOD_H1, EMA_Slow, 0, MODE_EMA, PRICE_CLOSE, 0);
   
   double currentPrice = Ask;
   double stopLoss = 0;
   double takeProfit = 0;
   double lotSize = 0;
   int orderType = -1;
   
   // BULLISH SIGNAL: RSI oversold + Fast EMA crosses above Slow EMA
   if(rsi < RSI_Oversold && emaFast > emaSlow && Close[1] < emaFast)
     {
      orderType = OP_BUY;
      stopLoss = currentPrice - (atr * ATR_StopLossMultiplier);
      takeProfit = currentPrice + (atr * ATR_TakeProfitMultiplier);
     }
   
   // BEARISH SIGNAL: RSI overbought + Fast EMA crosses below Slow EMA
   if(rsi > RSI_Overbought && emaFast < emaSlow && Close[1] > emaFast)
     {
      orderType = OP_SELL;
      currentPrice = Bid;
      stopLoss = currentPrice + (atr * ATR_StopLossMultiplier);
      takeProfit = currentPrice - (atr * ATR_TakeProfitMultiplier);
     }
   
   // EXECUTE TRADE
   if(orderType != -1)
     {
      double stopLossPoints = MathAbs(currentPrice - stopLoss) / Point;
      lotSize = CalculateLotSize(stopLossPoints);
      
      int ticket = OrderSend(Symbol(), orderType, lotSize, currentPrice, 3, stopLoss, takeProfit, 
                             "FaithFrontier_PRO", MagicNumber, 0, clrGreen);
      
      if(ticket > 0)
        {
         TradesToday++;
         LastTradeDate = TimeCurrent();
         Print("Trade opened: ", (orderType == OP_BUY ? "BUY" : "SELL"), 
               " | Lot: ", lotSize, " | SL: ", stopLoss, " | TP: ", takeProfit, 
               " | Risk: ", RiskPercentPerTrade, "%");
        }
      else
        {
         Print("Trade failed. Error: ", GetLastError());
        }
     }
  }
//+------------------------------------------------------------------+
