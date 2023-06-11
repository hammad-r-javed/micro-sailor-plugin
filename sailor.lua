VERSION = "1.0.0"

local micro = import("micro")
local config = import("micro/config")

function init()
    config.MakeCommand("gotodef", gotoDefinition, config.NoComplete)
end

function gotoDefinition(bp, args)
    micro.InfoBar():Message("gotoDefinition called!") -- TODO - FOR DEBUGGING
end
