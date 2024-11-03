import { Astal, Gtk, Gdk } from "astal/gtk3";
import { Wifi, Tray, Audio, Mpris, Clock, Workspaces } from "./buttons";
import { style } from "../../lib/style";
import css from "inline:./bar.scss";

export function Bar(monitor: Gdk.Monitor) {
  const anchor =
    Astal.WindowAnchor.TOP | Astal.WindowAnchor.LEFT | Astal.WindowAnchor.RIGHT;

  style(css);

  return (
    <window
      className="bar"
      gdkmonitor={monitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={anchor}
    >
      <centerbox className={"bar-box"}>
        <box hexpand halign={Gtk.Align.START}>
          <Tray />
          <Workspaces />
          {/* <FocusedClient /> */}
        </box>
        <box></box>
        <box hexpand halign={Gtk.Align.END}>
          <Mpris />
          <Audio />
          <box
            hexpand
            halign={Gtk.Align.END}
            className={"command-center-access"}
          >
            {/* <Wifi /> */}
            <Clock />
          </box>
        </box>
      </centerbox>
    </window>
  );
}
