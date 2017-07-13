// SPDX-License-Identifier: GPL-2.0
import QtQuick 2.3
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import org.subsurfacedivelog.mobile 1.0
import org.kde.kirigami 2.0 as Kirigami

Item {
	id: detailsEdit
	property int cylinderIndex
	property alias typeText: txtType.text
	property alias sizeText: txtSize.text
	property alias startpressureText: txtStartPressure.text
	property alias o2Text: txtO2.text
	property alias heText: txtHe.text
	property alias switchDepthText: txtSwitchDepth.text
	property alias bottomMODText: txtBottomMOD.text
	property alias mndText: txtMND.text
// 	property alias gasmixText: txtGasMix.text

// 	property alias cylinderIndex: cylinderBox.currentIndex
// 	property alias cylinderModel: cylinderBox.model

// 	property alias suitIndex: suitBox.currentIndex
// 	property alias suitText: suitBox.text
// 	property alias buddyIndex: buddyBox.currentIndex
// 	property alias buddyText: buddyBox.text
// 	property alias divemasterIndex: divemasterBox.currentIndex
// 	property alias divemasterText: divemasterBox.text
// 	property alias cylinderText: cylinderBox.text
// 	property alias notesText: txtNotes.text
// 	property alias durationText: txtDuration.text
// 	property alias depthText: txtDepth.text
// 	property alias weightText: txtWeight.text
// 	property alias endpressureText: txtEndPressure.text
// 	property alias gpsCheckbox: checkboxGPS.checked
// 	property alias suitModel: suitBox.model
// 	property alias divemasterModel: divemasterBox.model
// 	property alias buddyModel: buddyBox.model

	function saveData() {
		// update the cylinder model
// 		diveDetailsListView.currentIndex = newIdx
// 		diveDetailsListView.currentItem.modelData.date = detailsEdit.dateText
// 		diveDetailsListView.currentItem.modelData.location = detailsEdit.locationText
// 		diveDetailsListView.currentItem.modelData.duration = detailsEdit.durationText
// 		diveDetailsListView.currentItem.modelData.depth = detailsEdit.depthText
// 		diveDetailsListView.currentItem.modelData.airtemp = detailsEdit.airtempText
// 		diveDetailsListView.currentItem.modelData.watertemp = detailsEdit.watertempText
// 		diveDetailsListView.currentItem.modelData.suit = suitBox.currentText
// 		diveDetailsListView.currentItem.modelData.buddy = buddyBox.currentText
// 		diveDetailsListView.currentItem.modelData.divemaster = divemasterBox.currentText
// 		diveDetailsListView.currentItem.modelData.cylinder = cylinderBox.currentText
// 		diveDetailsListView.currentItem.modelData.notes = detailsEdit.notesText

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
				text: qsTr("Cylinder details")
			}
			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("Type:")
			}
			TextField {
				id: txtType;
				Layout.fillWidth: true
				background.implicitHeight: Kirigami.Units.gridUnit * 2
			}
// 			HintsTextEdit {
// 				id: cylinderBox
// 				model: diveDetailsListView.currentItem ? diveDetailsListView.currentItem.modelData.dive.cylinderList : null
// 				inputMethodHints: Qt.ImhNoPredictiveText
// 				Layout.fillWidth: true
// 			}
			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("Size:")
			}
			TextField {
				id: txtSize;
				Layout.fillWidth: true
				background.implicitHeight: Kirigami.Units.gridUnit * 2
			}

			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("Start Pressure:")
			}
			TextField {
				id: txtStartPressure
				Layout.fillWidth: true
				background.implicitHeight: Kirigami.Units.gridUnit * 2
			}

			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("O2:")
			}
			TextField {
				id: txtO2
				Layout.fillWidth: true
				validator: IntValidator { bottom: 0; top: 100 }
				background.implicitHeight: Kirigami.Units.gridUnit * 2
			}

			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("He:")
			}
			TextField {
				id: txtHe
				Layout.fillWidth: true
				validator: IntValidator { bottom: 0; top: 100 }
				background.implicitHeight: Kirigami.Units.gridUnit * 2
			}
			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("Deco switch at:")
			}
			TextField {
				id: txtSwitchDepth
				Layout.fillWidth: true
				background.implicitHeight: Kirigami.Units.gridUnit * 2
			}

			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("Bottom MOD:")
			}
			TextField {
				id: txtBottomMOD
				Layout.fillWidth: true
				background.implicitHeight: Kirigami.Units.gridUnit * 2
			}

			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("MND:")
			}
			TextField {
				id: txtMND
				Layout.fillWidth: true
				background.implicitHeight: Kirigami.Units.gridUnit * 2
			}
		}

		Item {
			height: Kirigami.Units.gridUnit * 3
			width: height // just to make sure the spacer doesn't produce scrollbars, but also isn't null
		}
	}
}
