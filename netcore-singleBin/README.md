
This will create a single file with the whole app and runtime:

    $ dotnet publish -r osx-x64  -c Release -o ./dist/

It means it can run on any osx-x64 (Minimum OS version is macOS 10.12 Sierra) WITHOUT any dotnet-core lib installed.

To execute:

    $ ./dist/hello

To clean the build:

    $ rm -r dist obj bin

Links:

1. https://www.talkingdotnet.com/create-trimmed-self-contained-executable-in-net-core-3-0/
1. https://docs.microsoft.com/en-us/dotnet/core/rid-catalog