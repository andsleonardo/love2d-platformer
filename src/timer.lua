local G = love.graphics
local utils = require("lib/utils")
local ui = require("src/ui")

timer = {
  best = saveData.bestTime or 0,
  font = ui.fonts.text(21),
  minSeconds = 0,
  seconds = 0
}

timer.wrapper = {
  x = 20,
  y = 20,
  size = G.getWidth(),
  align = "left"
}

function timer:reset()
  self:saveBest()
  self.seconds = self.minSeconds
end

function timer:isRunning()
  return self.seconds > 0
end

function timer:setToZero()
  self.seconds = 0
end

function timer:increaseBy(seconds)
  self.seconds = self.seconds + seconds
end

function timer:saveBest()
  if self.best == 0 or self.seconds < self.best then
    self.best = math.floor(self.seconds)
    saveData.bestTime = self.best
    love.filesystem.write("data.lua", table.show(saveData, "saveData"))
  end
end

function timer:update(dt)
  self:increaseBy(dt)
end

function timer:draw()
  G.setFont(self.font)

  G.printf(
    "TIME: " .. math.floor(self.seconds) .. "\n" .. "BEST: " .. self.best,
    self.wrapper.x, self.wrapper.y, self.wrapper.size, self.wrapper.align
  )
end
