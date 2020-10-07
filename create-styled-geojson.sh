#!/bin/bash

echo "Initializing ..."
rm -f styled_los.geojson
rm -f count.txt

echo "Merging GeoJSON for each result..."
npx geojson-merge geojson/*_true.geojson > combined_true.geojson
npx geojson-merge geojson/*_false.geojson > combined_false.geojson

echo "Create styled GeoJSON ..."
LF=$'\\\x0A'
sed -i -e 's/"properties": {/"properties": {'"$LF"'        "marker-color":"rgba(242, 254, 0, 0.67)",/g' combined_true.geojson
sed -i -e 's/"properties": {/"properties": {'"$LF"'        "marker-color":"rgba(0, 0, 0, 0.4)",/g' combined_false.geojson

echo "Merge GeoJSON ..."
npx geojson-merge combined_true.geojson combined_false.geojson > styled_los.geojson
rm -f combined*.geojson
rm -f combined*.geojson-e

echo "Count each result ..."

touch count.txt

echo 'LOS:True' >> count.txt
grep -o -i LOS:True styled_los.geojson | wc -l >> count.txt
echo 'LOS:False' >> count.txt
grep -o -i LOS:False styled_los.geojson | wc -l >> count.txt

echo "Done"



