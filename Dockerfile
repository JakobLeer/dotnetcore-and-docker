FROM mcr.microsoft.com/dotnet/core/aspnet:3.1

COPY dist /app

COPY node_modules/node-wait-for-it/bin/wait-for-it /app/wait-for-it.sh

RUN chmod +x /app/wait-for-it.sh

WORKDIR /app

EXPOSE 80

ENV WAITHOST=mysql WAITPORT=3306

ENTRYPOINT ./wait-for-it.sh $WAITHOST:$WAITPORT --timeout=0 \
    && exec dotnet ExampleApp.dll
