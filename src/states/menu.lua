local G = love.graphics
local M = love.mouse
local tbl = require("lib/tbl")
local ui = require("src/ui")
local utils = require("lib/utils")

menu = {
  elements = {
    "gameTitle",
    "howToPlay",
    "startTip"
  },
  font = ui.fonts.text()
}

function menu:load()
  tbl.each(
    self.elements,
    function(el) menu[el]:load() end
  )
end

function menu:update()
end

function menu:draw()
  tbl.each(
    self.elements,
    function(el) menu[el]:draw() end
  )
end

menu.gameTitle = {
  content = "ALIENWORLD",
  font = ui.fonts.heading(80),
  x = 0,
  y = 200,

  load = function(self)
    self.textObj = G.newText(self.font)
    self.textObj:addf(self.content, G.getWidth(), "center")
  end,

  draw = function(self)
    G.draw(self.textObj, self.x, self.y)
  end
}

menu.howToPlay = {
  content = "Collect all the coins in the map as fast as you can to win",
  font = menu.font,
  x = 0,
  y = 350,

  load = function(self)
    self.textObj = G.newText(self.font)
    self.textObj:addf(self.content, G.getWidth(), "center")
  end,

  draw = function(self)
    G.draw(self.textObj, self.x, self.y)
  end
}

menu.startTip = {
  content = "Press the spacebar to begin",
  font = menu.font,
  x = 0,
  y = 500,

  load = function(self)
    self.textObj = G.newText(self.font)
    self.textObj:addf(self.content, G.getWidth(), "center")
  end,

  draw = function(self)
    G.draw(self.textObj, self.x, self.y)
  end
}
