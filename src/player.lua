local G = love.graphics

player = {
  direction = 1,
  isGrounded = false,
  speed = 200,
  sprites = {
    stand = G.newImage("assets/sprites/player/stand.png"),
    jump = G.newImage("assets/sprites/player/jump.png"),
  }
}

player.sprite = player.sprites.stand

player.body = love.physics.newBody(world.this, 100, -100, "dynamic")
player.shape = love.physics.newRectangleShape(67, 94)
player.fixture = love.physics.newFixture(player.body, player.shape)

player.body:setFixedRotation(true)

function player:jump()
  self.body:applyLinearImpulse(0, -2800)
end

function player:getX()
  return self.body:getX()
end

function player:getY()
  return self.body:getY()
end

function player:getPosition()
  return {self.body:getPosition()}
end

function player:reset()
  self.body:setPosition(100, -100)
end

function player:move(dt)
  if love.keyboard.isDown("left") then
    self.body:setX(self.body:getX() - self.speed * dt)
    self.direction = -1
  end

  if love.keyboard.isDown("right") then
    self.body:setX(self.body:getX() + self.speed * dt)
    self.direction = 1
  end
end

function player:update(dt)
  if game:isPlaying() then
    player:move(dt)
  end

  if self.isGrounded then self.sprite = self.sprites.stand
  else self.sprite = self.sprites.jump end
end


function player:draw()
  G.draw(
    self.sprite, self.body:getX(), self.body:getY(), nil, self.direction, 1,
    self.sprites.stand:getWidth()/2, self.sprites.stand:getHeight()/2
  )
end
