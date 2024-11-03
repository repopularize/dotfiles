import { bind, exec } from "astal";
import Hyprland from "gi://AstalHyprland";
import Gdk from "gi://Gdk?version=3.0";

const MIN_WORKSPACES = 5;

export function Workspaces() {
  const hypr = Hyprland.get_default();

  const dispatch = (arg: string | number) => {
    exec(`hyprctl dispatch workspace ${arg}`);
  };

  return (
    <box className="workspaces">
      {[...Array(MIN_WORKSPACES)].map((_, i) => {
        return (
          <box
            className={bind(hypr, "focusedWorkspace").as((fw) =>
              hypr.get_workspace(i + 1) === fw ? "workspace active" : "workspace"
            )}
            vexpand
            visible
          ></box>
        );
      })}

      {/* {bind(hypr, "workspaces").as((wss) =>
        wss
          .sort((a, b) => a.id - b.id)
          .map((ws) => (
            <box
              className={bind(hypr, "focusedWorkspace").as((fw) =>
                ws === fw ? "workspace active" : "workspace"
              )}
              vexpand
              visible
            ></box>
          ))
      )} */}
    </box>
  );
}
