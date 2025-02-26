echo "Adding private NuGet feed"
echo "Username is '$1'"
echo "Password is '$2'"

dotnet nuget add source "$NUGET_FEED_URL" \
      --name "privateFeed" \
      --username "$1" \
      --password "$2" \
      --store-password-in-clear-text;
dotnet nuget list source;