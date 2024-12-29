import { Astal } from "astal/gtk3";
import Gtk from "gi://Gtk?version=3.0";
import type Gdk from "gi://Gdk?version=3.0";
import { Tray, Mpris, Clock, Workspaces, Indicators, Focused } from "./buttons";
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
      <centerbox className={"bar-centerbox"}>
        <box hexpand halign={Gtk.Align.START}>
          <Focused />
        </box>
        <box spacing={5}>
          <Mpris />
          <Clock />
          <Indicators />
          <Tray />
        </box>
        <box hexpand halign={Gtk.Align.END}>
          <Workspaces />
        </box>
      </centerbox>
    </window>
  );
}
