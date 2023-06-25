import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

ApplicationWindow{
    id: window
    width: 400
    height: 580
    visible: true
    title: qsTr("Login Page")

    // Set flags
    flags: Qt.WindowCloseButtonHint | Qt.WindowMinimizeButtonHint | Qt.CustomizeWindowHint| Qt.MSWindowsFixedSizeDialogHint | Qt.WindowTitleHint

    // Set Material Style
    Material.theme: Material.Dark
    Material.accent: Material.LightBlue

    QtObject {
        id: internal
        property string user: "helson"
        property string pass: "123"

        // check login
        function checkLogin(username, password){
            if(username === user && password === pass){
                var component = Qt.createComponent("app.qml")
                var win = component.createObject()
                win.show()
                visible = false
            } else {
                // change user color
                if(username != user){
                    usernameField.Material.foreground = Material.Pink
                    usernameField.Material.accent = Material.Pink
                } else {
                    usernameField.Material.foreground = Material.LightBlue
                    usernameField.Material.accent = Material.LightBlue
                }

                if(password != user){
                    passwordField.Material.foreground = Material.Pink
                    passwordField.Material.accent = Material.Pink
                } else {
                    passwordField.Material.foreground = Material.LightBlue
                    passwordField.Material.accent = Material.LightBlue
                }
            }
        }
    }

    // Create a top bar
    Rectangle{
    id: topBar
    height: 40
    color: Material.color(Material.Blue)
    anchors{
            left: parent.left
            right: parent.right
            top: parent.top
            margins: 10
        }
    radius: 10

    Text{
        text: qsTr("LOGIN PAGE")
        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "#ffffff"
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 10
        }
    }

    // image import
    Image{
        id: image
        width: 300
        height: 120
        source: "../images/logo.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: topBar.bottom
        anchors.topMargin: 60
    }

    // Text field username
    TextField{
        id: usernameField
        width: 300
        text: qsTr("")
        selectByMouse: True
        placeholderText: qsTr("Username ou email")
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: image.bottom
        anchors.topMargin: 60
    }
    TextField{
        id: passwordField
        width: 300
        text: qsTr("")
        selectByMouse: True
        placeholderText: qsTr("Password")
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: usernameField.bottom
        anchors.topMargin: 60
        echoMode: TextInput.Password
    }

    // Checkbox save pass
    CheckBox{
        id: checkBox
        text: qsTr("Save password")
        anchors.top: passwordField.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button{
        id: buttonLogin
        width: 300
        text: qsTr("Login")
        anchors.top: checkBox.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: internal.checkLogin(usernameField.text, passwordField.text)
    }
}