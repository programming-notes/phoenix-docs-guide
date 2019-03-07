# Channels
Enables soft real-time connections between millions of connected clients. Example use cases:
* Chat rooms and APIs for messaging apps
* Push notifications about breaking news.
* Tracking vehicles, trucks or race participants on a map.
* Multiplayer game events.
* Monitor sensors and light controls.
* Notify when a CSS or javascript changed.
Channels can support a variety of clients be it browsers, native app, smart watch, embedded device or any things connected to a network.

#### Connecting to a channel from a client:
Client --> Web-Socket / Long-Polling --> Phoenix Channels (For a particular Topic)

#### Routing a message from a channel to a client
```
Broadcast Signal --> Local PubSub ----< Clients
                          |
                          +------------< Remote PubSubs ---< Clients
```

#### Joining Channels
1. Authorize clients to joing a given topic.
2. Topics are created using `join/3`.
3. The responses should be:
  * {:ok, socket} - for granting access
  * {:ok, reply, socket} - grants access and a message
  * {:error, reply} - deny access



