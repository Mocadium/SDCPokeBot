--RAM READING FUNCTIONS--

function GetPlayerData()

    address = emu:read32(0x03005008)

    player = {}
    player.x = emu:read16(address)
    player.y = emu:read16(address+2)

    buffer:moveCursor(0, 0)
    buffer:print("Player X: " .. player.x .. ", Y: " .. player.y)
    buffer:moveCursor(0, 1)
    buffer:print("TID: " .. tostring(TID).. ", SID: " .. tostring(SID))
end

--CREATE FUNCTION--
function Create()
    --Setup--
    buffer = console:createBuffer("Buffer")

    --CONSTS--
    state = GetPlayerData;

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
    buffer:clear()

    --STATE--
    if state ~= nil then
        state()
    end
end

--START--
callbacks:add("start", Create)
callbacks:add("frame", Step)
if emu then
	Create()
end