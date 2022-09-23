
# Things a decentralized app needs to care about:

The assumption here is that we are talking about decentralized games that operate by having network peers with identical copies of a public "game data state" that they keep synchronized.

## Networking

A decentralized app needs peer-to-peer networking. Unfortunately, is seems that pretty much no one has any interest in developing standard P2P network infrastructure and rolling your own is probably going to be a bad idea. This is why P2pNet exists.

P2pNet is a network module that presents a pretty straightforward pub/sub-looking API to application code but that has no real "network guts" of its own - instead acting as a shim between the API and a number of different network libraries that can act as "carrier protocols" for it.

The P2pNet repo is [here](https://github.com/Apian-Framework/P2pNet) but I am woefully behind documentation-wise.

## Shared State Management

This is what [Apian](https://github.com/Apian-Framework/Apian.Net) is for. Once again, it's kinda documentation-poor at the moment, but the basic idea of separation of game code from state management is shown [here](http://apian-framework.com/)

## Persistence

What happens when the peers in a p2p network game all go away? Is the game just over? The absolute bonehead-simplest answer is simply not to let that happen. As long as it's possible to have a peer in the game that has the global state, but is not actually _playing_ (and this is required by Apian for other reasons) then as long as that peer sticks around the game state still exists.

But you really ought to be able to write it to some sort of permanent datastore. And reload/restart it, too.

## Hidden Information

Lots of games involve data that is sometimes concealed from some of the players. [Here are some thoughts on the subject.](./HiddenData.md)


## Randomness




