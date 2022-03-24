# Build process adapted from https://docs.microsoft.com/en-us/aspnet/core/host-and-deploy/docker/building-net-docker-images?view=aspnetcore-6.0

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /source

# copy csproj and restore as distinct layers
COPY DotNetApp/*.csproj ./DotNetApp/
RUN dotnet restore ./DotNetApp

# copy everything else and build app
# Note: make sure you don't have bin/obj folders on your dev
# machine, otherwise there can be dependency issues.
COPY DotNetApp/. ./DotNetApp/
WORKDIR /source/DotNetApp
RUN dotnet publish -c release -o /app --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "DotNetApp.dll"]
