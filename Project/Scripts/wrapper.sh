#!/bin/bashexit

#All the below Scripts will work based on the data provided by acadgild as Data/Web/file.xml and Data/Mob/file.txt

sh /home/acadgild/Project/Scripts/start-daemons.sh

sh /home/acadgild/Project/Scripts/populate-lookup.sh

sh /home/acadgild/Project/Scripts/data_enrichment_filtering_schema.sh

sh /home/acadgild/Project/Scripts/dataformatting.sh

sh /home/acadgild/Project/Scripts/data_enrichment.sh

sh /home/acadgild/Project/Scripts/data_analysis.sh
