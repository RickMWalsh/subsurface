import QtQuick 2.6
import QtQuick.Controls 2.0
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3
import org.subsurfacedivelog.mobile 1.0
import org.kde.kirigami 2.0 as Kirigami

Kirigami.AbstractListItem {
	id: innerListItem
	leftPadding: 0
	topPadding: 0

	property string type
	property string size
	property string startPressure
	property string gasMix
	property string switchDepth
 	property bool selected

	enabled: true
	width: parent.width
	height: dataRow.height + Kirigami.Units.smallSpacing

	property real detailsOpacity : 0
	property int horizontalPadding: Kirigami.Units.gridUnit / 2 - Kirigami.Units.smallSpacing  + 1
	property color textColor: subsurfaceTheme.textColor

	RowLayout {
		id: layout
		Kirigami.Icon {
			id: iconItem
			height: Kirigami.Units.iconSizes.smallMedium
			width: height
			selected: innerListItem.checked || innerListItem.pressed
			source: "trash-empty"
			MouseArea {
				anchors.fill: parent
				enabled: parent.visible
				onClicked: {
					// check cylinder is unused, remove cylinder from model and recalculate plan
				}
			}
		}
		Row {
			id: dataRow
			Kirigami.Label {
				id: typeLabel
				text: innerListItem.type
				width: Math.max(Kirigami.Units.gridUnit * 4, paintedWidth)
				font.pointSize: subsurfaceTheme.smallPointSize
			}
			Kirigami.Label {
				id: sizeLabel
				text: innerListItem.size
				width: Math.max(Kirigami.Units.gridUnit * 3, paintedWidth)
				font.pointSize: subsurfaceTheme.smallPointSize
			}
			Kirigami.Label {
				id: startPressureLabel
				text: innerListItem.startPressure
				width: Math.max(Kirigami.Units.gridUnit * 3, paintedWidth)
				font.pointSize: subsurfaceTheme.smallPointSize
			}
			Kirigami.Label {
				id: gasMixLabel
				text: innerListItem.gasMix
				width: Math.max(Kirigami.Units.gridUnit * 4, paintedWidth)
				font.pointSize: subsurfaceTheme.smallPointSize
				font.weight: Font.Bold
			}
			Kirigami.Label {
				id: switchDepthLabel
				text: innerListItem.switchDepth
				width: Math.max(Kirigami.Units.gridUnit * 4, paintedWidth)
				font.pointSize: subsurfaceTheme.smallPointSize
			}
		}
	}
}
