// SPDX-License-Identifier: GPL-2.0
import QtQuick 2.3
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import org.subsurfacedivelog.mobile 1.0
import org.kde.kirigami 2.0 as Kirigami

Item {
	id: detailsEdit
	property alias depthText: txtDepth.text
	property alias durationText: txtDuration.text
	property alias runtimeText: txtRuntime.text
	property alias cylinderIndex: comboCylinder.currentIndex

	function saveData() {
		// update the dive planner points model

		// update the cylinder listview

		// trigger the plan to be recalculated

		divePlannerPage.state = "view"
		Qt.inputMethod.hide()
	}

	height: editArea.height
	width: divePlannerPage.width - divePlannerPage.leftPadding - divePlannerPage.rightPadding
	ColumnLayout {
		id: editArea
		spacing: Kirigami.Units.smallSpacing
		width: parent.width - 2 * Kirigami.Units.gridUnit

		GridLayout {
			id: editorDetails
			width: parent.width
			columns: 2

			Kirigami.Heading {
				Layout.columnSpan: 2
				text: qsTr("Dive planner point")
			}
			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("Depth:")
			}
			TextField {
				id: txtDepth;
				Layout.fillWidth: true
			}
			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("Duration:")
			}
			TextField {
				id: txtDuration;
				Layout.fillWidth: true
			}

			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("Runtime:")
			}
			TextField {
				id: txtRuntime
				Layout.fillWidth: true
			}

			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("Gas mix:")
			}
			ComboBox {
				id: comboCylinder
				textRole: "gasMix"
				model: cylinderModel
			}
		}

		Item {
			height: Kirigami.Units.gridUnit * 3
			width: height // just to make sure the spacer doesn't produce scrollbars, but also isn't null
		}
	}
}
