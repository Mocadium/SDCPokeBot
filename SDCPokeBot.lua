--STATES--
function StateStarter()
    PID = emu:read32(0x02024284);
    buffer:print("Pokemon ID: " .. PID)
    buffer:moveCursor(0, 1)
    GetShinyValue(PID)
    --buffer:print("Shiny Value: " .. GetShinyValue(PID))
end

--MISC FUNCTIONS--
function GetPlayerData()
    address = emu:read32(0x03005008)

    player = {}
    player.x = emu:read16(address)
    player.y = emu:read16(address+2)

    buffer:print("Player X: " .. player.x .. ", Y: " .. player.y)
    buffer:moveCursor(0, 1)
    buffer:print("TID: " .. tostring(TID).. ", SID: " .. tostring(SID))
end

function GetShinyValue(PID)
    p1 = PID >> 16
    p2 = PID & 0xFFFF
    SV = TID ~ SID ~ p1 ~ p2

    buffer:print("P1: " .. p1 .. ", P2: " .. p2)
    buffer:moveCursor(0, 2)
    buffer:print("Shiny Value:" .. SV)
    return
end

--CREATE FUNCTION--
function Create()
    --Setup--
    buffer = console:createBuffer("Buffer")

    --Network--
    console:log("Connecting to 127.0.0.1:8888...")
	sock = socket.tcp()
	if sock:connect("127.0.0.1", 8888) then
		console:log("Socket Test: Connected")
    end

    --CONSTS--
    state = StateStarter;

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
    buffer:moveCursor(0, 0)

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