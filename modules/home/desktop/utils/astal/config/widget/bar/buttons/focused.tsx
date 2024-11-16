import Hyprland from "gi://AstalHyprland";
import Gtk from "gi://Gtk?version=3.0";

export function Focused() {
  const hypr = Hyprland.get_default();

  return (
    <box halign={Gtk.Align.CENTER} hexpand vexpand>
      <box vertical valign={Gtk.Align.CENTER}>
        <label
          halign={Gtk.Align.START}
          className={"bar-label subtitle"}
          setup={(self) => {
            self.hook(hypr, "event", () => {
              const client = hypr.focused_client;

              if (client) {
                self.label = client.initialClass
                  ? client.initialClass
                  : `${client.width} x ${client.height} window`;
              } else {
                self.label = `Desktop`;
              }
            });
          }}
        />
        <label
          halign={Gtk.Align.START}
          className={"bar-label title"}
          setup={(self) => {
            self.hook(hypr, "event", () => {
              const client = hypr.focused_client;

              if (client) {
                self.label = client.title;
              } else {
                self.label = `Workspace ${hypr.focused_workspace.id}`;
              }
            });
          }}
        />
      </box>
    </box>
  );
}
