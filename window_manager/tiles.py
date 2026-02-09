import enum


class WindowTile(enum.StrEnum):
    UNDEFINED = "UNDEFINED"
    SYNOPTIC = "SYNOPTIC"
    INAV = "INAV"
    CHECKLIST = "CHECKLIST"
    AVIONICS = "AVIONICS"
    WPT_LIST = "WPT LIST"
    FLIGHT_MGMT = "FLIGHT MGMT"
    PDU = "ADI"


class ScreenTiles:
    def __init__(self, tiles):
        self.tiles = tiles
    
    def __getitem__(self, i):
        return self.tiles[i]

    def remove_all_tiles_beside(self, tile_type: WindowTile):
        new_tiles = [
            [WindowTile.UNDEFINED, WindowTile.UNDEFINED], 
            [WindowTile.UNDEFINED, WindowTile.UNDEFINED]
        ]

        for i in range(len(self.tiles)):
            for j in range(len(self.tiles)):
                if self.tiles[i][j] == tile_type:
                    new_tiles[i][j] = self.tiles[i][j]
        
        return new_tiles
    
    def __eq__(self, value):
        if (
            self.tiles[0][0] == value[0][0] and
            self.tiles[0][1] == value[0][1] and
            self.tiles[1][0] == value[1][0] and
            self.tiles[1][1] == value[1][1] 
        ):
            return True
        else:
            return False


class ScreenPosition(enum.StrEnum):
    PDU_LEFT = "PDU_LEFT"
    PDU_RIGHT = "PDU_RIGHT"
    MDU_UP = "MDU_UP"
    MDU_DOWN = "MDU_DOWN"


screen_tiles = {

    ScreenPosition.PDU_LEFT: 
        ScreenTiles([
            [WindowTile.PDU, WindowTile.PDU],
            [WindowTile.PDU, WindowTile.PDU]
        ]),

    ScreenPosition.PDU_RIGHT: 
        ScreenTiles([
            [WindowTile.PDU, WindowTile.PDU],
            [WindowTile.PDU, WindowTile.PDU]
        ]),

    ScreenPosition.MDU_UP: 
        ScreenTiles([
            [WindowTile.INAV, WindowTile.WPT_LIST],
            [WindowTile.INAV, WindowTile.WPT_LIST]
        ]),

    ScreenPosition.MDU_DOWN: 
        ScreenTiles([
            [WindowTile.SYNOPTIC, WindowTile.FLIGHT_MGMT],
            [WindowTile.SYNOPTIC, WindowTile.CHECKLIST],
        ])
}
