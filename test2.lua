aes = require "luaaes"
function HexDumpString(str,spacer)
	return (
	string.gsub(str,"(.)",
	function (c)
	return string.format("%02X%s",string.byte(c), spacer or "")
	end)
	)
end
--print(HexDumpString("123"," "))

local file = assert(io.open("test.data","r"))
local data = file:read("*a")

aes.init()
local ret,cipher=aes.encrypt(data,"1230000000000000","1230000000000000");
--print(HexDumpString(cte," "))
if ret == -1  then
	print(ret,cipher)
	os.excute(exit)
end
local ret1,plain
--for i=1,1000000 do
	ret1,plain=aes.decrypt(cipher, "1230000000000000","1230000000000000")
	if ret1 == -1 then
		print(ret1,plain)
	end
--end
--print(ret1,plain)
aes.cleanup()
