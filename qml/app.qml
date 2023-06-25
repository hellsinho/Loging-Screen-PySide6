import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

ApplicationWindow{
    id: window
    width: 760
    height: 500
    visible: true
    title: qsTr("App Home")

    // Set Material Style
    Material.theme: Material.Dark
    Material.accent: Material.LightBlue

}