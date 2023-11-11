--MISC FUNCTIONS--
function tobstring(num, num_bits)
    local bstring = ""
    
    for i = num_bits - 1, 0, -1 do
        local bit_value = (num >> i) & 1
        bstring = bstring .. tostring(bit_value)
    end
    
    return bstring
end

function readPokemon(address)
    if (emu:read32(address) == 0) then
        return nil
    end

    local str = ""
    for i = 0, 99 do
        local data = tobstring(emu:read8(address+i), 8)
        str = str .. data
    end
    return str
end

function GMLSend(header, string)
    sock:send(header.."\0"..string.."\0")
end

--STATES--
function StateStarter()
    pokemon_data_old = pokemon_data
    pokemon_data = readPokemon(0x02024284)

    if (pokemon_data ~= nil) then
        if (pokemon_data ~= pokemon_data_old) then
            buffer:clear()
            buffer:print("New Pokemon Data: " .. pokemon_data)
            GMLSend(0, pokemon_data)
            console:log("Sent New Pokemon Data to GameMaker")
        end
    end
end

--CREATE FUNCTION--
function Create()
    --Setup--
    buffer = console:createBuffer("Buffer")
    state = StateStarter
    pokemon_data = nil

    --Network--
    console:log("Connecting to Server...")
	sock = socket.tcp()
	if sock:connect("127.0.0.1", 55555) then
		console:log("Socket: Connected")
    end
    
    --IDs--
    IDaddress = emu:read32(0x0300500C)
    TID = emu:read16(IDaddress+0x000A)
    SID = emu:read16(IDaddress+0x000C)
end

--STEP FUNCTION--
function Step()
    --BUFFER--
	if not buffer then
		return
	end
    buffer:moveCursor(0, 0)

    --STATE--
    if (state ~= nil) then
        state()
    end
end

--END FUNCTION--
function End()
    sock:close()
end

--START--
callbacks:add("start", Create)
callbacks:add("frame", Step)
callbacks:add("stop", End)
if emu then
	Create()
end