-- 3rd-party libs
local anim8 = require("lib/anim8/main")
local camera = require("lib/hump/camera")()
local sti = require("lib/simple_tiled_implementation/sti")
require("lib/serialize")

-- Owned libs
local tbl = require("lib/tbl")
local utils = require("lib/utils")

saveData = {}

if love.filesystem.exists("data.lua") then
  local data = love.filesystem.load("data.lua")
  data()
end

-- Global stuff
require("src/game")
require("src/states/menu")
require("src/timer")
require("src/world")
require("src/platforms")
require("src/coins")
require("src/player")

gameMap = sti("src/levels/one.lua")

-- Local stuff
local G = love.graphics

function love.load()
  love.window.setMode(910, 700)
  G.setBackgroundColor(utils.rgb(155, 214, 255))

  world:load()
  coins:load()
  platforms:load()
end

function love.update(dt)
  local gameMap = gameMap

  world:update(dt)
  gameMap:update(dt)
  coins:update(dt)
  player:update(dt)

  if game:isPlaying() then
    timer:update(dt)
  end

  camera:lookAt(player:getX(), G.getHeight()/2)
end

function love.draw()
  local gameMap = gameMap

  if game:isMenu() then
    G.printf("Press SPACE to begin", 0, 100, G.getWidth(), "center")
  end

  camera:draw(
    function()
      gameMap:drawLayer(gameMap.layers["Tile Layer 1"])
      coins:draw()
      player:draw()
    end
  )

  timer:draw()
end

function love.keypressed(key, scanCode, isRepeat)
  if game:isMenu() then
    if key == "space" then
      game:startPlaying()
    end
  elseif game:isPlaying() then
    if key == "space" and player.isGrounded then
      player:jump()
    end
  end
end
