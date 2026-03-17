
class MumoMouse():
    def __init__(self):
        self.banned = False
        self.x = -1
        self.y = -1
        self.hidden = False
    
    def set_banned(self, banned):
        self.banned = banned
    
    def set_position(self, x, y):
        self.x = x
        self.y = y

    def set_hidden(self, hidden):
        self.hidden = hidden


mouse_1 = MumoMouse()
mouse_2 = MumoMouse()
