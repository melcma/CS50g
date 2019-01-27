LevelUpState = Class{__includes = BaseState}

function LevelUpState:init(stats, close)
    self.levelUpMenu = Menu {
        x = 40,
        y = 20,
        width = 300,
        height = 120,
        cursor = false,
        items = stats
    }

    self.close = close
end

function LevelUpState:update(dt)
    self.levelUpMenu:update(dt)

    if love.keyboard.wasPressed('space') or love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateStack:pop()
        self:close()
    end
end

function LevelUpState:render()
    self.levelUpMenu:render()
end