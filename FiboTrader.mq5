//+------------------------------------------------------------------+
//|                                                   FiboTrader.mq5 |
//|                                                     Raphael lins |
//|                                               https://pisoms.com |
//+------------------------------------------------------------------+
#property copyright "Raphael lins"
#property link      "https://pisoms.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
    int HighestCandle, LowestCandle;

    double High[], Low[];

      ArraySetAsSeries(High, true);
      ArraySetAsSeries(Low, true);

      CopyHigh(_Symbol, _Period, 0, 100, High);
      CopyHigh(_Symbol, _Period, 0, 100, Low);

      HighestCandle = ArrayMaximum(High, 0, 100);
      LowestCandle = ArrayMaximum(Low, 0, 100);

      MqlRates PriceInformation[];

      ArraySetAsSeries(PriceInformation, true);

      int Data = COpyRates(Symbol(), Period(), 0, Bars(Symbol(), Period(), PriceInformation);

      ObjectDelete(_Symbol, "Fibonacci");

      ObjectCreate(
         _Symbol,
         "Fibonacci",
         OBJ_FIBO,
         0,
         PriceInformation[100].time,
         PriceInformation[HighestCandle].high,
         PriceInformation[0].time,
         PriceInformation[LowestCandle].low
      );


      datetime DateTime0 = ObjectGetInteger(0, "Fibonacci", OBJPROP_TIME, 0);
      double PriceLevel100 = ObjectGetDouble(0, "Fibonacci", OBJPROP_PRICE, 0);
      datetime DateTime1 = ObjectGetInteger(0, "Fibonacci", OBJPROP_TIME, 1);
      double PriceLevel10 = ObjectGetDouble(0, "Fibonacci", OBJPROP_PRICE, 1 );


      double PriceLevel50 = (PriceLevel100 + PriceLevel10) * 0.5;

      Comment(
         "DateTime0: ", DateTime0, "\n",
         "DateTime1: ", DateTime1, "\n",
         "PriceLevel 0: ", priceLevel10, "\n",
         "PriceLevel 50: ", priceLevel50, "\n",
          "PriceLevel 110: ", priceLevel100, "\n"
      )

  }



void CheckFiboSignal(bool &fibo_buy, bool &fibo_sell)
{

//   fibo_buy = false;
//   fibo_sell = false;
//
//   MqlRates rates[];
//   ArraySetAsSeries(rates, true);
//
//   int start_pos = 0, count = 3;
//
//   if(CopyRates(_Symbol, 0, 0, count, rates) < count){
//
//      return;
//
//   }
//
//   double price_1 = ObjectGetDouble(0, Inp_Fibo_Object_Name, OBJPROP_PRICE, 0);
//   double price_2 = ObjectGetDouble(0, Inp_Fibo_Object_Name, OBJPROP_PRICE, 1);
//
//   if(price_1 == 0.0 || price_2 == 0.0){
//      return;
//   }
//
//   double fibo_range = price_1 - price_2;
//   fibo_1_000 = price_1;
//   fibo_0_618 = price_2 + fibo_range * 0.618;
//   fibo_0_500 = price_2 + fibo_range * 0.500;
//   fibo_0_382 = price_2 + fibo_range * 0.382;
//   fibo_0_236 = price_2 + fibo_range * 0.236;
//   fibo_0_000 = price_2;
//
//
//   if(rates[1].high < fibo_0_236){
//      fibo_buy = true;
//   }
//
//   if(rates[1].open > fibo_0_236 && rates[1].close < fibo_0_618){
//      fibo_buy = true;
//      fibo_sell = true;
//   }
//
//   if(rates[1].low > fibo_0_618){
//      fibo_sell = true;
//   }

}