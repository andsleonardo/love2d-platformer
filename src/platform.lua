local G = love.graphics
local P = love.physics

local Platform = {}

function Platform.new(x, y, width, height)
  local platform = {
    width = width,
    height = height
  }

  platform.body = P.newBody(world.this, x, y, "static")
  platform.shape = P.newRectangleShape(width/2, height/2, width, height)
  platform.fixture = P.newFixture(platform.body, platform.shape)

  function platform:draw()
    G.rectangle("fill", self.body:getX(), self.body:getY(), self.width, self.height)
  end

  return platform
end

return Platform
