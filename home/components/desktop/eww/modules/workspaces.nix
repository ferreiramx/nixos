{ inputs, vars, ... }: {
  xdg.configFile."eww/modules/workspaces.yuck".text = ''
      (defwidget workspaces []
      (eventbox
    		:onscroll "echo {} | sed -e \"s/up/-1/g\" -e \"s/down/+1/g\" | xargs hyprctl dispatch workspace"
    		(box
    			:class "module workspaces"
    			:spacing 5
    		  (for ws in workspace
    		    (button
    					:onclick "hyprctl dispatch workspace ''${ws.number}"
    					:class "ws icon"
    					:style "color: ''${ws.color};"
    					; :tooltip {ws.tooltip}
    					"")))))
  '';
}
