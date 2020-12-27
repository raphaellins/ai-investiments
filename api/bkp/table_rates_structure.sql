CREATE TABLE "rates" (
	"value"	REAL,
	"id"	INTEGER NOT NULL,
	"log"	TEXT,
	"open"	REAL,
	"high"	REAL,
	"low"	REAL,
	"close"	REAL,
	"tick_volume"	REAL,
	"spread"	REAL,
	"real_volume"	REAL,
	"time"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
)