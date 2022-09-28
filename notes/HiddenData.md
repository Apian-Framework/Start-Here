
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

In addition to card- and tile-like objects with immutable internal state, physical game pieces can also be purpose-built with clever mechanisms to allow a player to manipulate the state of a piece (orientation, perhaps) while it is concealed.  _Pursuit_ by Aurora was a good example back in the 1970's: https://thetoystimeforgot.com/product/aurora-pursuit-game/  <br> In it, a player's turn consists of revealing a plane's orientation, moving it in the appropriate direction, then concealing and changing (or not) its orientation. The playing pieces are constructed with a knob that allows a player to rotate the plane, and an opaque shroud that allows the orientation to be revealed to, or concealed from the other player.

The actual point to all of this is that in these in-person examples, even though there is information that is concealed from one or more players, the actual "game state" is fully public and visible to all players. Hidden information is latent in the configuration or structure of the data objects themselves. There is no private game state: data objects of which any of the players is unaware. A "card up someone's sleeve," for instance.

_[ This is awfully close to being a stupid semantic nothing-of-a-point. I'm having a difficult time articulating what I think is interesting/important here. It has to do with the idea that even with the concealment, all of the players are able to satisfy themselves that the game is being played fairly because they have watched all manipulation and movement of the game objects. I'll try to fix it. ]_

### In a Decentralized Online Game

> In centralized, server-based, online game all of this is nearly trivial - the server acts as an omniscient and all-powerful "game master" and holds _all_ of the game object state internally, as **private** data, and reveals different bits of it to different players as gameplay progresses.

In the most common architecture for a decentralized online game every peer (participant computer) has a local copy of the public game state. Ensuring that every peer has an identical copy of the state is one of the major challenges in creating a game of this sort, but that is not the issue here. So assume every peer always has an identical copy of the public game state.

In the above examples of board-game hidden information, security comes from having players (and potentially other people) physically present and watching the game pieces to ensure they aren't being viewed or manipulated improperly. But players in an online game cannot see what one another are doing, nor are they even "looking at" the same cards and/or game pieces. They are instead each looking at their own magically synchronized _copy_ of the game state.

> It seems to me that there is value in comparing the meat-space and online situations, but it's stretching things pretty far to try to bring them together: "everyone is in a separate room and there are elves running around carrying written notes among them..."

## Actual examples of hidden information.

### Commit-Reveal

Probably the simplest example of hidden information is when a player makes a secret, irrevocable, choice regarding an action that he will take at some time in the future. This might take the form of a card played face-down, or a number written on a slip of paper, or maybe setting the direction of an airplane hidden from an opponent's view. The player commits himself to the choice in some publicly verifiable way, but doesn't reveal the choice until later. But when the choice is "revealed" and made use of, it is no longer secret and stops being hidden information.

In order to do this as part of a non-local game is is necessary for the player to publicly produce a number, or message, or token of some sort that is uniquely related to the choice, but for which the logic of the relationship travels in one direction only: starting with the choice and ending with the token. Examining the token provides absolutely no information as the the choice. When the time comes to reveal the choice, the player is able to show how starting with the choice results in ending with the token, and is the only choice that can do so.

What this is actually describing is a _cryptographic hash function_: a mathematical function that takes a piece of data (a number, or some text, or a whole file) and transforms it into a single unique number that is completely unrelated to the input. Two different inputs that are _almost_ exactly the same will result in completely different hash values, and no two different pieces of data will ever result in the same hash. But the most important thing about cryptographic hash functions is that they only go one way: given the resulting hash value there is no possible way to calculate the input the produced it.

When the player later reveals the input for a committed hash to other players, they are able to apply the hash function to the value and verify for themselves that it does, in fact, result in the revealed value.

> It would be nice to have a reference here to a discussion of hash functions in general, and to specifically address the cryptographic hash properties: a) that every different results in a _unique_ hash, and b) the whole "one way function" thing, which is hopefully a little disturbing to folks who remember their algebra. I should write one.

An issue that comes up when using hashes to publicly commit a secret is that hash functions are _deterministic_: for the same input they will always return the same output. Of course, this _has_ to be the case in order for the whole commit-reveal process to work. But it is problematic when there are only a few well-known choices - say, "rock", "paper", and "scissors", as your opponent can compute for herself beforehand the hash values for those words and be able to know your input from the commitment.

To deal with this you should "salt" your choice with a random value. Instead of simply sending `hash_func("rock")`, you select a random value and append it to your choice and send `hash_func("rock0x23fed38")` - which results in a value that is not in any way related to the hash of "rock". When it comes time to reveal, you send both your choice and the salt value to your opponent, who can then hash them together and verify that your choice and commitment agree.

Here is a Jupyter notebook demonstrating a basic use of hash-based commit-reveal:
- [On GitHub](https://github.com/Apian-Framework/Jupyter-Notebooks/blob/main/HashCommitReveal.ipynb)
- [Interactive on Binder](https://mybinder.org/v2/gh/Apian-Framework/Jupyter-Notebooks/main?labpath=HashCommitReveal.ipynb)


### Compare Secret Values That Need to Stay secret

> Basically "Millionaires' Problem"-like situations. This initially came to mind while playing with hash commit/reveal for "Stratego" - and I wondered "what if you didn;t have to reveal a piece's rank during a skirmish?" (Clearly) I haven;t written this up yet - but I _have_ done the Jupyter notebooks.

Here is a Jupyter notebook demonstrating a secure secret comparison:
- [On GitHub](https://github.com/Apian-Framework/Jupyter-Notebooks/blob/main/EfficientMillionaire.ipynb)
- [Interactive on Binder](https://mybinder.org/v2/gh/Apian-Framework/Jupyter-Notebooks/main?labpath=EfficientMillionaire.ipynb)


### Commutative Encryption

> This is basically for playing cards. An Elgamal-based cryptosystem is constructed in which cards are encrypted by multiple players but the partial homomorphic nature of Elgamal makes it possible to apply decryptions in any order. SO, for instance, if a card is "dealt" to one player and everyone else applies their decryption key - then the owner of the card (by privately applying her own key locally) is able to view the card while no on else can. I don't have a notebook set up for this document - but I do have all of this already in notebook form.

### Peer to Peer Shuffling/Mixing Without a Trusted Third Party

> Based on the above cryptosystem.

### The Dropped Player Problem

> If you have gang-encrypted date that requires a set of people to decrypt - and one of them goes away, what do you do? Basically it's Shamir Secret Sharing of keys beforehand.










