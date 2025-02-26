Username=$1
Password=$2
Source=$3

echo "Adding private NuGet feed"
echo "Username is '${Username}'"
echo "Password is '${Password}'"
echo "source is '${Source}'"

dotnet nuget add source "'$Source'" \
      --name "privateFeed" \
      --username "'$Username'" \
      --password "'$Password'" \
      --store-password-in-clear-text; \
      dotnet nuget list source; \