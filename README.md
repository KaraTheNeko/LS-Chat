# LS Chat
LS Chat is a modified version of [KyleLee15's NCCPack](https://forum.cfx.re/t/release-fivem-chat-doj-based-nccpack-fivem-chat-with-changeable-name-more-stand-a-lone/2332881?page=2) that implements more commands, compatability with [Concept Collective's CC-Chat](https://github.com/Concept-Collective/cc-chat), and more!


## Requirements
This script requires:
* [CC-Chat](https://github.com/Concept-Collective/cc-chat)
* [LS-Essentials](https://github.com/KaraTheNeko/ls-essentials)

## Installation & Usage
1. Download the latest version of [LS-Chat](https://github.com/KaraTheNeko/LS-Chat/releases/tag/1.0.0)
2. Unzip the folder and add it to your server resources folder.
3. Add the following lines into your server.cfg AFTER "chat"
   ```
   ensure cc-chat
   ensure ls-essentials
   ensure LS-Chat
   ```
4. Add the follwoing to either your server.cfg or permissions.cfg
   ```
   add_ace group.admin ls-essentials.*
   ```
## Commands
* /name {Firstname} {Lastname} | Allows members to enter a firstname and a lastname into chat for it to automatically update in chat for them.
* /rank {rank} | Allows members to select a rank and it show in chat next to their name when they send a message.
* /ranks {so/pd/state/fire/ems} | Lists out the acceptable ranks for /rank.  Leave blank for misc ranks.
* /twthandle {username} | Allows members to create an custom Twotter/Twitter handle that will then be used in the command /twt.
* /twt {message} | Allows members to send a global message to other members on the server using Twotter/Twitter **[Global]**
* /ganontwt | Generates a random handle for /anontwt. 
* /anontwt {message} | Allows members to send a global anonymous message to other members on the server using Twotter/Twitter **[Global]**
* /me {message} | Allows members to send messages over chat **[Proximity]**
* /mer {message} | Allows members to send messages in red over chat **[Proximity]**
* /ooc {message} | Allows members to send an "Out of Character" (OOC) message **[Proximity]**
* /oocr {message} | Allows members to send a red "Out of Character" (OOC) message **[Proximity]**
* /gooc {message} | Allows members to send an "Out of Character" (OOC) message **[Global]**
* /dw {message} | Allows members to send an Anonymous message **[Global]**
* /clear | Allows members to clear their chat **(Client Sided)**
* /clearname | Allows members to reset their active name **(Client Sided)**
* /clearrank | Allows members to reset their active rank **(Client Sided)**
* /clearhandle | Allows members to reset their active Twotter handles **(Client Sided)**