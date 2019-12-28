local G = love.graphics

local ui = {}

ui.fonts = {
  text = function(size)
    return G.newFont("assets/fonts/kenney_pixel_square.ttf", size or 20)
  end,

  heading = function(size)
    return G.newFont("assets/fonts/kenney_blocks.ttf", size or 50)
  end
}

return ui
