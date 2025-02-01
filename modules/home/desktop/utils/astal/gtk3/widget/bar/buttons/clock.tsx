import { bind, Variable } from "astal";
import GLib from "gi://GLib?version=2.0";
import Gtk from "gi://Gtk?version=3.0";

export function Clock({ format = "" }) {
  const time = Variable<string>("").poll(
    1000,
    () => GLib.DateTime.new_now_local().format("%-I:%M %p")!
  );

  const date = Variable<string>("").poll(
    1000,
    () => GLib.DateTime.new_now_local().format("%a %d %b")!
  );

  return (
    <box className={"bar-box clock-box"} halign={Gtk.Align.CENTER} valign={Gtk.Align.CENTER} spacing={2}>
      <label label={time()} hexpand halign={Gtk.Align.CENTER} />
      <icon icon={"dot-symbolic"} valign={Gtk.Align.CENTER} />
      <label label={date()} halign={Gtk.Align.CENTER} hexpand />
    </box>
  );
}
