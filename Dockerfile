FROM mcr.microsoft.com/dotnet/framework/aspnet
WORKDIR /inetpub/wwwroot
# Copy everything
COPY . /inetpub/wwwroot

