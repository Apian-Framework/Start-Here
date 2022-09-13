
# Hidden Information

In multiplayer games it's common for there to be information relevant to play that is not visible to one of more of the players. When people are playing together in-person this typically takes the form of cards or tiles positioned so that other players can't see them, or perhaps a shroud over a game piece that hides the direction it is facing after a player rotates it.

In all of these cases security against cheating is guaranteed by the players themselves: watching one another to ensure that all manipulation of game pieces or cards is done legally, and also that no one sneaks a peek at anything that by rule should be invisible.  If at any point all but one of the players goes to the kitchen to get snacks this security is of course broken.

>   Note: In the popular game Battleship, which is a prime example of a "meat space" game built around hidden information, this guarantee does not hold. It is possible for a player to play an entire game without having placed any ships. The deceit will almost certainly be discovered at the end of the game, but it can't be prevented during play.

In some cases there is data that none of the players can see. A face-down shuffled deck of cards is probably the most common example. Everyone can see that it was shuffled properly (quite possibly everyone had a hand in shuffling it) and all can see that no one has had an opportunity to see any of the cards. But no one has any idea of the suit and rank of the top card in the deck.


### About "Hidden"
Actually, before going any further there is a clarification that must be made: in all of the above examples the terms _see_ and _hidden_ have been used too loosely. In actual fact, **All** of the objects (tiles, cards, game pieces) can always be seen by everyone in the physical sense. When they have been said to be "hidden" what is actually meant is that they are concealing an internal property or properties - the _objects_ themselves are always visible to everyone. The ability to conceal an object's property is inherent in the construction of the object itself. Poker can't be played with spherical "cards".

While the construction of a single-sided playing card is about as simple as can be imagined, it is what makes possible these mechanisms necessary to play:

 - A card can be manipulated to conceal or reveal its content
 - A concealed card can be moved positionally without revealing its state
 - An observer can always see when a card is being manipulated or moved
 - ~~A deck of concealed cards can be mixed in such a manner that an observer can verify it's been done and even the person doing the shuffling won't know the resulting order.~~

In addition to card- and tile-like objects with immutable internal state, physical game pieces can also be purpose-built with clever mechanisms to allow a player to manipulate the state of a piece (orientation, perhaps) while it is concealed.  "Pursuit" by Aurora was a good example back in the 1970's: https://thetoystimeforgot.com/product/aurora-pursuit-game/  <br> In it, a player's "turn" consists of revealing a plane's orientation, moving it in the appropriate direction, then concealing and changing (or not) its orientation. The playing pieces are constructed with a knob that allows a player to rotate the plane, and an opaque shroud that allows the orientation to be revealed to, or concealed from the other player.

The actual point to all of this is that in these in-person examples, even though there is information that is concealed from one or more players, the actual "game state" is fully public and visible to all players. Hidden information is latent in the configuration or structure of the data objects themselves. There is no private game state - data objects of which any of he players are unaware. A "card up someone's sleeve," for instance.

_[ This is awfully close to being a stupid semantic nothing-of-a-point. I'm having a difficult time articulating what I think is interesting/important here. It has to do with the idea that even with the concealment, all of the players are able to satisfy themselves that the game is being played fairly because they have watched all manipulation and movement of the game objects. I'll fix it. ]_

### In a Decentralized Online Game
<br />

> In centralized, server-based, online game all of this is nearly trivial - the server acts as an omniscient and all-powerful "game master" and holds _all_ of the game object state internally, as **private** data, and reveals different bits of it to different players as gameplay progresses.

<br />
In the most common architecture for a decentralized online game every peer (participant computer) has a local copy of the public game state. Ensuring that every peer has an identical copy of the state is one of the major challenges in creating a game of this sort, but that is not the issue here. So assume every peer always has an identical copy of the public game state.







