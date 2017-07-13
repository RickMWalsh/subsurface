// SPDX-License-Identifier: GPL-2.0
import QtQuick 2.3
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import org.subsurfacedivelog.mobile 1.0
import org.kde.kirigami 2.0 as Kirigami

Item {
	id: detailsEdit

	// Ascent/descent rates
	property alias ascRate75Value: spinAscRate75.value
	property alias ascRate50Value: spinAscRate50.value
	property alias ascRateStopsValue: spinAscRateStops.value
	property alias ascRateLast6mValue: spinAscRateLast6m.value
	property alias descRateValue: spinDescRate.value
	
	// VMP-B / Buhlmann / Recreational radio buttons
	property alias recreationalChecked: radioRecreational.checked
	property alias bulhmannChecked: radioBuhlmann.checked
	property alias vpmbChecked: radioVpmb.checked
	
	// Deco model settings
	property alias reserveGasValue: spinReserveGas.value
	property alias safetyStopValue: chkSafetyStop.checked
	property alias gfLowValue: spinGfLow.value
	property alias gfHighValue: spinGfHigh.value
	property alias vpmbConservatismText: spinVpmbConservatism.value
	
	// Other planning settings
	property alias swichAtReqStopValue: chkSwitchAtReqStop.checked
	property alias backgasBreaksValue: chkBackgasBreaks.checked
	property alias minSwitchDurationValue: spinMinSwitchDuration.value
	property alias lastStopValue: chkLastStop.checked
	property alias dropStoneModeValue: chkDropStoneMode.checked
	
	// Gas options
	property alias decoSacValue: spinDecoSac.value
	property alias bottomSacValue: spinBottomSac.value
	property alias bottomPo2Value: spinBottomPo2.realValue
	property alias decoPo2Value: spinDecoPo2.realValue
	property alias bestEndValue: spinBestEnd.value
	
	// Reserve options
	property alias sacFactorValue: spinSacFactor.realValue
	property alias problemSolvingTimeValue: spinProblemSolvingTime.value
	
	// Notes options
	property alias displayRuntimeValue: chkDisplayRuntime.checked
	property alias displayDurationValue: chkDisplayDuration.checked
	property alias displayTransitionsValue: chkDisplayTransitions.checked
	property alias verbatimValue: chkVerbatim.checked

	function saveData() {
		// update the preferences

		// trigger the plan to be recalculated

		// close overlay
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
				text: qsTr("Dive planner settings")
			}
			Kirigami.Label {
				Layout.columnSpan: 2
				text: qsTr("Ascent/descent rates")
			}
			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("below 75% avg. depth:")
			}
			SpinBox {
				id: spinAscRate75
				editable: true
				from: 1
				to: 100
				stepSize: 1
			}
			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("75% to 50% avg. depth:")
			}
			SpinBox {
				id: spinAscRate50
				editable: true
				from: 1
				to: 100
				stepSize: 1
			}
			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("50% avg. depth to 6m:")
			}
			SpinBox {
				id: spinAscRateStops
				editable: true
				from: 1
				to: 100
				stepSize: 1
			}

			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("6m to surface:")
			}
			SpinBox {
				id: spinAscRateLast6m
				editable: true
				from: 1
				to: 100
				stepSize: 1
			}
			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("Descent:")
			}
			SpinBox {
				id: spinDescRate
				editable: true
				from: 1
				to: 100
				stepSize: 1
			}

			Rectangle {
				color: subsurfaceTheme.darkPrimaryColor
				height: 1
				opacity: 0.5
				Layout.columnSpan: 2
				Layout.fillWidth: true
			}

			Kirigami.Label {
				Layout.columnSpan: 2
				text: qsTr("Decompression model")
			}
			// VPM-B / Buhlmann / Recreational radio buttons
			RadioButton {
				id: radioRecreational
				text: qsTr("Recreational mode")
				Layout.columnSpan: 2
			}
			RadioButton {
				id: radioBuhlmann
				text: qsTr("Bühlmann")
				Layout.columnSpan: 2
			}
			RadioButton {
				id: radioVpmb
				text: qsTr("VPM-B")
				Layout.columnSpan: 2
			}

			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("Reserve gas:")
				visible: radioRecreational.checked
			}
			SpinBox {
				id: spinReserveGas
				editable: true
				from: 10
				to: 99
				stepSize: 1
				visible: radioRecreational.checked
			}
			CheckBox {
				Layout.columnSpan: 2
				id: chkSafetyStop
				text: qsTr("Safety stop")
				visible: radioRecreational.checked
			}
			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("GF Low:")
				visible: radioBuhlmann.checked || radioRecreational.checked
			}
			SpinBox {
				id: spinGfLow
				editable: true
				from: 10
				to: 150
				stepSize: 1
				visible: radioBuhlmann.checked || radioRecreational.checked
			}
			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("GF High:")
				visible: radioBuhlmann.checked || radioRecreational.checked
			}
			SpinBox {
				id: spinGfHigh
				editable: true
				from: 10
				to: 150
				stepSize: 1
				visible: radioBuhlmann.checked || radioRecreational.checked
			}
			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("VPM-B conservatism:")
				visible: radioVpmb.checked
			}
			SpinBox {
				id: spinVpmbConservatism
				editable: true
				from: 0
				to: 4
				stepSize: 1
				visible: radioVpmb.checked
			}

			Rectangle {
				color: subsurfaceTheme.darkPrimaryColor
				height: 1
				opacity: 0.5
				Layout.columnSpan: 2
				Layout.fillWidth: true
			}

			CheckBox {
				id: chkDropStoneMode
				text: qsTr("Drop to first depth")
			}
			CheckBox {
				id: chkLastStop
				text: qsTr("Last stop at 6m")
			}
			CheckBox {
				id: chkBackgasBreaks
				text: qsTr("Plan back gas breaks")
			}
			CheckBox {
				id: chkSwitchAtReqStop
				text: qsTr("Only switch at req. stops")
			}
			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("Min. switch duration:")
			}
			SpinBox {
				id: spinMinSwitchDuration
				editable: true
				from: 0
				to: 9
				stepSize: 1
			}

			Rectangle {
				color: subsurfaceTheme.darkPrimaryColor
				height: 1
				opacity: 0.5
				Layout.columnSpan: 2
				Layout.fillWidth: true
			}

			Kirigami.Label {
				Layout.columnSpan: 2
				text: qsTr("Gas options")
			}
			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("Deco SAC:")
			}
			SpinBox {
				id: spinDecoSac
				editable: true
				from: 1
				to: 99
				stepSize: 1
			}
			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("Bottom SAC:")
			}
			SpinBox {
				id: spinBottomSac
				editable: true
				from: 1
				to: 99
				stepSize: 1
			}
			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("Bottom pO2:")
			}

			Rectangle {
				color: subsurfaceTheme.darkPrimaryColor
				height: 1
				opacity: 0.5
				Layout.columnSpan: 2
				Layout.fillWidth: true
			}

			SpinBox {
				id: spinBottomPo2
				editable: true
				from: 500
				to: 2000
				stepSize: 50
				property int decimals: 2
				property int factor: 1000
				property real realValue: value / factor
				validator: DoubleValidator {
					bottom: Math.min(parent.from, parent.to)
					top:  Math.max(parent.from, parent.to)
				}
				textFromValue: function(value, locale) {
					return Number(value / factor).toLocaleString(locale, 'f', decimals)
				}
				valueFromText: function(text, locale) {
					return Number.fromLocaleString(locale, text) * factor
				}
			}
			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("Deco pO2:")
			}
			SpinBox {
				id: spinDecoPo2
				editable: true
				from: 500
				to: 2000
				stepSize: 50
				property int decimals: 2
				property int factor: 1000
				property real realValue: value / factor
				validator: DoubleValidator {
					bottom: Math.min(parent.from, parent.to)
					top:  Math.max(parent.from, parent.to)
				}
				textFromValue: function(value, locale) {
					return Number(value / factor).toLocaleString(locale, 'f', decimals)
				}
				valueFromText: function(text, locale) {
					return Number.fromLocaleString(locale, text) * factor
				}
			}
			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("Best mix END:")
			}
			SpinBox {
				id: spinBestEnd
				editable: true
				from: 1
				to: 99
				stepSize: 1
			}

			Rectangle {
				color: subsurfaceTheme.darkPrimaryColor
				height: 1
				opacity: 0.5
				Layout.columnSpan: 2
				Layout.fillWidth: true
			}

			Kirigami.Label {
				Layout.columnSpan: 2
				text: qsTr("Minimum gas")
			}
			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("SAC factor:")
			}
			SpinBox {
				id: spinSacFactor
				editable: true
				from: 20
				to: 100
				stepSize: 1
				property int decimals: 1
				property int factor: 10
				property real realValue: value / factor
				validator: DoubleValidator {
					bottom: Math.min(parent.from, parent.to)
					top:  Math.max(parent.from, parent.to)
				}
				textFromValue: function(value, locale) {
					return Number(value / factor).toLocaleString(locale, 'f', decimals)
				}
				valueFromText: function(text, locale) {
					return Number.fromLocaleString(locale, text) * factor
				}
			}
			Kirigami.Label {
				Layout.alignment: Qt.AlignRight
				text: qsTr("Problem solving time:")
			}
			SpinBox {
				id: spinProblemSolvingTime
				editable: true
				from: 0
				to: 4
				stepSize: 1
			}
			
			Kirigami.Label {
				Layout.columnSpan: 2
				text: qsTr("Notes output")
			}
			CheckBox {
				id: chkDisplayRuntime
				text: qsTr("Display runtime")
			}
			CheckBox {
				id: chkDisplayDuration
				text: qsTr("Display duration")
			}
			CheckBox {
				id: chkDisplayTransitions
				text: qsTr("Display runtime")
			}
			CheckBox {
				id: chkVerbatim
				text: qsTr("Verbatim dive plan")
			}
		}

		Item {
			height: Kirigami.Units.gridUnit * 3
			width: height // just to make sure the spacer doesn't produce scrollbars, but also isn't null
		}
	}
}
