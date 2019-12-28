require("src/timer")

local Coin = require("src/coin")
local tbl = require("lib/tbl")
local utils = require("lib/utils")

coins = {}

function coins:spawn(x, y)
  table.insert(self, Coin.new(x, y))
end

function coins:load()
  tbl.each(
    gameMap.layers["Coins"].objects,
    function(o) coins:spawn(o.x, o.y, o.width, o.height) end
  )
end

function coins:update(dt)
  for _i, c in ipairs(self) do
    c.animation:update(dt)

    if game:isPlaying() then
      if utils.distanceBetweenPoints(c:getPosition(), player:getPosition()) < 50 then
        c.isCollected = true
      end
    end
  end

  self:removeCollected()

  if #self == 0 and game:isPlaying() then
    timer:reset()
    player:reset()
    coins:load()
    game:goToMenu()
  end
end

function coins:removeCollected()
  tbl.reverseEach(
    coins,
    function(c, i)
      if c.isCollected then table.remove(coins, i) end
    end
  )
end

function coins:draw()
  for _i, c in ipairs(self) do
    c.animation:draw(
      c.spriteSheet, c.x, c.y, nil, nil, nil,
      20.5, 21
    )
  end
end
