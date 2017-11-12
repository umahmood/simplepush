# Simplepush

Simplepush is a Lua module which sends push notification messages to your device, 
using the the [simplepush.io](https://simplepush.io/) service.

Note: Currently it does not support sending encrypted messages.

# Installation

Copy **'simplepush.lua'** into your Lua package path. On my macOS system with Lua 
installed using brew. It looks like this:

> $ cp simplepush.lua /usr/local/share/lua/5.2/

To find your package paths, run the following code:

```
print("LUA MODULES:\n",(package.path:gsub("%;","\n\t")),"\n\nC MODULES:\n",(package.cpath:gsub("%;","\n\t")))
```
Output:
```
LUA MODULES:
        /usr/local/share/lua/5.2/?.lua
        /usr/local/share/lua/5.2/?/init.lua
        /usr/local/lib/lua/5.2/?.lua
        /usr/local/lib/lua/5.2/?/init.lua
        ./?.lua

C MODULES:
        /usr/local/lib/lua/5.2/?.so
        /usr/local/lib/lua/5.2/loadall.so
        ./?.so
```

# Usage

```
simplepush = require "simplepush"

simplepush.send{key="<SIMPLEPUSH-KEY>", title="hello", msg="world"}
```
To match an event:
```
simplepush = require "simplepush"

simplepush.send{key="<SIMPLEPUSH-KEY>", title="hello", msg="world", event="door bell"}
```

# Testing

- Lua 5.2.4  Copyright (C) 1994-2015 Lua.org, PUC-Rio

# Dependencies

- [luasockets](https://luarocks.org/modules/luarocks/luasocket) - can be installed using [LuaRocks](https://luarocks.org/).

# License

See the [LICENSE](LICENSE.md) file for license rights and limitations (MIT).
