#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>
#include <iup.h>
#include <iuplua.h>

int main(int argc, char **argv)
{
    lua_State *L = luaL_newstate();

    luaL_openlibs(L);
    iuplua_open(L);

    luaL_dofile(L, "hello.lua");

    lua_close(L);
}