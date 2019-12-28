local P = love.physics
local Platform = require("src/platform")
local tbl = require("lib/tbl")

platforms = {}

function platforms:spawn(x, y, width, height)
  table.insert(platforms, Platform.new(x, y, width, height))
end

function platforms:load()
  tbl.each(
    gameMap.layers["Platforms"].objects,
    function(o) platforms:spawn(o.x, o.y, o.width, o.height) end
  )
end

function platforms:draw()
  tbl.each(self, function(p) p:draw() end)
end
