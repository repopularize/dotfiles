import { bind, exec } from "astal";
import { Astal, Gtk } from "astal/gtk3";
import Hyprland from "gi://AstalHyprland";
import Gdk from "gi://Gdk?version=3.0";
import { rem } from "lib/utils";

const MIN_WORKSPACES = 5;

export function Workspaces() {
  const hypr = Hyprland.get_default();

  const dispatch = (arg: string | number) => {
    exec(`hyprctl dispatch workspace ${arg}`);
  };

  return (
    <box
      hexpand
      vexpand={false}
      className={"workspaces-box"}
      heightRequest={rem(35)}
    >
      <box
        className="workspaces"
        hexpand
        halign={Gtk.Align.CENTER}
        valign={Gtk.Align.CENTER}
      >
        {[...Array(MIN_WORKSPACES)].map((_, i) => {
          return (
            <box
              className={bind(hypr, "focusedWorkspace").as((fw) =>
                hypr.get_workspace(i + 1) === fw
                  ? "workspace active"
                  : "workspace"
              )}
              hexpand
              visible
            />
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
    </box>
  );
}
