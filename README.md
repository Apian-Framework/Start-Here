# Start-Here

## About Apian

>Apian is a blockchain-compatible code framework and protocol for the management of shared data in highly interactive multi-user applications - games in particular. Apian is complete, flexible, and extensible, and provides a developer the ability to go from idea to prototype without having to spend 2/3 of her time on support infrastructure.

Clear as mud, right? [Check here](https://apian-framework.github.io/Start-Here/) for a more complete overview.



## TLDR; I just want to build and run something...

While you can certainly build the Apian .NET support libraries, they don't *do* anything by themselves and so it wouldn't be very much fun.

Your best bet is to clone the [source release repo](https://github.com/Apian-Framework/Beam-Releases) for the Beam demo application. The you can select a release branch and build and run the Beam.Cli console version of the app, or if you have Unity 3D installed you can build and run Beam.Unity.

But if you really do just want to fetch and build the Apian Framework repositories individually, look [here](install/README.md)

## What *are* all of these repositories?

---
### Start-Here
The repo you are looking at right now.

---
### **P2pNet**
P2pNet is intended to be a relatively easy-to-use peer-to-peer networking layer the can "ride on top of" any number of network protocols. P2pNet presents a relatively limited pubsub-style messaging API to the app developer that does not change with the selected carrier protocol. Includes as subprojects `P2pNet.ActiveMq`, `P2pNet.Mqtt`, and `P2pNet.Redis` carrier shims.

---
### **Apian.Net**
This is the real guts of the Apian Framework, and defines the architectures and protocols required to allow peers to form game-state-management consensus groups that are not locked-in to any particular protocol or network layer.

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


