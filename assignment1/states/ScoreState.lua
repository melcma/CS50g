--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:init()
    self.bronze = love.graphics.newImage('bronze-medal.png')
    self.silver = love.graphics.newImage('silver-medal.png')
    self.golden = love.graphics.newImage('golden-medal.png')
end

function ScoreState:enter(params)
    self.score = params.score

    if self.score > 14 then
        self.medal = self.golden
    elseif self.score > 8 then
        self.medal = self.silver
    elseif self.score > 3 then
        self.medal = self.bronze
    else
        self.medal = nil
    end
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')

    if self.medal ~= nil then
        love.graphics.draw(self.medal, VIRTUAL_WIDTH - 10 - self.medal:getWidth() / 2, 10, 0, 0.5, 0.5)
    end
end