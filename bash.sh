#!/bin/bash

#Extract .dcp files to .xml files
for file in *Sony\ DSC-RX100M4*.dcp; do
    dcpTool -d "$file" "${file%.dcp}.xml"
done

#Modify .xml files
sed -i '' 's/<UniqueCameraModelRestriction>Sony DSC-RX100M4<\/UniqueCameraModelRestriction>/<UniqueCameraModelRestriction>Sony DSC-RX100M5<\/UniqueCameraModelRestriction>/g' *Sony\ DSC-RX100M4*.xml

#Compile .xml files to .dcp files
mkdir -p final
for file in *Sony\ DSC-RX100M4*.xml
do
    filename=$(basename "$file" .xml)
    newname=$(echo "$filename" | sed 's/Sony DSC-RX100M4//')
    dcpTool -c "$file" "final/$newname.dcp"
done
