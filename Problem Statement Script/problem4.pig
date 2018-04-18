problem 4:


REGISTER '/home/richa/Desktop/piggybank-0.11.0.jar';
 
A = load 'hdfs://localhost:9000/pig/DelayedFlights.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','NO_MULTILINE','UNIX','SKIP_INPUT_HEADER');
 
B = FOREACH A GENERATE (chararray)$17 as origin, (chararray)$18 as dest, (int)$24 as diversion;
 
C = FILTER B BY (origin is not null) AND (dest is not null) AND (diversion == 1);
 
D = GROUP C by (origin,dest);
 
E = FOREACH D generate group, COUNT(C.diversion);
 
F = ORDER E BY $1 DESC;
 
Result = limit F 10;
 
dump Result;






