// SPDX-License-Identifier: GPL-2.0
import QtQuick 2.4
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.2
import org.subsurfacedivelog.mobile 1.0
import org.kde.kirigami 2.0 as Kirigami

// Kirigami.ScrollablePage {
Kirigami.Page {
	id: divePlannerPage
	title: qsTr("Dive planner")
	background: Rectangle {
		color: subsurfaceTheme.backgroundColor
	}
	anchors.top:parent.top
	width: parent.width
	height: parent.height
	Layout.fillWidth: true;

	property color textColor: subsurfaceTheme.textColor
	property color secondaryTextColor: subsurfaceTheme.secondaryTextColor
	property int horizontalPadding: Kirigami.Units.gridUnit / 2 - Kirigami.Units.smallSpacing  + 1

	property alias dateText: txtDate.text
	property alias altitudeText: txtAltitude.text

	actions.main: Kirigami.Action {
		iconName: "document-save"
		onTriggered: {
			manager.appendTextToLog("planner save/edit button triggered")
			if (state === "editCylinder") {
				cylinderDetailsEdit.saveData()
			} else if (state === "editDivePlannerPoint") {
				divePlannerPointEdit.saveData()
			} else if (state === "editSettings") {
				divePlannerSettingsEdit.saveData()
			} else {
				savePlanAsDive()
			}
		}
	}
	actions.right: Kirigami.Action {
		id: editSettingsAction
		iconName: "document-edit"
		onTriggered: {
			manager.appendTextToLog("planner settings button triggered")
			if (state === "editCylinder") {
				cylinderDetailsEdit.saveData()
			} else if (state === "editDivePlannerPoint") {
				divePlannerPointEdit.saveData()
			}
			editSettings()
		}
	}

	onBackRequested: {
		if (state != "view") {
			endEditMode()
			event.accepted = true;
		}
		// if we were in view mode, don't accept the event and pop the page
	}

	function endEditMode() {
		// if we were adding a cylinder, we need to remove it
		if (state === "addCylinder")
			manager.addCylinderAborted(dive_id)
		// if we were adding a dive planner point, we need to remove it
		if (state === "addDivePlannerPoint")
			manager.addDivePlannerPointAborted(dive_id)
		// just cancel the edit/add state
		divePlannerPage.state = "view";
		Qt.inputMethod.hide();
	}

	function editCylinder() {
		console.log("editing cylinder");
		divePlannerPage.state = "editCylinder"
	}

	function editDivePlannerPoint() {
		console.log("editing dive planner point");
		divePlannerPage.state = "editDivePlannerPoint"
	}

	function savePlanAsDive() {
		// Create a new dive from the plan
	}

	function editSettings() {
		console.log("editing dive planner settings");
		divePlannerPage.state = "editSettings"
	}

	states: [
		State {
			name: "view"
			PropertyChanges { target: cylinderDetailsEditScroll; sheetOpen: false }
			PropertyChanges { target: divePlannerPointEditScroll; sheetOpen: false }
			PropertyChanges { target: divePlannerSettingsScroll; sheetOpen: false }
			PropertyChanges { target: pageStack.contentItem; interactive: true }
		},
		State {
			name: "editCylinder"
			PropertyChanges { target: cylinderDetailsEditScroll; sheetOpen: true }
			PropertyChanges { target: divePlannerPointEditScroll; sheetOpen: false }
			PropertyChanges { target: divePlannerSettingsScroll; sheetOpen: false }
			PropertyChanges { target: pageStack.contentItem; interactive: false }
		},
		State {
			name: "addCylinder"
			PropertyChanges { target: cylinderDetailsEditScroll; sheetOpen: true }
			PropertyChanges { target: divePlannerPointEditScroll; sheetOpen: false }
			PropertyChanges { target: divePlannerSettingsScroll; sheetOpen: false }
			PropertyChanges { target: pageStack.contentItem; interactive: false }
		},
		State {
			name: "editDivePlannerPoint"
			PropertyChanges { target: cylinderDetailsEditScroll; sheetOpen: false }
			PropertyChanges { target: divePlannerPointEditScroll; sheetOpen: true }
			PropertyChanges { target: divePlannerSettingsScroll; sheetOpen: false }
			PropertyChanges { target: pageStack.contentItem; interactive: false }
		},
		State {
			name: "addDivePlannerPoint"
			PropertyChanges { target: cylinderDetailsEditScroll; sheetOpen: false }
			PropertyChanges { target: divePlannerPointEditScroll; sheetOpen: true }
			PropertyChanges { target: divePlannerSettingsScroll; sheetOpen: false }
			PropertyChanges { target: pageStack.contentItem; interactive: false }
		},
		State {
			name: "editSettings"
			PropertyChanges { target: cylinderDetailsEditScroll; sheetOpen: false }
			PropertyChanges { target: divePlannerPointEditScroll; sheetOpen: false }
			PropertyChanges { target: divePlannerSettingsScroll; sheetOpen: true }
			PropertyChanges { target: pageStack.contentItem; interactive: false }
		}

	]

	ListModel {
		id: cylinderModel

		ListElement {
			type: "D12"
			size: "24.0l"
			startPressure: "232b"
			gasMix: "21/35"
			switchDepth: "66m"
		}
		ListElement {
			type: "AL80"
			size: "11.1l"
			startPressure: "207b"
			gasMix: "EAN32"
			switchDepth: "21m"
		}
		ListElement {
			type: "AL80"
			size: "11.1l"
			startPressure: "207b"
			gasMix: "EAN50"
			switchDepth: "21m"
		}
		ListElement {
			type: "AL80"
			size: "11.1l"
			startPressure: "207b"
			gasMix: "OXYGEN"
			switchDepth: "6m"
		}
	}

	ListModel {
		id: divePlannerPointsModel

		ListElement {
			depth: 0
			duration: 0
			runtime: 0
			cylinder: 0
		}
		ListElement {
			depth: 50
			duration: 3
			runtime: 3
			cylinder: 0
		}
		ListElement {
			depth: 50
			duration: 17
			runtime: 20
			cylinder: 0
		}
		ListElement {
			depth: 30
			duration: 3
			runtime: 23
			cylinder: 0
		}
		ListElement {
			depth: 30
			duration: 17
			runtime: 40
			cylinder: 1
		}
	}

	ColumnLayout {
		width: parent.width
		spacing: Kirigami.Units.gridUnit
		GridLayout {
			width: parent.width
			columns: 2
			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("Date:")
			}
			TextField {
				id: txtDate;
				Layout.fillWidth: true
			}
			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("Altitude:")
			}
			TextField {
				id: txtAltitude;
				Layout.fillWidth: true
			}
		}
	
		Kirigami.Label {
			text: qsTr("Available gases")
		}
		
		ListView {
			id: cylinderView
			height: childrenRect.height
			Layout.fillWidth: true
			boundsBehavior: Flickable.StopAtBounds
			model: cylinderModel
			header: Row {
				Kirigami.Label {
					// Placeholder same width as trash icon plus rowlayout spacing
					width: Kirigami.Units.iconSizes.smallMedium + Kirigami.Units.gridUnit
				}
				Kirigami.Label {
					text: qsTr("Type")
					width: Kirigami.Units.gridUnit * 4
					font.pointSize: subsurfaceTheme.smallPointSize
					wrapMode: Text.WrapAtWordBoundaryOrAnywhere
				}
				Kirigami.Label {
					text: qsTr("Size")
					width: Kirigami.Units.gridUnit * 3
					font.pointSize: subsurfaceTheme.smallPointSize
					wrapMode: Text.WrapAtWordBoundaryOrAnywhere
				}
				Kirigami.Label {
					text: qsTr("Start press.")
					width: Kirigami.Units.gridUnit * 3
					font.pointSize: subsurfaceTheme.smallPointSize
					wrapMode: Text.WrapAtWordBoundaryOrAnywhere
				}
				Kirigami.Label {
					text: qsTr("Gas mix")
					width: Kirigami.Units.gridUnit * 4
					font.pointSize: subsurfaceTheme.smallPointSize
					wrapMode: Text.WrapAtWordBoundaryOrAnywhere
				}
				Kirigami.Label {
					text: qsTr("Deco switch at")
					width: Kirigami.Units.gridUnit * 4
					font.pointSize: subsurfaceTheme.smallPointSize
					wrapMode: Text.WrapAtWordBoundaryOrAnywhere
				}
			}
			delegate: CylinderViewDelegate {
				type: model.type ? model.type : ""
				size: model.size ? model.size : ""
				startPressure: model.startPressure ? model.startPressure : ""
				gasMix: model.gasMix ? model.gasMix : ""
				switchDepth: model.switchDepth ? model.switchDepth : ""

				backgroundColor: subsurfaceTheme.backgroundColor

				onClicked : {
					// Open edit overlay for this cylinder
				}
			}
			footer: Button {
				id: addCylinder
				text: qsTr("Add cylinder")
				onClicked: {
					editCylinder()
				}
			}
		}
		Kirigami.Label {
			text: qsTr("Dive planner points")
		}

		ListView {
			id: divePlannerPointsView
			height: childrenRect.height
			Layout.fillWidth: true
			boundsBehavior: Flickable.StopAtBounds
			model: divePlannerPointsModel
			header: Row {
				Kirigami.Label {
					// Placeholder same width as trash icon plus rowlayout spacing
					width: Kirigami.Units.iconSizes.smallMedium + Kirigami.Units.gridUnit
				}
				Kirigami.Label {
					text: qsTr("Depth")
					width: Kirigami.Units.gridUnit * 5
					font.pointSize: subsurfaceTheme.smallPointSize
					elide: Text.ElideRight
					maximumLineCount: 1 // needed for elide to work at all
				}
				Kirigami.Label {
					text: qsTr("Duration")
					width: Kirigami.Units.gridUnit * 5
					font.pointSize: subsurfaceTheme.smallPointSize
					elide: Text.ElideRight
					maximumLineCount: 1 // needed for elide to work at all
				}
				Kirigami.Label {
					text: qsTr("Runtime")
					width: Kirigami.Units.gridUnit * 5
					font.pointSize: subsurfaceTheme.smallPointSize
					elide: Text.ElideRight
					maximumLineCount: 1 // needed for elide to work at all
				}
				Kirigami.Label {
					text: qsTr("Gas")
					width: Kirigami.Units.gridUnit * 5
					font.pointSize: subsurfaceTheme.smallPointSize
					elide: Text.ElideRight
					maximumLineCount: 1 // needed for elide to work at all
				}
			}
			delegate: DivePlannerPointsDelegate {
				depth: model.depth
				duration: model.duration
				runtime: model.runtime
				cylinder: model.cylinder
//				gasMix: model.gasMix ? model.gasMix : ""

				backgroundColor: subsurfaceTheme.backgroundColor

				onClicked : {
					// Open dive planner points edit overlay for this point
				}
			}
			footer: Button {
				id: addDivePlannerPoint
				text: qsTr("Add dive planner point")
				onClicked: {
					editDivePlannerPoint()
				}
			}

		}

		// Profile widget could go here

		// Plan notes
		Kirigami.Label {
			text: "Dive notes and plan go here"
		}
	}
	Kirigami.OverlaySheet {
		id: cylinderDetailsEditScroll
		parent: divePlannerPage
		rootItem.z: 0
		onSheetOpenChanged: {
			if (!sheetOpen) {
				endEditMode()
				divePlannerPage.actions.right = editSettingsAction
			}
		}
		CylinderDetailsEdit {
			id: cylinderDetailsEdit
		}
	}
	Kirigami.OverlaySheet {
		id: divePlannerPointEditScroll
		parent: divePlannerPage
		rootItem.z: 0
		onSheetOpenChanged: {
			if (!sheetOpen) {
				endEditMode()
				divePlannerPage.actions.right = editSettingsAction
			}
		}
		DivePlannerPointEdit {
			id: divePlannerPointEdit
		}
	}
	Kirigami.OverlaySheet {
		id: divePlannerSettingsScroll
		parent: divePlannerPage
		rootItem.z: 0
		onSheetOpenChanged: {
			if (!sheetOpen) {
				endEditMode()
				divePlannerPage.actions.right = editSettingsAction
			} else {
				divePlannerPage.actions.right = null
			}
		}
		DivePlannerSettingsEdit {
			id: divePlannerSettingsEdit
		}
	}

}
