local anim8 = require("lib/anim8/main")
local G = love.graphics

local Coin = {}

function Coin.new(x, y)
  local coin = {
    isCollected = false,
    spriteSheet = G.newImage("assets/sprite_sheets/coin.png"),
    x = x,
    y = y
  }

  coin.grid = anim8.newGrid(41, 42, coin.spriteSheet:getWidth(), coin.spriteSheet:getHeight())
  coin.animation = anim8.newAnimation(coin.grid('1-3', 1, '1-3', 2, '1-2', 3), 0.1)

  function coin:getPosition()
    return {self.x, self.y}
  end

  return coin
end

return Coin
