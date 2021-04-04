
#property copyright "Raphael lins"
#property link      "https://pisoms.com"
#property version   "1.00"
#property indicator_chart_window

int OnInit()
  {

  int file = FileOpen("FileTest.txt", FILE_COMMON|FILE_TXT|FILE_REWRITE);

  string file_content = FileReadString(file);

  Print(file_content);

  FileWrite(file, "Line 1")
  FileWrite(file, "Line 2");
  FileWrite(file, "Line 3");

  FileClose(file);

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

