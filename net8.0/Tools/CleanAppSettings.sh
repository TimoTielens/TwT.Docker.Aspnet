echo "Cleaning up the appsettings files"
echo "Paramater is '$1'"
echo "Only appsettings.json and appsettings.$1.json should be kept"

mkdir tempsettings
mv appsettings.*.json tempsettings

mv tempsettings/appsettings.$1.json appsettings.$1.json
rm -rf tempsettings