

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls

Item {
    id: root
    width: 684
    height: 342

    Image {
        id: image
        x: 7
        y: -42
        width: 668
        height: 387
        source: "../ELEC_F7X_CODDE1_R13_DGT97831 Image[2252].jpg"
        fillMode: Image.PreserveAspectFit
    }

    Item {
        id: __materialLibrary__
    }

    SLConnector {
        root: root
    }
}
