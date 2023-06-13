VERSION = "1.0.0"

local lua_io = require("io")
local lua_os = require("os")

local micro_os = import("os")
local micro = import("micro")
local config = import("micro/config")
local shell = import("micro/shell")

local allTags = {}

-- INIT / CONFIG --

function init()
    config.MakeCommand("gotodef", gotoDef, config.NoComplete)
    config.MakeCommand("showdec", showDec, config.NoComplete)

    tagsLoaded = loadTags()
    if not tagsLoaded then
        micro.InfoBar():Message("Sailor - Tags file could not be parsed correctly!")
    end

    -- TODO - come up with sname keybinds
    config.TryBindKey("Ctrl-p", "command:showdec", true)
    -- config.TryBindKey("F9", "command:gotodef", true)
end

-- TODO - handle this better, maybe only do this when opened outside of a project  
function preQuit()
    lua_os.execute("rm *.sail")
end


-- NAVIGATION --

-- TODO - complete function implementation
function gotoDef(bp, args)
    micro.InfoBar():Message("'gotoDefinition' Not implemented yet!") -- TODO - Implement function
end

-- TODO - finish implementing function
function getDef()
end

function showDec(bp, args)
    local selection = getSelectedText()
    local dec = getDec(selection)

    if dec == nil then
        micro.InfoBar():Message("Could not find declaration for '" .. selection .. "'")
    else
        micro.InfoBar():Message(dec)
    end
end

-- CTAGS INTERACTION --

function getDec(text)
    for index,tag in ipairs(allTags) do
        if tag["name"] == text then return tag["declaration"] end
    end

    return nil
end

function loadTags()
    local fileType = micro.CurPane().Buf:FileType()
    
    local tagFileName = "sailor-" .. fileType .. "-tagfile.sail"
    if not fileExists(tagFileName) then
        micro.InfoBar():Message("Sailor - Tags Generated")
        lua_os.execute("ctags -R --languages=" .. fileType .. " -f " .. tagFileName)
    end

    local result = parseTags(tagFileName)
    return result
end

-- TODO - handle fil IO and invalid data errors
function parseTags(tagFileName)
    local next = next
    local tagFile = lua_io.open(tagFileName, "r")
    lua_io.input(tagFile)

    for line in lua_io.lines() do
        local splitLine = {}
        for word in string.gmatch(line, "([^	]+)") do
            table.insert(splitLine, word)
        end
        if next(splitLine) ~= nil then
            table.insert(allTags, {
                name=splitLine[1],
                file=splitLine[2],
                declaration=splitLine[3],
                type=splitLine[4]
            })
        end
    end

    return true
end


-- UTILS --

function getSelectedText()
    local curPane = micro.CurPane()
    local cursor = curPane.Cursor
    
    if not cursor:HasSelection() then
        micro.CurPane().Cursor:SelectWord()
    end

    local line = curPane.Buf:Line(cursor.CurSelection[1].Y)
    return string.sub(line, cursor.CurSelection[1].X+1, cursor.CurSelection[2].X)
end

function fileExists(path)
    local result, err = micro_os.Stat(path)
    if err == nil then return true end
    return false
end
