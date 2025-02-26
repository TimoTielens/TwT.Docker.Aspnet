echo "Adding private NuGet feed"
echo "Username is '$1'"
echo "Password is '$2'"
echo "source is '$3'"

Username=$1
Password=$2
Source=$3

dotnet nuget add source "${Source}" \
      --name "privateFeed" \
      --username "${Username}" \
      --password "${Password}" \
      --store-password-in-clear-text; \
      dotnet nuget list source; \