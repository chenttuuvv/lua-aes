aes = require "luaaes"
function HexDumpString(str,spacer)
return (
string.gsub(str,"(.)",
function (c)
return string.format("%02X%s",string.byte(c), spacer or "")
end)
)
end
print(HexDumpString("123"," "))
aes.init()
local cte,errmsg=aes.encrypt("testtext123","1234567890abcdef","1234567890abcdef");
if cte == -1 then
	print("e",errmsg)
end
print(HexDumpString(cte," "))
local ret1,pte=aes.decrypt(errmsg,"1234567890abcdef","1234567890abcdef")
if ret1 == -1 then
	print("d",pte)
end
print(pte)
aes.cleanup()
