FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019 AS base
ARG source
WORKDIR /inetpub/wwwroot
COPY ${source:-obj/docker/publish} .
