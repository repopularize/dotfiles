/* eslint-disable @typescript-eslint/no-explicit-any */
import Gtk from "gi://Gtk?version=3.0";
import Gdk from "gi://Gdk";
import { exec, execAsync } from "astal";
import Apps from "gi://AstalApps";

/**
 * @returns execAsync(["bash", "-c", cmd])
 */
export async function bash(
  strings: TemplateStringsArray | string,
  ...values: unknown[]
) {
  const cmd =
    typeof strings === "string"
      ? strings
      : strings.flatMap((str, i) => str + `${values[i] ?? ""}`).join("");

  return execAsync(["bash", "-c", cmd]).catch((err: Error) => {
    console.error(cmd, err);
    return "";
  });
}

export function forMonitors(widget: (monitor: number) => Gtk.Window) {
  const n = Gdk.Display.get_default()?.get_n_monitors() || 1;
  return range(n, 0).flatMap(widget);
}

/**
 * @returns [start...length]
 */
export function range(length: number, start = 1) {
  return Array.from({ length }, (_, i) => i + start);
}

/**
 * @returns true if all of the `bins` are found
 */
export function dependencies(...bins: string[]) {
  const missing = bins.filter((bin) => exec(`which ${bin}`));

  if (missing.length > 0) {
    console.warn(Error(`missing dependencies: ${missing.join(", ")}`));
  }

  return missing.length === 0;
}

/**
 * run app detached
 */
export function launchApp(app: Apps.Application) {
  const exe = app.executable
    .split(/\s+/)
    .filter((str: string) => !str.startsWith("%") && !str.startsWith("@"))
    .join(" ");

  bash(`${exe} &`);
  app.frequency += 1;
}
