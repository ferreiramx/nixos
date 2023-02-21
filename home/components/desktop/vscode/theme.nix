{ config, ... }:
let
  colors = config.colorScheme.colors;
in
''
  {
  	"$schema": "vscode://schemas/color-theme",
  	"type": "dark",
  	"name": "nix-colors",
  	"colors": {
  		"activityBar.background": "#${colors.base01}",
  		"activityBar.dropBorder": "#${colors.base05}",
  		"activityBar.foreground": "#${colors.base05}",
  		"activityBarBadge.background": "#${colors.base02}",
  		"activityBarBadge.foreground": "#${colors.base05}",
  		"badge.background": "#${colors.base02}",
  		"badge.foreground": "#${colors.base05}",
  		"button.background": "#${colors.base01}",
  		"button.border": "#${colors.base05}",
  		"button.foreground": "#${colors.base05}",
  		"button.hoverBackground": "#${colors.base01}",
  		"button.secondaryBackground": "#${colors.base01}",
  		"button.secondaryForeground": "#${colors.base05}",
  		"button.separator": "#${colors.base05}",
  		"checkbox.background": "#${colors.base01}",
  		"checkbox.border": "#${colors.base05}",
  		"checkbox.foreground": "#${colors.base05}",
  		"checkbox.selectBackground": "#${colors.base05}",
  		"checkbox.selectBorder": "#${colors.base05}",
  		"debugExceptionWidget.border": "#${colors.base01}00",
  		"descriptionForeground": "#${colors.base0D}",
  		"disabledForeground": "#${colors.base0D}",
  		"dropdown.background": "#${colors.base01}",
  		"dropdown.foreground": "#${colors.base05}",
  		"dropdown.listBackground": "#${colors.base01}",
  		"editor.background": "#${colors.base01}",
  		"editor.foldBackground": "#${colors.base02}",
  		"editor.foreground": "#${colors.base05}",
  		"editor.hoverHighlightBackground": "#${colors.base02}",
  		"editor.inactiveSelectionBackground": "#${colors.base02}",
  		"editor.lineHighlightBackground": "#${colors.base01}",
  		"editor.lineHighlightBorder": "#${colors.base02}",
  		"editor.selectionBackground": "#${colors.base02}",
  		"editor.selectionForeground": "#${colors.base05}",
  		"editor.selectionHighlightBackground": "#${colors.base0A}44",
  		"editor.wordHighlightBackground": "#${colors.base01}00",
  		"editor.wordHighlightBorder": "#${colors.base05}",
  		"editor.wordHighlightStrongBackground": "#${colors.base01}00",
  		"editor.wordHighlightStrongBorder": "#${colors.base05}",
  		"editorBracketMatch.background": "#${colors.base0A}44",
  		"editorBracketMatch.border": "#${colors.base05}",
  		"editorCodeLens.foreground": "#${colors.base05}",
  		"editorCursor.foreground": "#${colors.base0A}",
  		"editorGroup.border": "#${colors.base02}",
  		"editorGroup.dropBackground": "#${colors.base02}",
  		"editorGroup.dropIntoPromptBackground": "#${colors.base01}",
  		"editorGroupHeader.noTabsBackground": "#${colors.base01}",
  		"editorGroupHeader.tabsBackground": "#${colors.base01}",
  		"editorHoverWidget.border": "#${colors.base01}00",
  		"editorIndentGuide.activeBackground": "#${colors.base02}",
  		"editorIndentGuide.background": "#${colors.base02}",
  		"editorLineNumber.activeForeground": "#${colors.base05}",
  		"editorLineNumber.foreground": "#${colors.base02}",
  		"editorLink.activeForeground": "#${colors.base05}",
  		"editorOverviewRuler.background": "#${colors.base01}",
  		"editorOverviewRuler.border": "#${colors.base02}",
  		"editorRuler.foreground": "#${colors.base02}",
  		"editorSuggestWidget.border": "#${colors.base01}00",
  		"editorWhitespace.foreground": "#${colors.base02}",
  		"editorWidget.background": "#${colors.base02}",
  		"editorWidget.border": "#${colors.base05}",
  		"errorForeground": "#974b46",
  		"extensionButton.background": "#${colors.base02}",
  		"extensionButton.foreground": "#${colors.base05}",
  		"focusBorder": "#${colors.base05}",
  		"foreground": "#${colors.base05}",
  		"icon.foreground": "#${colors.base0D}",
  		"input.background": "#${colors.base02}",
  		"list.activeSelectionBackground": "#${colors.base02}",
  		"list.dropBackground": "#${colors.base02}",
  		"list.focusBackground": "#${colors.base02}",
  		"list.hoverBackground": "#${colors.base02}",
  		"list.inactiveFocusBackground": "#${colors.base02}",
  		"list.inactiveSelectionBackground": "#${colors.base02}",
  		"listFilterWidget.shadow": "#${colors.base01}00",
  		"menu.background": "#${colors.base02}",
  		"notificationCenterHeader.background": "#${colors.base02}",
  		"notifications.background": "#${colors.base02}",
  		"panel.background": "#${colors.base01}",
  		"panel.border": "#${colors.base02}",
  		"panel.dropBorder": "#${colors.base05}",
  		"panelTitle.activeBorder": "#${colors.base05}",
  		"panelTitle.activeForeground": "#${colors.base05}",
  		"peekView.border": "#${colors.base02}",
  		"peekViewEditor.background": "#${colors.base01}",
  		"peekViewResult.background": "#${colors.base02}",
  		"peekViewResult.selectionBackground": "#${colors.base02}",
  		"peekViewTitle.background": "#${colors.base02}",
  		"progressBar.background": "#${colors.base05}",
  		"scrollbar.shadow": "#${colors.base01}00",
  		"scrollbarSlider.activeBackground": "#${colors.base05}44",
  		"scrollbarSlider.background": "#${colors.base05}22",
  		"scrollbarSlider.hoverBackground": "#${colors.base05}33",
  		"sideBar.background": "#${colors.base01}",
  		"sideBar.dropBackground": "#${colors.base02}",
  		"sideBarSectionHeader.background": "#${colors.base01}",
  		"sideBarSectionHeader.foreground": "#${colors.base05}",
  		"sideBarTitle.foreground": "#${colors.base0D}",
  		"statusBar.background": "#${colors.base01}",
  		"statusBar.border": "#${colors.base02}",
  		"statusBar.foreground": "#${colors.base0D}",
  		"statusBar.noFolderBackground": "#${colors.base01}",
  		"statusBar.noFolderForeground": "#${colors.base0D}",
  		"tab.activeBackground": "#${colors.base02}",
  		"tab.activeForeground": "#${colors.base05}",
  		"tab.inactiveBackground": "#${colors.base01}",
  		"tab.inactiveForeground": "#${colors.base0D}",
  		"tab.unfocusedActiveBackground": "#${colors.base02}",
  		"terminal.background": "#${colors.base01}",
  		"terminal.dropBackground": "#${colors.base02}",
  		"terminal.inactiveSelectionBackground": "#${colors.base02}",
  		"terminal.selectionBackground": "#${colors.base02}",
  		"terminalCursor.foreground": "#${colors.base0A}",
  		"textBlockQuote.background": "#${colors.base02}",
  		"textBlockQuote.border": "#${colors.base05}",
  		"textCodeBlock.background": "#${colors.base01}",
  		"textLink.activeForeground": "#${colors.base05}",
  		"textLink.foreground": "#${colors.base05}",
  		"textPreformat.foreground": "#${colors.base0D}",
  		"textSeparator.foreground": "#${colors.base0D}",
  		"titleBar.activeBackground": "#${colors.base01}",
  		"titleBar.activeForeground": "#${colors.base0D}",
  		"titleBar.border": "#${colors.base02}",
  		"titleBar.inactiveBackground": "#${colors.base01}",
  		"toolbar.activeBackground": "#${colors.base01}00",
  		"toolbar.hoverBackground": "#${colors.base01}00",
  		"toolbar.hoverOutline": "#${colors.base01}00",
  		"tree.indentGuidesStroke": "#${colors.base02}",
  		"widget.shadow": "#${colors.base01}00",
  		//"activityBar.activeBorder": "#${colors.base05}",
  		//"activityBar.inactiveForeground": "#${colors.base05}66",
  		//"banner.background": "#${colors.base02}",
  		//"banner.foreground": "#${colors.base05}",
  		//"banner.iconForeground": "#3794ff",
  		//"breadcrumb.activeSelectionForeground": "#e7e7e7",
  		//"breadcrumb.background": "#${colors.base01}",
  		//"breadcrumb.focusForeground": "#e7e7e7",
  		//"breadcrumb.foreground": "#${colors.base05}cc",
  		//"breadcrumbPicker.background": "#${colors.base02}",
  		//"button.secondaryHoverBackground": "#${colors.base01}",
  		//"charts.blue": "#3794ff",
  		//"charts.foreground": "#${colors.base05}",
  		//"charts.green": "#89d185",
  		//"charts.lines": "#${colors.base05}80",
  		//"charts.orange": "#d18616",
  		//"charts.purple": "#b180d7",
  		//"charts.red": "#f14c4c",
  		//"charts.yellow": "#cca700",
  		//"commandCenter.activeBackground": "#${colors.base05}14",
  		//"commandCenter.activeBorder": "#${colors.base0D}4d",
  		//"commandCenter.activeForeground": "#${colors.base0D}",
  		//"commandCenter.background": "#${colors.base05}0d",
  		//"commandCenter.border": "#${colors.base0D}33",
  		//"commandCenter.foreground": "#${colors.base0D}",
  		//"commandCenter.inactiveBorder": "#${colors.base0D}26",
  		//"commandCenter.inactiveForeground": "#${colors.base0D}99",
  		//"debugConsole.errorForeground": "#ff0000",
  		//"debugConsole.infoForeground": "#3794ff",
  		//"debugConsole.sourceForeground": "#${colors.base05}",
  		//"debugConsole.warningForeground": "#cca700",
  		//"debugConsoleInputIcon.foreground": "#${colors.base05}",
  		//"debugExceptionWidget.background": "#420b0d",
  		//"debugIcon.breakpointCurrentStackframeForeground": "#ffcc00",
  		//"debugIcon.breakpointDisabledForeground": "#848484",
  		//"debugIcon.breakpointForeground": "#e51400",
  		//"debugIcon.breakpointStackframeForeground": "#89d185",
  		//"debugIcon.breakpointUnverifiedForeground": "#848484",
  		//"debugIcon.continueForeground": "#75beff",
  		//"debugIcon.disconnectForeground": "#f48771",
  		//"debugIcon.pauseForeground": "#75beff",
  		//"debugIcon.restartForeground": "#89d185",
  		//"debugIcon.startForeground": "#89d185",
  		//"debugIcon.stepBackForeground": "#75beff",
  		//"debugIcon.stepIntoForeground": "#75beff",
  		//"debugIcon.stepOutForeground": "#75beff",
  		//"debugIcon.stepOverForeground": "#75beff",
  		//"debugIcon.stopForeground": "#f48771",
  		//"debugTokenExpression.boolean": "#4e94ce",
  		//"debugTokenExpression.error": "#f48771",
  		//"debugTokenExpression.name": "#c586c0",
  		//"debugTokenExpression.number": "#b5cea8",
  		//"debugTokenExpression.string": "#ce9178",
  		//"debugTokenExpression.value": "#cccccc99",
  		//"debugToolBar.background": "#333333",
  		//"debugView.exceptionLabelBackground": "#6c2022",
  		//"debugView.exceptionLabelForeground": "#${colors.base05}",
  		//"debugView.stateLabelBackground": "#88888844",
  		//"debugView.stateLabelForeground": "#${colors.base05}",
  		//"debugView.valueChangedHighlight": "#569cd6",
  		//"diffEditor.diagonalFill": "#cccccc33",
  		//"diffEditor.insertedLineBackground": "#9bb95533",
  		//"diffEditor.insertedTextBackground": "#9ccc2c33",
  		//"diffEditor.removedLineBackground": "#ff000033",
  		//"diffEditor.removedTextBackground": "#ff000033",
  		//"dropdown.border": "#${colors.base01}",
  		//"editor.findMatchBackground": "#515c6a",
  		//"editor.findMatchHighlightBackground": "#ea5c0055",
  		//"editor.findRangeHighlightBackground": "#3a3d4166",
  		//"editor.focusedStackFrameHighlightBackground": "#7abd7a4d",
  		//"editor.inlineValuesBackground": "#ffc80033",
  		//"editor.inlineValuesForeground": "#${colors.base05}80",
  		//"editor.linkedEditingBackground": "#ff00004d",
  		//"editor.rangeHighlightBackground": "#${colors.base05}0b",
  		//"editor.snippetFinalTabstopHighlightBorder": "#525252",
  		//"editor.snippetTabstopHighlightBackground": "#7c7c7c4d",
  		//"editor.stackFrameHighlightBackground": "#${colors.base0A}33",
  		//"editor.symbolHighlightBackground": "#ea5c0055",
  		//"editor.wordHighlightTextBackground": "#${colors.base01}00",
  		//"editor.wordHighlightTextBorder": "#${colors.base05}",
  		//"editorActiveLineNumber.foreground": "#c6c6c6",
  		//"editorBracketHighlight.foreground1": "#ffd700",
  		//"editorBracketHighlight.foreground2": "#da70d6",
  		//"editorBracketHighlight.foreground3": "#179fff",
  		//"editorBracketHighlight.foreground4": "#${colors.base01}00",
  		//"editorBracketHighlight.foreground5": "#${colors.base01}00",
  		//"editorBracketHighlight.foreground6": "#${colors.base01}00",
  		//"editorBracketHighlight.unexpectedBracket.foreground": "#ff1212cc",
  		//"editorBracketPairGuide.activeBackground1": "#${colors.base01}00",
  		//"editorBracketPairGuide.activeBackground2": "#${colors.base01}00",
  		//"editorBracketPairGuide.activeBackground3": "#${colors.base01}00",
  		//"editorBracketPairGuide.activeBackground4": "#${colors.base01}00",
  		//"editorBracketPairGuide.activeBackground5": "#${colors.base01}00",
  		//"editorBracketPairGuide.activeBackground6": "#${colors.base01}00",
  		//"editorBracketPairGuide.background1": "#${colors.base01}00",
  		//"editorBracketPairGuide.background2": "#${colors.base01}00",
  		//"editorBracketPairGuide.background3": "#${colors.base01}00",
  		//"editorBracketPairGuide.background4": "#${colors.base01}00",
  		//"editorBracketPairGuide.background5": "#${colors.base01}00",
  		//"editorBracketPairGuide.background6": "#${colors.base01}00",
  		//"editorCommentsWidget.rangeActiveBackground": "#${colors.base02}1a",
  		//"editorCommentsWidget.rangeActiveBorder": "#${colors.base02}66",
  		//"editorCommentsWidget.rangeBackground": "#${colors.base02}1a",
  		//"editorCommentsWidget.rangeBorder": "#${colors.base02}66",
  		//"editorCommentsWidget.resolvedBorder": "#${colors.base0D}",
  		//"editorCommentsWidget.unresolvedBorder": "#${colors.base02}",
  		//"editorError.foreground": "#f14c4c",
  		//"editorGhostText.foreground": "#${colors.base05}56",
  		//"editorGroup.dropIntoPromptForeground": "#${colors.base05}",
  		//"editorGutter.addedBackground": "#487e02",
  		//"editorGutter.background": "#${colors.base01}",
  		//"editorGutter.commentGlyphForground": "#${colors.base05}",
  		//"editorGutter.commentRangeForeground": "#${colors.base02}",
  		//"editorGutter.deletedBackground": "#f14c4c",
  		//"editorGutter.foldingControlForeground": "#${colors.base0D}",
  		//"editorGutter.modifiedBackground": "#1b81a8",
  		//"editorHint.foreground": "#eeeeeeb3",
  		//"editorHoverWidget.background": "#${colors.base02}",
  		//"editorHoverWidget.foreground": "#${colors.base05}",
  		//"editorHoverWidget.highlightForeground": "#2aaaff",
  		//"editorHoverWidget.statusBarBackground": "#232323",
  		//"editorInfo.foreground": "#3794ff",
  		//"editorInlayHint.background": "#${colors.base02}cc",
  		//"editorInlayHint.foreground": "#${colors.base05}",
  		//"editorInlayHint.parameterBackground": "#${colors.base02}cc",
  		//"editorInlayHint.parameterForeground": "#${colors.base05}",
  		//"editorInlayHint.typeBackground": "#${colors.base02}cc",
  		//"editorInlayHint.typeForeground": "#${colors.base05}",
  		//"editorLightBulb.foreground": "#ffcc00",
  		//"editorLightBulbAutoFix.foreground": "#75beff",
  		//"editorMarkerNavigation.background": "#${colors.base01}",
  		//"editorMarkerNavigationError.background": "#f14c4c",
  		//"editorMarkerNavigationError.headerBackground": "#f14c4c1a",
  		//"editorMarkerNavigationInfo.background": "#3794ff",
  		//"editorMarkerNavigationInfo.headerBackground": "#3794ff1a",
  		//"editorMarkerNavigationWarning.background": "#cca700",
  		//"editorMarkerNavigationWarning.headerBackground": "#cca7001a",
  		//"editorOverviewRuler.addedForeground": "#487e0299",
  		//"editorOverviewRuler.bracketMatchForeground": "#a0a0a0",
  		//"editorOverviewRuler.commonContentForeground": "#60606066",
  		//"editorOverviewRuler.currentContentForeground": "#40c8ae80",
  		//"editorOverviewRuler.deletedForeground": "#f14c4c99",
  		//"editorOverviewRuler.errorForeground": "#ff1212b3",
  		//"editorOverviewRuler.findMatchForeground": "#d186167e",
  		//"editorOverviewRuler.incomingContentForeground": "#40a6ff80",
  		//"editorOverviewRuler.infoForeground": "#3794ff",
  		//"editorOverviewRuler.modifiedForeground": "#1b81a899",
  		//"editorOverviewRuler.rangeHighlightForeground": "#007acc99",
  		//"editorOverviewRuler.selectionHighlightForeground": "#a0a0a0cc",
  		//"editorOverviewRuler.warningForeground": "#cca700",
  		//"editorOverviewRuler.wordHighlightForeground": "#a0a0a0cc",
  		//"editorOverviewRuler.wordHighlightStrongForeground": "#c0a0c0cc",
  		//"editorOverviewRuler.wordHighlightTextForeground": "#a0a0a0cc",
  		//"editorPane.background": "#${colors.base01}",
  		//"editorStickyScroll.background": "#${colors.base01}",
  		//"editorStickyScrollHover.background": "#2a2d2e",
  		//"editorSuggestWidget.background": "#${colors.base02}",
  		//"editorSuggestWidget.focusHighlightForeground": "#2aaaff",
  		//"editorSuggestWidget.foreground": "#${colors.base05}",
  		//"editorSuggestWidget.highlightForeground": "#2aaaff",
  		//"editorSuggestWidget.selectedBackground": "#${colors.base02}",
  		//"editorSuggestWidget.selectedForeground": "#${colors.base05}",
  		//"editorSuggestWidgetStatus.foreground": "#${colors.base05}80",
  		//"editorUnicodeHighlight.background": "#bd9b0326",
  		//"editorUnicodeHighlight.border": "#bd9b03",
  		//"editorUnnecessaryCode.opacity": "#${colors.base01}aa",
  		//"editorWarning.foreground": "#cca700",
  		//"editorWidget.foreground": "#${colors.base05}",
  		//"extensionBadge.remoteBackground": "#${colors.base02}",
  		//"extensionBadge.remoteForeground": "#${colors.base05}",
  		//"extensionButton.hoverBackground": "#${colors.base01}",
  		//"extensionButton.prominentBackground": "#${colors.base01}",
  		//"extensionButton.prominentForeground": "#${colors.base05}",
  		//"extensionButton.prominentHoverBackground": "#${colors.base01}",
  		//"extensionButton.separator": "#${colors.base05}",
  		//"extensionIcon.preReleaseForeground": "#1d9271",
  		//"extensionIcon.sponsorForeground": "#d758b3",
  		//"extensionIcon.starForeground": "#ff8e00",
  		//"extensionIcon.verifiedForeground": "#${colors.base05}",
  		"gitDecoration.addedResourceForeground": "#${colors.base08}",
  		//"gitDecoration.conflictingResourceForeground": "#e4676b",
  		//"gitDecoration.deletedResourceForeground": "#c74e39",
  		//"gitDecoration.ignoredResourceForeground": "#8c8c8c",
  		"gitDecoration.modifiedResourceForeground": "#${colors.base0A}",
  		"gitDecoration.renamedResourceForeground": "#${colors.base0B}",
  		//"gitDecoration.stageDeletedResourceForeground": "#c74e39",
  		"gitDecoration.stageModifiedResourceForeground": "#${colors.base0A}",
  		//"gitDecoration.submoduleResourceForeground": "#8db9e2",
  		"gitDecoration.untrackedResourceForeground": "#${colors.base0B}",
  		//"input.foreground": "#${colors.base05}",
  		//"input.placeholderForeground": "#${colors.base05}80",
  		//"inputOption.activeBackground": "#${colors.base05}66",
  		//"inputOption.activeBorder": "#007acc",
  		//"inputOption.activeForeground": "#${colors.base05}",
  		//"inputOption.hoverBackground": "#5a5d5e80",
  		//"inputValidation.errorBackground": "#5a1d1d",
  		//"inputValidation.errorBorder": "#be1100",
  		//"inputValidation.infoBackground": "#063b49",
  		//"inputValidation.infoBorder": "#007acc",
  		//"inputValidation.warningBackground": "#352a05",
  		//"inputValidation.warningBorder": "#b89500",
  		//"interactive.activeCodeBorder": "#${colors.base02}",
  		//"interactive.inactiveCodeBorder": "#${colors.base02}",
  		//"keybindingLabel.background": "#8080802b",
  		//"keybindingLabel.border": "#33333399",
  		//"keybindingLabel.bottomBorder": "#44444499",
  		//"keybindingLabel.foreground": "#cccccc",
  		//"keybindingTable.headerBackground": "#${colors.base05}0a",
  		//"keybindingTable.rowsBackground": "#${colors.base05}0a",
  		//"list.activeSelectionForeground": "#${colors.base05}",
  		//"list.deemphasizedForeground": "#8c8c8c",
  		//"list.errorForeground": "#f88070",
  		//"list.filterMatchBackground": "#ea5c0055",
  		//"list.focusHighlightForeground": "#2aaaff",
  		//"list.focusOutline": "#${colors.base05}",
  		//"list.highlightForeground": "#2aaaff",
  		//"list.invalidItemForeground": "#b89500",
  		//"list.warningForeground": "#cca700",
  		//"listFilterWidget.background": "#${colors.base02}",
  		//"listFilterWidget.noMatchesOutline": "#be1100",
  		//"listFilterWidget.outline": "#${colors.base01}00",
  		//"menu.foreground": "#${colors.base05}",
  		//"menu.selectionBackground": "#${colors.base02}",
  		//"menu.selectionForeground": "#${colors.base05}",
  		//"menu.separatorBackground": "#606060",
  		//"menubar.selectionBackground": "#${colors.base01}00",
  		//"menubar.selectionForeground": "#${colors.base0D}",
  		//"merge.commonContentBackground": "#60606029",
  		//"merge.commonHeaderBackground": "#60606066",
  		//"merge.currentContentBackground": "#40c8ae33",
  		//"merge.currentHeaderBackground": "#40c8ae80",
  		//"merge.incomingContentBackground": "#40a6ff33",
  		//"merge.incomingHeaderBackground": "#40a6ff80",
  		//"mergeEditor.change.background": "#9bb95533",
  		//"mergeEditor.change.word.background": "#9ccc2c33",
  		//"mergeEditor.changeBase.background": "#4b1818",
  		//"mergeEditor.changeBase.word.background": "#6f1313",
  		//"mergeEditor.conflict.handled.minimapOverViewRuler": "#adaca8ee",
  		//"mergeEditor.conflict.handledFocused.border": "#c1c1c1cc",
  		//"mergeEditor.conflict.handledUnfocused.border": "#86868649",
  		//"mergeEditor.conflict.input1.background": "#40c8ae33",
  		//"mergeEditor.conflict.input2.background": "#40a6ff33",
  		//"mergeEditor.conflict.unhandled.minimapOverViewRuler": "#fcba03",
  		//"mergeEditor.conflict.unhandledFocused.border": "#ffa600",
  		//"mergeEditor.conflict.unhandledUnfocused.border": "#ffa6007a",
  		//"mergeEditor.conflictingLines.background": "#ffea0047",
  		//"minimap.errorHighlight": "#ff1212b3",
  		//"minimap.findMatchHighlight": "#d18616",
  		//"minimap.foregroundOpacity": "#${colors.base01}",
  		//"minimap.selectionHighlight": "#264f78",
  		//"minimap.selectionOccurrenceHighlight": "#676767",
  		//"minimap.warningHighlight": "#cca700",
  		//"minimapGutter.addedBackground": "#487e02",
  		//"minimapGutter.deletedBackground": "#f14c4c",
  		//"minimapGutter.modifiedBackground": "#1b81a8",
  		//"minimapSlider.activeBackground": "#${colors.base05}22",
  		//"minimapSlider.background": "#${colors.base05}11",
  		//"minimapSlider.hoverBackground": "#${colors.base05}1a",
  		//"notebook.cellBorderColor": "#${colors.base02}",
  		//"notebook.cellEditorBackground": "#${colors.base01}",
  		//"notebook.cellInsertionIndicator": "#${colors.base05}",
  		//"notebook.cellStatusBarItemHoverBackground": "#${colors.base05}26",
  		//"notebook.cellToolbarSeparator": "#80808059",
  		//"notebook.editorBackground": "#${colors.base01}",
  		//"notebook.focusedCellBorder": "#${colors.base05}",
  		//"notebook.focusedEditorBorder": "#${colors.base05}",
  		//"notebook.inactiveFocusedCellBorder": "#${colors.base02}",
  		//"notebook.selectedCellBackground": "#${colors.base02}",
  		//"notebook.selectedCellBorder": "#${colors.base02}",
  		//"notebook.symbolHighlightBackground": "#${colors.base05}0b",
  		//"notebookEditorOverviewRuler.runningCellForeground": "#89d185",
  		//"notebookScrollbarSlider.activeBackground": "#${colors.base05}44",
  		//"notebookScrollbarSlider.background": "#${colors.base05}22",
  		//"notebookScrollbarSlider.hoverBackground": "#${colors.base05}33",
  		//"notebookStatusErrorIcon.foreground": "#ff0000",
  		//"notebookStatusRunningIcon.foreground": "#${colors.base05}",
  		//"notebookStatusSuccessIcon.foreground": "#89d185",
  		//"notificationLink.foreground": "#${colors.base05}",
  		//"notifications.border": "#${colors.base02}",
  		//"notifications.foreground": "#${colors.base05}",
  		//"notificationsErrorIcon.foreground": "#f14c4c",
  		//"notificationsInfoIcon.foreground": "#3794ff",
  		//"notificationsWarningIcon.foreground": "#cca700",
  		//"panelSection.border": "#${colors.base02}",
  		//"panelSection.dropBackground": "#${colors.base02}",
  		//"panelSectionHeader.background": "#80808033",
  		//"panelTitle.inactiveForeground": "#${colors.base05}99",
  		//"peekViewEditor.matchHighlightBackground": "#ff8f0099",
  		//"peekViewEditorGutter.background": "#${colors.base01}",
  		//"peekViewEditorStickScroll.background": "#${colors.base01}",
  		//"peekViewResult.fileForeground": "#${colors.base05}",
  		//"peekViewResult.lineForeground": "#bbbbbb",
  		//"peekViewResult.matchHighlightBackground": "#ea5c004d",
  		//"peekViewResult.selectionForeground": "#${colors.base05}",
  		//"peekViewTitleDescription.foreground": "#ccccccb3",
  		//"peekViewTitleLabel.foreground": "#${colors.base05}",
  		//"pickerGroup.border": "#3f3f46",
  		//"pickerGroup.foreground": "#3794ff",
  		//"ports.iconRunningProcessForeground": "#${colors.base02}",
  		//"problemsErrorIcon.foreground": "#f14c4c",
  		//"problemsInfoIcon.foreground": "#3794ff",
  		//"problemsWarningIcon.foreground": "#cca700",
  		//"quickInput.background": "#${colors.base02}",
  		//"quickInput.foreground": "#${colors.base05}",
  		//"quickInputList.focusBackground": "#${colors.base02}",
  		//"quickInputList.focusForeground": "#${colors.base05}",
  		//"quickInputTitle.background": "#${colors.base05}1b",
  		//"sash.hoverBorder": "#${colors.base05}",
  		//"scm.providerBorder": "#454545",
  		//"searchEditor.findMatchBackground": "#ea5c0038",
  		//"settings.checkboxBackground": "#${colors.base01}",
  		//"settings.checkboxBorder": "#${colors.base05}",
  		//"settings.checkboxForeground": "#${colors.base05}",
  		//"settings.dropdownBackground": "#${colors.base01}",
  		//"settings.dropdownBorder": "#${colors.base01}",
  		//"settings.dropdownForeground": "#${colors.base05}",
  		//"settings.dropdownListBorder": "#${colors.base05}",
  		//"settings.focusedRowBackground": "#${colors.base02}99",
  		//"settings.focusedRowBorder": "#${colors.base05}",
  		//"settings.headerBorder": "#${colors.base02}",
  		//"settings.headerForeground": "#e7e7e7",
  		//"settings.modifiedItemIndicator": "#0c7d9d",
  		//"settings.numberInputBackground": "#${colors.base02}",
  		//"settings.numberInputForeground": "#${colors.base05}",
  		//"settings.rowHoverBackground": "#${colors.base02}4d",
  		//"settings.sashBorder": "#${colors.base02}",
  		//"settings.settingsHeaderHoverForeground": "#e7e7e7b3",
  		//"settings.textInputBackground": "#${colors.base02}",
  		//"settings.textInputForeground": "#${colors.base05}",
  		//"sideBySideEditor.horizontalBorder": "#${colors.base02}",
  		//"sideBySideEditor.verticalBorder": "#${colors.base02}",
  		//"sqltools.currentQueryBg": "#00a2ff20",
  		//"sqltools.currentQueryOutline": "#00a2ff20",
  		//"statusBar.debuggingBackground": "#cc6633",
  		//"statusBar.debuggingBorder": "#${colors.base02}",
  		//"statusBar.debuggingForeground": "#${colors.base0D}",
  		//"statusBar.focusBorder": "#${colors.base0D}",
  		//"statusBar.noFolderBorder": "#${colors.base02}",
  		//"statusBarItem.activeBackground": "#${colors.base05}2e",
  		//"statusBarItem.compactHoverBackground": "#${colors.base05}33",
  		//"statusBarItem.errorBackground": "#990000",
  		//"statusBarItem.errorForeground": "#${colors.base05}",
  		//"statusBarItem.focusBorder": "#${colors.base0D}",
  		//"statusBarItem.hoverBackground": "#${colors.base05}1f",
  		//"statusBarItem.prominentBackground": "#${colors.base01}80",
  		//"statusBarItem.prominentForeground": "#${colors.base0D}",
  		//"statusBarItem.prominentHoverBackground": "#${colors.base01}4d",
  		//"statusBarItem.remoteBackground": "#${colors.base02}",
  		//"statusBarItem.remoteForeground": "#${colors.base05}",
  		//"statusBarItem.warningBackground": "#7a6400",
  		//"statusBarItem.warningForeground": "#${colors.base05}",
  		//"symbolIcon.arrayForeground": "#${colors.base05}",
  		//"symbolIcon.booleanForeground": "#${colors.base05}",
  		//"symbolIcon.classForeground": "#ee9d28",
  		//"symbolIcon.colorForeground": "#${colors.base05}",
  		//"symbolIcon.constantForeground": "#${colors.base05}",
  		//"symbolIcon.constructorForeground": "#b180d7",
  		//"symbolIcon.enumeratorForeground": "#ee9d28",
  		//"symbolIcon.enumeratorMemberForeground": "#75beff",
  		//"symbolIcon.eventForeground": "#ee9d28",
  		//"symbolIcon.fieldForeground": "#75beff",
  		//"symbolIcon.fileForeground": "#${colors.base05}",
  		//"symbolIcon.folderForeground": "#${colors.base05}",
  		//"symbolIcon.functionForeground": "#b180d7",
  		//"symbolIcon.interfaceForeground": "#75beff",
  		//"symbolIcon.keyForeground": "#${colors.base05}",
  		//"symbolIcon.keywordForeground": "#${colors.base05}",
  		//"symbolIcon.methodForeground": "#b180d7",
  		//"symbolIcon.moduleForeground": "#${colors.base05}",
  		//"symbolIcon.namespaceForeground": "#${colors.base05}",
  		//"symbolIcon.nullForeground": "#${colors.base05}",
  		//"symbolIcon.numberForeground": "#${colors.base05}",
  		//"symbolIcon.objectForeground": "#${colors.base05}",
  		//"symbolIcon.operatorForeground": "#${colors.base05}",
  		//"symbolIcon.packageForeground": "#${colors.base05}",
  		//"symbolIcon.propertyForeground": "#${colors.base05}",
  		//"symbolIcon.referenceForeground": "#${colors.base05}",
  		//"symbolIcon.snippetForeground": "#${colors.base05}",
  		//"symbolIcon.stringForeground": "#${colors.base05}",
  		//"symbolIcon.structForeground": "#${colors.base05}",
  		//"symbolIcon.textForeground": "#${colors.base05}",
  		//"symbolIcon.typeParameterForeground": "#${colors.base05}",
  		//"symbolIcon.unitForeground": "#${colors.base05}",
  		//"symbolIcon.variableForeground": "#75beff",
  		//"tab.activeModifiedBorder": "#3399cc",
  		//"tab.border": "#252526",
  		//"tab.inactiveModifiedBorder": "#3399cc80",
  		//"tab.lastPinnedBorder": "#${colors.base02}",
  		//"tab.unfocusedActiveForeground": "#${colors.base05}80",
  		//"tab.unfocusedActiveModifiedBorder": "#3399cc80",
  		//"tab.unfocusedInactiveBackground": "#${colors.base01}",
  		//"tab.unfocusedInactiveForeground": "#${colors.base0D}80",
  		//"tab.unfocusedInactiveModifiedBorder": "#3399cc40",
  		//"terminal.ansiBlack": "#${colors.base01}",
  		//"terminal.ansiBlue": "#2472c8",
  		//"terminal.ansiBrightBlack": "#666666",
  		//"terminal.ansiBrightBlue": "#3b8eea",
  		//"terminal.ansiBrightCyan": "#29b8db",
  		//"terminal.ansiBrightGreen": "#23d18b",
  		//"terminal.ansiBrightMagenta": "#d670d6",
  		//"terminal.ansiBrightRed": "#f14c4c",
  		//"terminal.ansiBrightWhite": "#e5e5e5",
  		//"terminal.ansiBrightYellow": "#f5f543",
  		//"terminal.ansiCyan": "#11a8cd",
  		//"terminal.ansiGreen": "#0dbc79",
  		//"terminal.ansiMagenta": "#bc3fbc",
  		//"terminal.ansiRed": "#cd3131",
  		//"terminal.ansiWhite": "#e5e5e5",
  		//"terminal.ansiYellow": "#e5e510",
  		//"terminal.border": "#${colors.base02}",
  		//"terminal.findMatchBackground": "#515c6a",
  		//"terminal.findMatchHighlightBackground": "#ea5c0055",
  		//"terminal.foreground": "#cccccc",
  		//"terminalCommandDecoration.defaultBackground": "#${colors.base05}40",
  		//"terminalCommandDecoration.errorBackground": "#f14c4c",
  		//"terminalCommandDecoration.successBackground": "#1b81a8",
  		//"terminalOverviewRuler.cursorForeground": "#a0a0a0cc",
  		//"terminalOverviewRuler.findMatchForeground": "#d186167e",
  		//"testing.iconErrored": "#f14c4c",
  		//"testing.iconFailed": "#f14c4c",
  		//"testing.iconPassed": "#${colors.base0B}",
  		//"testing.iconQueued": "#cca700",
  		//"testing.iconSkipped": "#848484",
  		//"testing.iconUnset": "#848484",
  		//"testing.message.error.decorationForeground": "#f14c4c",
  		//"testing.message.error.lineBackground": "#ff000033",
  		//"testing.message.info.decorationForeground": "#${colors.base05}80",
  		//"testing.peekBorder": "#f14c4c",
  		//"testing.peekHeaderBackground": "#f14c4c1a",
  		//"testing.runAction": "#${colors.base0B}",
  		//"titleBar.inactiveForeground": "#${colors.base0D}99",
  		//"tree.inactiveIndentGuidesStroke": "#${colors.base02}66",
  		//"tree.tableColumnsBorder": "#cccccc20",
  		//"tree.tableOddRowsBackground": "#${colors.base05}0a",
  		//"walkthrough.stepTitle.foreground": "#${colors.base05}",
  		//"welcomeOverlay.background": "#${colors.base01}85",
  		//"welcomePage.progress.background": "#${colors.base02}",
  		//"welcomePage.progress.foreground": "#${colors.base05}",
  		//"welcomePage.tileBackground": "#${colors.base02}",
  		//"welcomePage.tileBorder": "#${colors.base05}1a",
  		//"welcomePage.tileHoverBackground": "#232323",
  		//"activityBar.activeBackground": null,
  		//"activityBar.activeFocusBorder": null,
  		//"activityBar.border": null,
  		//"contrastActiveBorder": null,
  		//"contrastBorder": null,
  		//"debugToolBar.border": null,
  		//"diffEditor.border": null,
  		//"diffEditor.insertedTextBorder": null,
  		//"diffEditor.removedTextBorder": null,
  		//"diffEditorGutter.insertedLineBackground": null,
  		//"diffEditorGutter.removedLineBackground": null,
  		//"diffEditorOverview.insertedForeground": null,
  		//"diffEditorOverview.removedForeground": null,
  		//"editor.findMatchBorder": null,
  		//"editor.findMatchHighlightBorder": null,
  		//"editor.findRangeHighlightBorder": null,
  		//"editor.rangeHighlightBorder": null,
  		//"editor.selectionHighlightBorder": null,
  		//"editor.snippetFinalTabstopHighlightBackground": null,
  		//"editor.snippetTabstopHighlightBorder": null,
  		//"editor.symbolHighlightBorder": null,
  		//"editorCursor.background": null,
  		//"editorError.background": null,
  		//"editorError.border": null,
  		//"editorGhostText.background": null,
  		//"editorGhostText.border": null,
  		//"editorGroup.dropIntoPromptBorder": null,
  		//"editorGroup.emptyBackground": null,
  		//"editorGroup.focusedEmptyBorder": null,
  		//"editorGroupHeader.border": null,
  		//"editorGroupHeader.tabsBorder": null,
  		//"editorHint.border": null,
  		//"editorInfo.background": null,
  		//"editorInfo.border": null,
  		//"editorLineNumber.dimmedForeground": null,
  		//"editorSuggestWidget.selectedIconForeground": null,
  		//"editorUnnecessaryCode.border": null,
  		//"editorWarning.background": null,
  		//"editorWarning.border": null,
  		//"editorWidget.resizeBorder": null,
  		//"input.border": null,
  		//"inputValidation.errorForeground": null,
  		//"inputValidation.infoForeground": null,
  		//"inputValidation.warningForeground": null,
  		//"list.activeSelectionIconForeground": null,
  		//"list.filterMatchBorder": null,
  		//"list.focusAndSelectionOutline": null,
  		//"list.focusForeground": null,
  		//"list.hoverForeground": null,
  		//"list.inactiveFocusOutline": null,
  		//"list.inactiveSelectionForeground": null,
  		//"list.inactiveSelectionIconForeground": null,
  		//"menu.border": null,
  		//"menu.selectionBorder": null,
  		//"menubar.selectionBorder": null,
  		//"merge.border": null,
  		//"minimap.background": null,
  		//"notebook.cellHoverBackground": null,
  		//"notebook.focusedCellBackground": null,
  		//"notebook.inactiveSelectedCellBorder": null,
  		//"notebook.outputContainerBackgroundColor": null,
  		//"notebook.outputContainerBorderColor": null,
  		//"notificationCenter.border": null,
  		//"notificationCenterHeader.foreground": null,
  		//"notificationToast.border": null,
  		//"panelInput.border": null,
  		//"panelSectionHeader.border": null,
  		//"panelSectionHeader.foreground": null,
  		//"peekViewEditor.matchHighlightBorder": null,
  		//"quickInput.list.focusBackground": null,
  		//"quickInputList.focusIconForeground": null,
  		//"searchEditor.findMatchBorder": null,
  		//"searchEditor.textInputBorder": null,
  		//"selection.background": null,
  		//"settings.numberInputBorder": null,
  		//"settings.textInputBorder": null,
  		//"sideBar.border": null,
  		//"sideBar.foreground": null,
  		//"sideBarSectionHeader.border": null,
  		//"tab.activeBorder": null,
  		//"tab.activeBorderTop": null,
  		//"tab.hoverBackground": null,
  		//"tab.hoverBorder": null,
  		//"tab.hoverForeground": null,
  		//"tab.unfocusedActiveBorder": null,
  		//"tab.unfocusedActiveBorderTop": null,
  		//"tab.unfocusedHoverBackground": null,
  		//"tab.unfocusedHoverBorder": null,
  		//"tab.unfocusedHoverForeground": null,
  		//"terminal.findMatchBorder": null,
  		//"terminal.findMatchHighlightBorder": null,
  		//"terminal.selectionForeground": null,
  		//"terminal.tab.activeBorder": null,
  		//"terminalCursor.background": null,
  		//"testing.message.info.lineBackground": null,
  		//"walkThrough.embeddedEditorBackground": null,
  		//"welcomePage.background": null,
  		//"widget.border": null,
  		//"window.activeBorder": null,
  		//"window.inactiveBorder": null
  	},
  	"tokenColors": [
  		{
  			"scope": [
  				"comment",
  				"punctuation.definition.comment"
  			],
  			"settings": {
  				"foreground": "#${colors.base0B}"
  			}
  		},
  		{
  			"scope": [
  				"variable",
  				"string constant.other.placeholder"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}"
  			}
  		},
  		{
  			"scope": [
  				"constant.other.color"
  			],
  			"settings": {
  				"foreground": "#${colors.base08}"
  			}
  		},
  		{
  			"scope": [
  				"invalid",
  				"invalid.illegal"
  			],
  			"settings": {
  				"foreground": "#974b46"
  			}
  		},
  		{
  			"scope": [
  				"keyword",
  				"storage.type",
  				"storage.modifier"
  			],
  			"settings": {
  				"foreground": "#${colors.base08}"
  			}
  		},
  		{
  			"scope": [
  				"keyword.control",
  				"constant.other.color",
  				"punctuation",
  				"meta.tag",
  				"punctuation.definition.tag",
  				"punctuation.separator.inheritance.php",
  				"punctuation.definition.tag.html",
  				"punctuation.definition.tag.begin.html",
  				"punctuation.definition.tag.end.html",
  				"punctuation.section.embedded",
  				"keyword.other.template",
  				"keyword.other.substitution"
  			],
  			"settings": {
  				"foreground": "#${colors.base08}"
  			}
  		},
  		{
  			"scope": [
  				"entity.name.tag",
  				"meta.tag.sgml",
  				"markup.deleted.git_gutter"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}"
  			}
  		},
  		{
  			"scope": [
  				"entity.name.function",
  				"meta.function-call",
  				"variable.function",
  				"support.function",
  				"keyword.other.special-method"
  			],
  			"settings": {
  				"foreground": "#${colors.base0D}"
  			}
  		},
  		{
  			"scope": [
  				"meta.block variable.other"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}"
  			}
  		},
  		{
  			"scope": [
  				"support.other.variable",
  				"string.other.link"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}"
  			}
  		},
  		{
  			"scope": [
  				"constant.numeric",
  				"constant.language",
  				"support.constant",
  				"constant.character",
  				"constant.escape",
  				"variable.parameter",
  				"keyword.other.unit",
  				"keyword.other"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}"
  			}
  		},
  		{
  			"scope": [
  				"string",
  				"constant.other.symbol",
  				"constant.other.key",
  				"entity.other.inherited-class",
  				"markup.heading",
  				"markup.inserted.git_gutter",
  				"meta.group.braces.curly constant.other.object.key.js string.unquoted.label.js"
  			],
  			"settings": {
  				"foreground": "#${colors.base0A}"
  			}
  		},
  		{
  			"scope": [
  				"entity.name",
  				"support.type",
  				"support.class",
  				"support.other.namespace.use.php",
  				"meta.use.php",
  				"support.other.namespace.php",
  				"markup.changed.git_gutter",
  				"support.type.sys-types"
  			],
  			"settings": {
  				"foreground": "#${colors.base08}"
  			}
  		},
  		{
  			"scope": [
  				"support.type"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}"
  			}
  		},
  		{
  			"scope": [
  				"source.css support.type.property-name",
  				"source.sass support.type.property-name",
  				"source.scss support.type.property-name",
  				"source.less support.type.property-name",
  				"source.stylus support.type.property-name",
  				"source.postcss support.type.property-name"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}"
  			}
  		},
  		{
  			"scope": [
  				"entity.name.module.js",
  				"variable.import.parameter.js",
  				"variable.other.class.js"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}"
  			}
  		},
  		{
  			"scope": [
  				"variable.language"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}"
  			}
  		},
  		{
  			"scope": [
  				"entity.name.method.js"
  			],
  			"settings": {
  				"foreground": "#${colors.base0D}"
  			}
  		},
  		{
  			"scope": [
  				"meta.class-method.js entity.name.function.js",
  				"variable.function.constructor"
  			],
  			"settings": {
  				"foreground": "#${colors.base0D}"
  			}
  		},
  		{
  			"scope": [
  				"entity.other.attribute-name"
  			],
  			"settings": {
  				"foreground": "#${colors.base08}"
  			}
  		},
  		{
  			"scope": [
  				"text.html.basic entity.other.attribute-name.html",
  				"text.html.basic entity.other.attribute-name"
  			],
  			"settings": {
  				"foreground": "#${colors.base08}"
  			}
  		},
  		{
  			"scope": [
  				"entity.other.attribute-name.class"
  			],
  			"settings": {
  				"foreground": "#${colors.base08}"
  			}
  		},
  		{
  			"scope": [
  				"source.sass keyword.control"
  			],
  			"settings": {
  				"foreground": "#${colors.base08}"
  			}
  		},
  		{
  			"scope": [
  				"markup.inserted"
  			],
  			"settings": {
  				"foreground": "#C3E88D"
  			}
  		},
  		{
  			"scope": [
  				"markup.deleted"
  			],
  			"settings": {
  				"foreground": "#FF5370"
  			}
  		},
  		{
  			"scope": [
  				"markup.changed"
  			],
  			"settings": {
  				"foreground": "#C792EA"
  			}
  		},
  		{
  			"scope": [
  				"string.regexp"
  			],
  			"settings": {
  				"foreground": "#${colors.base0A}"
  			}
  		},
  		{
  			"scope": [
  				"constant.character.escape"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}"
  			}
  		},
  		{
  			"scope": [
  				"*url*",
  				"*link*",
  				"*uri*"
  			],
  			"settings": {
  				"fontStyle": "underline"
  			}
  		},
  		{
  			"scope": [
  				"tag.decorator.js entity.name.tag.js",
  				"tag.decorator.js punctuation.definition.tag.js"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}"
  			}
  		},
  		{
  			"scope": [
  				"source.js constant.other.object.key.js string.unquoted.label.js"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}"
  			}
  		},
  		{
  			"scope": [
  				"source.json meta.structure.dictionary.json support.type.property-name.json"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}"
  			}
  		},
  		{
  			"scope": [
  				"source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
  			],
  			"settings": {
  				"foreground": "#${colors.base0D}"
  			}
  		},
  		{
  			"scope": [
  				"source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}"
  			}
  		},
  		{
  			"scope": [
  				"source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
  			],
  			"settings": {
  				"foreground": "#${colors.base0D}"
  			}
  		},
  		{
  			"scope": [
  				"source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}"
  			}
  		},
  		{
  			"scope": [
  				"source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
  			],
  			"settings": {
  				"foreground": "#${colors.base0D}"
  			}
  		},
  		{
  			"scope": [
  				"source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}"
  			}
  		},
  		{
  			"scope": [
  				"source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
  			],
  			"settings": {
  				"foreground": "#${colors.base0D}"
  			}
  		},
  		{
  			"scope": [
  				"source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}"
  			}
  		},
  		{
  			"scope": [
  				"text.html.markdown",
  				"punctuation.definition.list_item.markdown"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}"
  			}
  		},
  		{
  			"scope": [
  				"text.html.markdown markup.inline.raw.markdown"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}"
  			}
  		},
  		{
  			"scope": [
  				"text.html.markdown markup.inline.raw.markdown punctuation.definition.raw.markdown"
  			],
  			"settings": {
  				"foreground": "#${colors.base08}"
  			}
  		},
  		{
  			"scope": [
  				"markdown.heading",
  				"markup.heading | markup.heading entity.name",
  				"markup.heading.markdown punctuation.definition.heading.markdown"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}"
  			}
  		},
  		{
  			"scope": [
  				"markup.italic"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}",
  				"fontStyle": "italic"
  			}
  		},
  		{
  			"scope": [
  				"markup.bold",
  				"markup.bold string"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}",
  				"fontStyle": "bold"
  			}
  		},
  		{
  			"scope": [
  				"markup.bold markup.italic",
  				"markup.italic markup.bold",
  				"markup.quote markup.bold",
  				"markup.bold markup.italic string",
  				"markup.italic markup.bold string",
  				"markup.quote markup.bold string"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}",
  				"fontStyle": "bold"
  			}
  		},
  		{
  			"scope": [
  				"markup.underline"
  			],
  			"settings": {
  				"foreground": "#${colors.base0A}",
  				"fontStyle": "underline"
  			}
  		},
  		{
  			"scope": [
  				"markup.quote"
  			],
  			"settings": {
  				"foreground": "#${colors.base0D}"
  			}
  		},
  		{
  			"scope": [
  				"string.other.link.title.markdown"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}"
  			}
  		},
  		{
  			"scope": [
  				"string.other.link.description.title.markdown"
  			],
  			"settings": {
  				"foreground": "#${colors.base0A}"
  			}
  		},
  		{
  			"scope": [
  				"constant.other.reference.link.markdown"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}"
  			}
  		},
  		{
  			"scope": [
  				"markup.raw.block"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}"
  			}
  		},
  		{
  			"scope": [
  				"markup.raw.block.fenced.markdown",
  				"variable.language.fenced.markdown",
  				"punctuation.section.class.end"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}"
  			}
  		},
  		{
  			"scope": [
  				"variable.language.fenced.markdown"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}"
  			}
  		},
  		{
  			"scope": [
  				"meta.separator"
  			],
  			"settings": {
  				"foreground": "#${colors.base08}",
  				"fontStyle": "bold"
  			}
  		},
  		{
  			"scope": [
  				"markup.table"
  			],
  			"settings": {
  				"foreground": "#${colors.base08}"
  			}
  		},
  		{
  			"scope": [
  				"support.type.property-name.table"
  			],
  			"settings": {
  				"foreground": "#${colors.base08}"
  			}
  		},
  		{
  			"scope": [
  				"support.type.property-name.array"
  			],
  			"settings": {
  				"foreground": "#${colors.base05}"
  			}
  		},
  		{
  			"scope": "token.info-token",
  			"settings": {
  				"foreground": "#6796E6"
  			}
  		},
  		{
  			"scope": "token.warn-token",
  			"settings": {
  				"foreground": "#CD9731"
  			}
  		},
  		{
  			"scope": "token.error-token",
  			"settings": {
  				"foreground": "#F44747"
  			}
  		},
  		{
  			"scope": "token.debug-token",
  			"settings": {
  				"foreground": "#B267E6"
  			}
  		}
  	]
  }
''
