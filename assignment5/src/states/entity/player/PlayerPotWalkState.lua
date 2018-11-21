--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

PlayerPotWalkState = Class{__includes = PlayerWalkState}

function PlayerPotWalkState:controls(dt)
    if love.keyboard.isDown('left') then
        self.entity.direction = 'left'
        self.entity:changeAnimation('pot-walk-left')
    elseif love.keyboard.isDown('right') then
        self.entity.direction = 'right'
        self.entity:changeAnimation('pot-walk-right')
    elseif love.keyboard.isDown('up') then
        self.entity.direction = 'up'
        self.entity:changeAnimation('pot-walk-up')
    elseif love.keyboard.isDown('down') then
        self.entity.direction = 'down'
        self.entity:changeAnimation('pot-walk-down')
    else
        self.entity:changeState('pot-idle')
    end

    if love.keyboard.wasPressed('space') then
        self.entity.holding.state = 'thrown'
        self.entity.holding.origx = self.entity.holding.x
        self.entity.holding.origy = self.entity.holding.y

        if self.entity.direction == 'left' then
            self.entity.holding.dx = -PLAYER_WALK_SPEED * dt
        elseif self.entity.direction == 'right' then
            self.entity.holding.dx = PLAYER_WALK_SPEED * dt
        elseif self.entity.direction == 'up' then
            self.entity.holding.dy = -PLAYER_WALK_SPEED * dt
        else
            self.entity.holding.dy = PLAYER_WALK_SPEED * dt
        end

        self.entity:changeState('walk')
    end
end