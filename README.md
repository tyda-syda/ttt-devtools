# TTT-DEVTOOLS

Structure:

    ttt-gateway: Entrypoint (10000 port by default) to aplication, configures routing rules
    ttt-eureka: Service registration and discovery
    ttt-session: Creates and manages game sessions
    ttt-engine: Manages game board state and it's moves
    ttt-models: Decoupled models, requests, excceptions, etc.
    ttt-ui: Simple react ui to display game flow
    ttt-devtools: Build and start application locally in Docker

Requirements to run:

    Docker (docker executable must be located in $PATH)
    For some Linux distros Docker Compose might be shipped separately from Docker itself
    UNIX env capable to run sh script, MacOS, Linux, etc. (Windows won't do, unless you'll use WSL or MinGW)

Regular flow:

    Create session - POST http://localhost:10000/sessions/v1 (later on ttt-engine will check if it exists)
    Get session (optionally) - GET http://localhost:10000/sessions/v1/SESSION_ID
    Start session - GET http://localhost:10000/sessions/v1/SESSION_ID/simulate (will return SSE stream)
    Make moves - POST http://localhost:10000/engine/v1/games/SESSION_ID/move (is done by ttt-session until draw or win)

How to run:

    This repo must be in the same folder as other repos in order to run correctly.
    
    You need to start docker daemon an run './start.sh'

Order of services startup:

    ttt-eureka
    ttt-engine
    ttt-session
    ttt-gateway
