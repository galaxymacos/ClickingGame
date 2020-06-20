function love.load()
  button = {}
  button.x = 200
  button.y = 200
  button.size = 50

  score = 0
  timer = 10

  gameState = 1

  myFont = love.graphics.newFont(50)
end

function love.update(dt)
  if gameState == 2 then
    if timer > 0 then
      timer = timer - dt
      if timer < 0 then
        timer = 0
        gameState = 1
        score = 0
      end
    end
  end
end

function love.draw()
  -- love.graphics.rectangle("fill", 0,0, 200, 100)

  if(gameState == 2) then
    love.graphics.setColor(0, 1, 1, 1)
    love.graphics.circle("fill", button.x, button.y, button.size)
  end



  love.graphics.setFont(myFont)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.print("Scores: "..score)
  love.graphics.print("Time: "..math.ceil(timer), 300, 0) -- position of the letter: (x = 100, y = 0)

  if gameState == 1 then
    love.graphics.printf("click anywhere to begin!", 0, love.graphics.getHeight()/2, love.graphics.getWidth(), "center");
  end

end

function love.mousepressed(x, y, b, isTouch)
  -- body...
  if b == 1 and gameState == 2 then
    if(distanceBetween(button.x, button.y, love.mouse.getX(), love.mouse.getY())<button.size) then
      -- click is inside the circle
      score = score + 1
      button.x = math.random(button.size, love.graphics.getWidth()-button.size)
      button.y = math.random(button.size, love.graphics.getHeight()-button.size)
    end
  end

  if gameState == 1 then
    gameState = 2
    timer = 10
  end
end

function distanceBetween(x1, y1, x2, y2)
  return math.sqrt((y2-y1)^2+(x2-x1)^2)
end
