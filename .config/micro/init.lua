-- Code from: 
-- https://github.com/rochacbruno/i3_and_dotfiles/tree/master/move_to.config/micro

local micro = import("micro")
local config = import("micro/config")
local shell = import("micro/shell")
local buffer = import("micro/buffer")


function init()
    config.TryBindKey("Ctrl-Alt-u", "lua:initlua.run", true)
end

function run(bp)
    micro.Log("init.lua build")
    bp:Save()
    local buf = bp.Buf

    _command = {}
    _command["go"] = "go run " .. buf.Path
    -- cargo install cargo-play
    _command["rust"] = "cargo play " .. buf.Path
    _command["python"] = "python3 " .. buf.Path

    -- the true means run in the foreground
    -- the false means send output to stdout (instead of returning it)
    shell.RunInteractiveShell(_command[buf:FileType()], true, false)
end

function setContains(set, key)
    return set[key] ~= nil
end

function run_action(buf, commands, identifier, bottom_panel)
    local filetype = buf:FileType()

    if not setContains(commands, filetype) then
        return  -- if filetype does not support action just return
    end

    local output, err = shell.RunCommand(commands[filetype])

    local msg = output
    if err ~= nil then
        msg = msg .. tostring(err)
    end

    if msg ~= "" then
        if bottom_panel then
            local new_buffer = buffer.NewBuffer(msg, '')
            -- -- Looks like it is not a good idea to have it readonly
            -- new_buffer.Settings["filetype"] = filetype
            -- new_buffer.Settings["readonly"] = true
            -- new_buffer.Type.Readonly = true
            micro.CurPane():HSplitIndex(
                new_buffer,
                true -- means bottom split
            )
        else
            if err ~= nil then
                micro.InfoBar():Error(msg)
            else
                micro.InfoBar():Message(msg)
            end
            return
        end
    else
       micro.InfoBar():Message(identifier .. ": all good :)")
    end

end
