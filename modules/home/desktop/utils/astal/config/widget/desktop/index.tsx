import Astal from "gi://Astal?version=3.0";
import AstalHyprland from "gi://AstalHyprland?version=0.1";
import Gdk from "gi://Gdk?version=3.0";
import Gtk from "gi://Gtk?version=3.0";
import css from "inline:./desktop.scss";
import { style } from "lib/style";

export function Desktop(monitor: Gdk.Monitor) {
  const hypr = AstalHyprland.get_default();
  const windowname = `desktop${monitor.display.get_n_monitors()}`;

  style(css);

  return (
    <window
      gdkmonitor={monitor}
      namespace={windowname}
      name={windowname}
      anchor={
        Astal.WindowAnchor.TOP |
        Astal.WindowAnchor.LEFT |
        Astal.WindowAnchor.RIGHT |
        Astal.WindowAnchor.BOTTOM
      }
      layer={Astal.Layer.BACKGROUND}
      exclusivity={Astal.Exclusivity.IGNORE}
      keymode={Astal.Keymode.NONE}
      className={"desktop"}
    >
      <eventbox
        setup={(self) => {
          self.drag_dest_set(Gtk.DestDefaults.ALL, [], Gdk.DragAction.COPY);
          self.drag_dest_add_text_targets();
        }}
      >
        <box className={"desktop-box"}>
          <label
            valign={Gtk.Align.END}
            halign={Gtk.Align.CENTER}
            hexpand
            vexpand
            setup={(self) => {
              hypr.message_async("splash", (_, task) => {
                self.label = hypr.message_finish(task);
              });
            }}
          />
        </box>
      </eventbox>
    </window>
  );
}
