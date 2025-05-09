{ scheme }:
let
  colors = scheme.palette;
in
{
  "$schema" = "vscode://schemas/color-theme";
  type = "dark";
  name = "nix-colors";
  colors = {
    "activityBar.background" = "#${colors.base01}";
    "activityBar.border" = "#${colors.base03}";
    "activityBar.dropBorder" = "#${colors.base03}";
    "activityBar.foreground" = "#${colors.base05}";
    "activityBarBadge.background" = "#${colors.base00}";
    "activityBarBadge.foreground" = "#${colors.base04}";
    "badge.background" = "#${colors.base01}";
    "badge.foreground" = "#${colors.base04}";
    "button.background" = "#${colors.base01}";
    "button.border" = "#${colors.base00}";
    "button.foreground" = "#${colors.base05}";
    "button.hoverBackground" = "#${colors.base02}";
    "button.secondaryBackground" = "#${colors.base02}";
    "button.secondaryForeground" = "#${colors.base05}";
    "button.separator" = "#${colors.base04}";
    "checkbox.background" = "#${colors.base01}";
    "checkbox.border" = "#${colors.base03}";
    "checkbox.foreground" = "#${colors.base04}";
    "checkbox.selectBackground" = "#${colors.base02}";
    "checkbox.selectBorder" = "#${colors.base03}";
    "dropdown.background" = "#${colors.base01}";
    "dropdown.foreground" = "#${colors.base04}";
    "dropdown.listBackground" = "#${colors.base02}";
    "editor.background" = "#${colors.base00}";
    "editor.foldBackground" = "#${colors.base01}";
    "editor.foreground" = "#${colors.base05}";
    "editor.hoverHighlightBackground" = "#${colors.base02}";
    "editor.inactiveSelectionBackground" = "#${colors.base03}";
    "editor.lineHighlightBackground" = "#${colors.base01}";
    "editor.lineHighlightBorder" = "#${colors.base03}";
    "editor.selectionBackground" = "#${colors.base02}";
    "editor.selectionForeground" = "#${colors.base05}";
    "editor.selectionHighlightBackground" = "#${colors.base02}44";
    "editorBracketMatch.background" = "#${colors.base0A}44";
    "editorBracketMatch.border" = "#${colors.base03}";
    "editorCodeLens.foreground" = "#${colors.base05}";
    "editorCursor.foreground" = "#${colors.base05}";
    "editorGroup.border" = "#${colors.base03}";
    "editorGroup.dropBackground" = "#${colors.base02}";
    "editorGroupHeader.noTabsBackground" = "#${colors.base00}";
    "editorGroupHeader.tabsBackground" = "#${colors.base01}";
    "editorHoverWidget.border" = "#${colors.base03}00";
    "editorIndentGuide.activeBackground" = "#${colors.base02}";
    "editorIndentGuide.background" = "#${colors.base02}";
    "editorLineNumber.activeForeground" = "#${colors.base05}";
    "editorLineNumber.foreground" = "#${colors.base03}";
    "editorLink.activeForeground" = "#${colors.base0E}";
    "editorOverviewRuler.background" = "#${colors.base01}";
    "editorOverviewRuler.border" = "#${colors.base03}";
    "editorRuler.foreground" = "#${colors.base02}";
    "editorSuggestWidget.border" = "#${colors.base03}00";
    "editorWhitespace.foreground" = "#${colors.base02}";
    "editorWidget.background" = "#${colors.base02}";
    "editorWidget.border" = "#${colors.base03}";
    "errorForeground" = "#974b46";
    "extensionButton.background" = "#${colors.base02}";
    "extensionButton.foreground" = "#${colors.base05}";
    "focusBorder" = "#${colors.base03}";
    "foreground" = "#${colors.base05}";
    "icon.foreground" = "#${colors.base05}";
    "input.background" = "#${colors.base00}";
    "input.border" = "#${colors.base03}";
    "list.activeSelectionBackground" = "#${colors.base03}";
    "list.dropBackground" = "#${colors.base01}";
    "list.focusBackground" = "#${colors.base03}";
    "list.hoverBackground" = "#${colors.base03}";
    "list.inactiveFocusBackground" = "#${colors.base01}";
    "list.inactiveSelectionBackground" = "#${colors.base01}";
    "listFilterWidget.shadow" = "#${colors.base01}00";
    "menu.background" = "#${colors.base00}";
    "notificationCenterHeader.background" = "#${colors.base01}";
    "notifications.background" = "#${colors.base02}";
    "panel.background" = "#${colors.base00}";
    "panel.border" = "#${colors.base03}";
    "panel.dropBorder" = "#${colors.base03}";
    "panelTitle.activeBorder" = "#${colors.base03}";
    "panelTitle.activeForeground" = "#${colors.base05}";
    "peekView.border" = "#${colors.base03}";
    "peekViewEditor.background" = "#${colors.base01}";
    "peekViewResult.background" = "#${colors.base02}";
    "peekViewResult.selectionBackground" = "#${colors.base02}";
    "peekViewTitle.background" = "#${colors.base02}";
    "progressBar.background" = "#${colors.base05}";
    "scrollbar.shadow" = "#${colors.base01}00";
    "scrollbarSlider.activeBackground" = "#${colors.base05}44";
    "scrollbarSlider.background" = "#${colors.base00}22";
    "scrollbarSlider.hoverBackground" = "#${colors.base05}33";
    "sideBar.background" = "#${colors.base00}";
    "sideBar.border" = "#${colors.base03}";
    "sideBar.dropBackground" = "#${colors.base02}";
    "sideBarSectionHeader.background" = "#${colors.base01}";
    "sideBarSectionHeader.foreground" = "#${colors.base04}";
    "sideBarSectionHeader.border" = "#${colors.base03}";
    "sideBarTitle.foreground" = "#${colors.base04}";
    "statusBar.background" = "#${colors.base01}";
    "statusBar.border" = "#${colors.base03}";
    "statusBar.foreground" = "#${colors.base04}";
    "statusBar.noFolderBackground" = "#${colors.base01}";
    "statusBar.noFolderForeground" = "#${colors.base04}";
    "statusBarItem.remoteBackground" = "#${colors.base01}";
    "statusBarItem.remoteForeground" = "#${colors.base05}";
    "tab.activeBackground" = "#${colors.base00}";
    "tab.activeForeground" = "#${colors.base05}";
    "tab.inactiveBackground" = "#${colors.base01}";
    "tab.inactiveForeground" = "#${colors.base04}";
    "tab.unfocusedActiveBackground" = "#${colors.base02}";
    "terminal.background" = "#${colors.base00}";
    "terminal.dropBackground" = "#${colors.base01}";
    "terminal.inactiveSelectionBackground" = "#${colors.base02}";
    "terminal.selectionBackground" = "#${colors.base02}";
    "terminalCursor.foreground" = "#${colors.base05}";
    "textBlockQuote.background" = "#${colors.base02}";
    "textBlockQuote.border" = "#${colors.base03}";
    "textCodeBlock.background" = "#${colors.base01}";
    "textLink.activeForeground" = "#${colors.base05}";
    "textLink.foreground" = "#${colors.base05}";
    "textPreformat.foreground" = "#${colors.base0D}";
    "textSeparator.foreground" = "#${colors.base0D}";
    "titleBar.activeBackground" = "#${colors.base01}";
    "titleBar.activeForeground" = "#${colors.base0D}";
    "titleBar.border" = "#${colors.base03}";
    "titleBar.inactiveBackground" = "#${colors.base01}";
    "toolbar.activeBackground" = "#${colors.base01}00";
    "toolbar.hoverBackground" = "#${colors.base01}00";
    "toolbar.hoverOutline" = "#${colors.base01}00";
    "tree.indentGuidesStroke" = "#${colors.base02}";
    "widget.shadow" = "#${colors.base01}00";
    "gitDecoration.addedResourceForeground" = "#${colors.base0B}";
    "gitDecoration.conflictingResourceForeground" = "#e4676b";
    "gitDecoration.deletedResourceForeground" = "#c74e39";
    "gitDecoration.ignoredResourceForeground" = "#${colors.base03}";
    "gitDecoration.modifiedResourceForeground" = "#${colors.base09}";
    "gitDecoration.renamedResourceForeground" = "#${colors.base0C}";
    "gitDecoration.stageDeletedResourceForeground" = "#c74e39";
    "gitDecoration.stageModifiedResourceForeground" = "#${colors.base0A}";
    "gitDecoration.submoduleResourceForeground" = "#8db9e2";
    "gitDecoration.untrackedResourceForeground" = "#${colors.base0E}";
  };
  tokenColors = [
    {
      scope = [
        "comment"
        "comment.line.number-sign.python"
        "punctuation.definition.comment.python"
      ];
      settings = {
        foreground = "#${colors.base03}";
      };
    }
    {
      scope = [
        "operator"
        "keyword.operator"
      ];
      settings = {
        foreground = "#${colors.base05}";
      };
    }
    {
      scope = [
        "punctuation"
        "constant.character.format.placeholder"
        "other"
        "meta.other"
        "punctuation.definition.list.nix"
      ];
      settings = {
        foreground = "#${colors.base07}";
      };
    }
    {
      scope = [
        "parameter"
        "variable"
      ];
      settings = {
        foreground = "#${colors.base08}";
      };
    }
    {
      scope = [
        "number"
        "constant"
      ];
      settings = {
        foreground = "#${colors.base09}";
      };
    }
    {
      scope = [
        "class"
        "struct"
      ];
      settings = {
        foreground = "#${colors.base0A}";
      };
    }
    {
      scope = [
        "string"
        "macro"
        "label"
      ];
      settings = {
        foreground = "#${colors.base0B}";
      };
    }
    {
      scope = [
        "enum"
        "decorator"
        "entity.name.function.decorator"
        "regexp"
      ];
      settings = {
        foreground = "#${colors.base0C}";
      };
    }
    {
      scope = [
        "property"
        "enumMember"
        "event"
        "function"
        "method"
        "entity.other.attribute-name.multipart.nix"
        "variable.parameter.name.nix"
        "support.type.property-name.json"
        "meta.function-call"
        "meta.function"
        "entity.name.function"
        "entity.name.tag"
        "constant.other.table-name"
      ];
      settings = {
        foreground = "#${colors.base0D}";
      };
    }
    {
      scope = [
        "keyword"
        "namespace"
        "interface"
        "typeParameter"
        "type"
        "storage.type.function"
        "constant.other.database-name"
      ];
      settings = {
        foreground = "#${colors.base0E}";
      };
    }
    {
      scope = [
        "invalid"
      ];
      settings = {
        foreground = "#974b46";
      };
    }
    {
      scope = [
        "*url*"
        "*link*"
        "*uri*"
      ];
      settings = {
        fontStyle = "underline";
      };
    }
    {
      scope = [
        "markup.bold markup.italic"
        "markup.italic markup.bold"
        "markup.quote markup.bold"
        "markup.bold markup.italic string"
        "markup.italic markup.bold string"
        "markup.quote markup.bold string"
      ];
      settings = {
        fontStyle = "bold";
      };
    }
    {
      scope = "token.info-token";
      settings = {
        foreground = "#6796E6";
      };
    }
    {
      scope = "token.warn-token";
      settings = {
        foreground = "#CD9731";
      };
    }
    {
      scope = "token.error-token";
      settings = {
        foreground = "#F44747";
      };
    }
    {
      scope = "token.debug-token";
      settings = {
        foreground = "#B267E6";
      };
    }
  ];
}
