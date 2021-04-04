
#property copyright "Raphael lins"
#property link      "https://pisoms.com"
#property version   "1.00"
#property indicator_chart_window


int OnInit()
  {

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

