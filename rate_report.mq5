
#property copyright "Raphael lins"
#property link      "https://pisoms.com"
#property version   "1.00"

   static datetime last_time=0;
      MqlRates velas[];
   MqlTick tick;


  int OnInit()
  {

        CopyRates(_Symbol,_Period,0,4,velas);
      ArraySetAsSeries(velas,true);

   return(INIT_SUCCEEDED);
  }

  void OnDeinit(const int reason)
  {


  }

  void OnTick()
  {
   bool newCandle = hasNewCandle();

   if(newCandle){
      //Get rates info from last candle

      CopyRates(_Symbol,_Period,0,4,velas);
      ArraySetAsSeries(velas,true);

      SymbolInfoTick(_Symbol,tick);

      //Last candle
      MqlRates previousCandle =  velas[1];


      //Send Report


   }

  }

   bool hasNewCandle()
   {

      datetime lastbar_time= (datetime) SeriesInfoInteger(Symbol(),Period(),SERIES_LASTBAR_DATE);

      if(last_time==0){
         last_time=lastbar_time;
         return(false);
      }

      if(last_time!=lastbar_time){
         last_time=lastbar_time;
         return(true);
      }

      return(false);
  }


  void sendReport(){

     string cookie=NULL,headers;
      char   post[],result[];
      string url="https://finance.yahoo.com";

      int res=WebRequest("GET",url,cookie,NULL,500,post,0,result,headers);

      Print("Verifying response...");

       if(res==-1)
        {
         Print("Error in WebRequest. Error code  =",GetLastError());
         MessageBox("Add the address '"+url+"' to the list of allowed URLs on tab 'Expert Advisors'","Error",MB_ICONINFORMATION);
        }
      else
        {
         if(res==200)
           {
            PrintFormat("The file has been successfully downloaded, File size %d byte.",ArraySize(result));
           }
         else
            PrintFormat("Downloading '%s' failed, error code %d",url,res);
        }



  }

