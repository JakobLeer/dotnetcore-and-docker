FROM mcr.microsoft.com/dotnet/core/runtime

COPY dist /app

WORKDIR /app

EXPOSE 80/tcp

ENTRYPOINT ["dotnet", "ExampleApp.dll"]
