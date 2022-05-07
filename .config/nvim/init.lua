-- Must run first in order to cache luaJIT
local ok, impatient = pcall(require, "impatient")
if ok then
  impatient.enable_profile()
end

-- require it all so impatient can cache it
require("config")
