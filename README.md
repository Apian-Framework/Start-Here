# Start-Here

## About Apian


The Apian Framework is a collection of code libraries, protocols, and example application code intended as an example of how a fully decentralized online multiplayer game can be anchored by a public blockchain but have the participating machines themselves be responsible for running the game logic and managing the collective game state. Under Apian, game application instances create a peer-to-peer consensus network and collectively perform game event validation and sequencing, resulting in a uniform view of the game state across all peers.

Most multiplayer blockchain-connected games focus on the use and transfer of tokens and are not overly concerned about decentralized gameplay, typically using traditional client/server architectures with centralized game servers. Other games that do strive to be fully decentralized generally do so being "fully on-chain" - putting all of the game logic and state in on-chain contracts so there is no single entity that owns or executes any of it.

By moving the game code and state data from the public blockchain to the participant computers themselves Apian alleviates many of the difficulties and constraints that result from having them on-chain without having to rely on special-purpose chains or level 2 solutions. In fairness, Apian is not some kind of all-purpose perfect solution to decentralizing games, it is instead simply a different approach that trades some of the difficulties faced by fully on-chain games for different ones. The idea is that this will allow for different sorts of games to be decentralized, particularly ones that involve player interaction at a higher frequency than is practical or affordable on-chain.

 Apian is complete, flexible, and extensible, and provides a developer the ability to go from idea to prototype without having to spend 2/3 of her time on support infrastructure.


## TLDR; I just want to build and run something...

While you can certainly build the Apian .NET support libraries, they don't *do* anything by themselves and so it wouldn't be very much fun.

Your best bet is to clone the [source release repo](https://github.com/Apian-Framework/Beam-Releases) for the Beam technology demo application. Then you can select a release branch and build and run either the Beam.Cli console version of the app or, if you have Unity 3D installed, you can build and run Beam.Unity.

But if you really do just want to fetch and build the Apian Framework repositories individually, look [here](install/README.md)

## What *are* all of these repositories?

---
### [**Start-Here**](https://github.com/Apian-Framework/Start-Here)
The repo you are looking at right now.

---
### **Apian.Net**
This is the real guts of the Apian Framework, and defines the architectures and protocols required to allow peers to form game-state-management consensus groups that are not locked-in to any particular protocol or network layer.


---
### **P2pNet**
P2pNet is intended to be a relatively easy-to-use peer-to-peer networking layer the can "ride on top of" any number of network protocols. P2pNet presents a relatively limited pubsub-style messaging API to the app developer that does not change with the selected carrier protocol. Includes as subprojects `P2pNet.ActiveMq`, `P2pNet.Mqtt`, and `P2pNet.Redis` carrier shims.

---
### **ApianCrypto**
Provides an EVM-compatible crypto and blockchain API for Apian applications. Probably too verbose and trying way too hard to be generic in ways that might not really be helpful.

---
### **UniLog**
A Unity-compatible - or not - per-subsystem based logging facility.

---
### **NotUnityEngine**
A plugin replacing the `UnityEngine` library for non-Unity applications that want to use unity3D types and math functions.

---
### **ApianAppUtils**
A simple library to support modal game code with stack-based transitions.

---
### **BeamGameCode**
Platform-independent code forming the core of an Apian-based free-running simulator test/demo/game.

---
### **Beam.Cli**
A console driver and frontend that together with BeamGameCode makes a cli version of the game suitable for testing or headless execution.

---
### **Beam.Unity**
A Unity 3D version of Beam. Network interoperable with Beam.Cli.

---
### **Beam-Releases**
Trying a different approach to the monorepo, multi-repo tangle for an app dependent on a bunch of still-in-development libraries.

---
### **MqttJS-Unity**
A Unity plugin providing Mqtt connectivity for browser-hosted WASM builds.

---
### **Libp2p-Unity**
A Unity plugin providing libp2p connectivity for browser-hosted WASM builds.

---
### **Apian-CI-Badges**
Used as a place to store build and testing badges for github action-based CI flows. Mostly works pretty well.

---
### **Jupyter-Notebooks**
A repo to host Jupyter notebooks referenced by docs in the Start-Here repo: https://github.com/Apian-Framework/Start-Here/blob/main/notes/HiddenData.md

---
### **Ace**
An example of a turn-based 2-player Apian demo, intended to act as a foil to Beam, but that has fallen woefully behind.


