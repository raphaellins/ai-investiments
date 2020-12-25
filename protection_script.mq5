#property copyright "Raphael lins"
#property link      "https://pisoms.com"
#property version   "1.00"
#property indicator_chart_window


string account_name;
string owner_name = "Raphael lins araujo";

enum accounts_{
   account_clear = 100876651, //100876651
   account_test = 100876652   //100876652
};


input accounts_ InputConta = account_clear;

int OnInit()
  {

  account_name = AccountInfoString(ACCOUNT_NAME);


  if( account_name != owner_name){
      Alert("Wrong user");
  }


  //verify the account number
  if (AccountInfoInteger(ACCOUNT_LOGIN) != InputConta){
      Alert("Invalid user");

      return(INIT_FAILED);
  }

   return(INIT_SUCCEEDED);
  }


int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {

   return(rates_total);
  }

