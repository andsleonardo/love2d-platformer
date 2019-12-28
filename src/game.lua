local G = love.graphics

game = {
  state = "menu",
}

function game:goToMenu()
  self.state = "menu"
end

function game:startPlaying()
  self.state = "playing"
end

function game:isMenu()
  return self.state == "menu"
end

function game:isPlaying()
  return self.state == "playing"
end
