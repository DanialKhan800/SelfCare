FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app
EXPOSE 80
FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY ["SelfCare.csproj", ""]
RUN dotnet restore "./SelfCare.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "SelfCare.csproj" -c Release -o /app/build
FROM build AS publish
RUN dotnet publish "SelfCare.csproj" -c Release -o /app/publish
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "SelfCare.dll"]
