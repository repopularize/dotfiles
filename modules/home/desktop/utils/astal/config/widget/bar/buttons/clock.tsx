import { Variable } from "astal";
import GLib from "gi://GLib?version=2.0";

export function Clock({ format = "  %m/%d %-I:%M %p" }) {
  const time = Variable<string>("").poll(
    1000,
    () => GLib.DateTime.new_now_local().format(format)!
  );

  return (
    <button className="clock" onDestroy={() => time.drop()} label={time()} />
  );
}
