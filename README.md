# Generate-excel

This repository for learning generate file excel using apache poi.

I try to create some service for look the different among generate using list and without list.
I put logger in the log, so you can compare the method which method using less consume time.

The result of the generated file is base64.
If you want to look, the result you can convert base 64 to excel in :
https://products.aspose.app/pdf/conversion/base64-to-excel 

# Implement granafana and prometheus :
1. Download promotheus : https://prometheus.io/download/ 
   Script for running prometheus service : ./prometheus --config.file=prometheus.yml
2. Download Grafana : https://grafana.com/docs/grafana/latest/installation/mac/ 
3. Download dashboard Grafana Apm : https://grafana.com/grafana/dashboards/12900 
   Script for running garafa service : brew services start grafana 
