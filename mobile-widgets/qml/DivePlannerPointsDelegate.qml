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

	property string depth
	property string duration
	property string runtime
	property int cylinder
 	property bool selected

	enabled: true
	width: parent.width
	height: dataRow.height + Kirigami.Units.smallSpacing

	property real detailsOpacity : 0
	property int horizontalPadding: Kirigami.Units.gridUnit / 2 - Kirigami.Units.smallSpacing  + 1
	property color textColor: subsurfaceTheme.textColor

	RowLayout {
		id: layout
		spacing: Kirigami.Units.gridUnit * 0.5
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
					// Remove data point from model and recalculate
				}
			}
		}
		Row {
			id: dataRow
			Kirigami.Label {
				id: depthLabel
				text: innerListItem.depth
				width: Kirigami.Units.gridUnit * 5
				font.pointSize: subsurfaceTheme.smallPointSize
				elide: Text.ElideRight
				maximumLineCount: 1 // needed for elide to work at all
			}
			Kirigami.Label {
				id: durationLabel
				text: innerListItem.duration
				width: Kirigami.Units.gridUnit * 5
				font.pointSize: subsurfaceTheme.smallPointSize
				elide: Text.ElideRight
				maximumLineCount: 1 // needed for elide to work at all
			}
			Kirigami.Label {
				id: runtimeLabel
				text: innerListItem.runtime
				width: Kirigami.Units.gridUnit * 5
				font.pointSize: subsurfaceTheme.smallPointSize
				elide: Text.ElideRight
				maximumLineCount: 1 // needed for elide to work at all
			}
			Kirigami.Label {
				id: gasMixLabel
				text: cylinderModel.get(innerListItem.cylinder).gasMix
				width: Kirigami.Units.gridUnit * 5
				font.pointSize: subsurfaceTheme.smallPointSize
				elide: Text.ElideRight
				maximumLineCount: 1 // needed for elide to work at all
			}
		}
	}
}
