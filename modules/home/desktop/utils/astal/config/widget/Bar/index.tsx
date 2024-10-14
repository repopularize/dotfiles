import { Variable, Astal, Gtk, Gdk, readFile } from "astal";
import { style as apply } from "../../lib/style";
import style from "inline:./style.scss";
import { Wifi, Tray, AudioSlider, Mpris, Clock, Workspaces } from "./buttons";

export function Bar(monitor: Gdk.Monitor) {
  const anchor =
    Astal.WindowAnchor.TOP | Astal.WindowAnchor.LEFT | Astal.WindowAnchor.RIGHT;

  console.log(style);
  apply(style);

  return (
    <window
      className="bar"
      gdkmonitor={monitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={anchor}
    >
      <centerbox className={"bar-box"}>
        <box hexpand halign={Gtk.Align.START}>
          <Workspaces />
          {/* <FocusedClient /> */}
        </box>
        <box>
          <Mpris />
        </box>
        <box hexpand halign={Gtk.Align.END}>
          <Tray />
          <AudioSlider />
          <box className={"command-center-access"}>
            <Wifi />
            <Clock />
          </box>
        </box>
      </centerbox>
    </window>
  );
}
