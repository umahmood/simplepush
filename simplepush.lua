--- send push notifications to devices using the simplepush.io service.
-- @module simplepush
local simplepush = {}

local http = require("socket.http");

-- isempty tests if string is nil or an empty string.
-- @param s the string.
-- @return a boolean.
local function isempty(s)
  return s == nil or s == ""
end

-- send sends a message.
-- send calls error() on invalid arguments and failed http call.
-- @param options table, supported options 'key', 'title', 'msg' & 'event'.
-- @return no results.
function simplepush.send(options)
    local key   = options.key
    local title = options.title
    local msg   = options.msg
    local event = options.event

    if isempty(key)   then error("'key' must not be empty")   end
    if isempty(title) then error("'title' must not be empty") end
    if isempty(msg)   then error("'msg' must not be empty")   end

    local request_body = "key="..key.."&title="..title.."&msg="..msg
    if not isempty(event) then
        request_body = request_body.."&event="..event
    end

    local response_body = {}
    local _, status_code, _ = http.request{
        url     = "https://api.simplepush.io/send",
        method  = "POST", 
        headers = 
          {
              ["Content-Type"] = "application/x-www-form-urlencoded";
              ["Content-Length"] = #request_body;
          },
          source = ltn12.source.string(request_body),
          sink   = ltn12.sink.table(response_body),
    }
    local HTTP_OK = 200
    if status_code ~= HTTP_OK then 
        return error("error making request: http "..status_code)
    end
end

return simplepush
