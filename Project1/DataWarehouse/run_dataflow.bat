//GRESA

@echo off
mysql -u gresah -psaythename17 < "C:\Users\dell\Downloads\dataflow_job.sql"
echo Dataflow executed successfully at %date% %time% >> "C:\Users\dell\Documents\dataflow_log.txt"
