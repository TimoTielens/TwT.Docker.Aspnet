<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->

- [TwT.Docker.Aspnet](#twtdockeraspnet)
- [Usage](#usage)
   * [Building from scratch](#building-from-scratch)

<!-- TOC end -->

<!-- TOC --><a name="twtdockeraspnet"></a>
# TwT.Docker.Aspnet
Docker Image for running ASP.NET applications in docker. This extension on the container is very small. It just makes sure that nano is installed so that there is an text editor in the container. Besides this it also adds curl to the container

<!-- TOC --><a name="usage"></a>
# Usage
This container itself doesn't do that much itself because there is no code deployed to it yet. See the dockerfile below as an example how this image can be used

    FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:8.0.11 AS build
    ARG TARGETARCH
    WORKDIR /source
    
    # copy csproj and restore as distinct layers
    COPY aspnetapp/*.csproj .
    RUN dotnet restore -a $TARGETARCH
    
    # copy and publish app and libraries
    COPY aspnetapp/. .
    RUN dotnet publish -a $TARGETARCH --no-restore -o /app
    
    # final stage/image
    FROM timotielens/aspnet:8.0.11
    EXPOSE 8080
    WORKDIR /app
    COPY --from=build /app .
    USER $APP_UID
    ENTRYPOINT ["./aspnetapp"]

<!-- TOC --><a name="building-from-scratch"></a>
## Building from scratch
If you would like to build this container from scratch, you can use the following steps:

1. Clone this repo locally and open a console in the root folder
2. Open the correct folder of the version that you would like to build. E.G if you want to build the latest version of .NET 8 you need to open the folder ".net8.0"
3. Run the following command to build the container **docker build --build-arg BUILD_DATE=2024-12-04 -t timotielens/aspnet:8.0.11 .**
4. You can now run the following command to have it running locally. **docker run -p 8080:8080 timotielens/aspnet:8.0.11**
5. If you want to push it for some reason to hub.docker.com you first need to make sure that you're logged in, by running **Run docker login -u timotielens**. Once you're logged in you can push the container by running **docker push timotielens/aspnet:8.0.11**