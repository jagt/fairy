-- the premake version only supports vs2012, so we'll have to manually upgrade it to 2013
if _ACTION == 'clean' then
    os.rmdir './build'
    os.rmdir './bin'
    os.rmdir './obj'
end

-- currently think of windows only
solution 'fairy'
    location './build'
    configurations {'Debug', 'Release'}
    platforms 'x32'

    project 'fairy'
    language 'C'
    flags {'StaticRuntime'}
    files {'src/**.c', 'src/**.h'} -- FIXME rc
    links { 'iuplua52', 'iup', 'lua52', 'gdi32', 'comctl32', 'Winmm', 'ws2_32'}

    configuration 'Debug'
        flags {'ExtraWarnings', 'Symbols'}
        defines {'_DEBUG'}
        kind "ConsoleApp"

    configuration 'Release'
        flags {'Optimize'}
        defines {'NDEBUG'}
        kind "WindowedApp"

    configuration 'vs*'
        defines {'_CRT_SECURE_NO_WARNINGS'}
        includedirs {'vendor/vc12/include'}
        libdirs {'vendor/vc12'}

    configuration {'vs*', 'Debug'}
        objdir 'obj/vc12/debug'
        targetdir 'bin/vc12/debug'

    configuration {'vs*', 'Release'}
        objdir 'obj/vc12/release'
        targetdir 'bin/vc12/release'
