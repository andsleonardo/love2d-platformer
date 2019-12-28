local P = love.physics
local tbl = require("lib/tbl")

world = {}

world.this = P.newWorld(0, 800, false)

world.callbacks = {
  beginContact = function(a, b, coll)
    player.isGrounded = true
  end,

  endContact = function(a, b, coll)
  end,

  preSolve = function()
  end,

  postSolve = function()
    player.isGrounded = false
  end
}

function world:load()
  self.this:setCallbacks(unpack(tbl.values(self.callbacks)))
end

function world:update(dt)
  world.this:update(dt)
end
