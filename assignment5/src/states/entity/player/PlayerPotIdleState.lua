--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

PlayerPotIdleState = Class{__includes = PlayerIdleState}

function PlayerPotIdleState:enter(params)
    -- render offset for spaced character sprite
    self.entity.offsetY = 5
    self.entity.offsetX = 0
    self.entity:changeAnimation('pot-idle-' .. self.entity.direction)
end

function PlayerPotIdleState:update(dt)
    if love.keyboard.isDown('left') or love.keyboard.isDown('right') or
       love.keyboard.isDown('up') or love.keyboard.isDown('down') then
        self.entity:changeState('pot-walk')
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

        self.entity:changeState('idle')
    end
end