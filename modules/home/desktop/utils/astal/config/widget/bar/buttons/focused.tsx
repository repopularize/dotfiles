import Hyprland from "gi://AstalHyprland";
import Gtk from "gi://Gtk?version=3.0";
import Apps from "gi://AstalApps";

export function Focused() {
  const hypr = Hyprland.get_default();
  const apps = new Apps.Apps({
    nameMultiplier: 2,
    entryMultiplier: 0,
    executableMultiplier: 2,
  });

  return (
    <box halign={Gtk.Align.CENTER} hexpand vexpand>
      {/* <icon
        halign={Gtk.Align.CENTER}
        css={"font-size: 24px;"}
        setup={(self) => {
          self.hook(hypr, "event", () => {
            const client = hypr.focused_client;
            const app = apps.fuzzy_query(client.get_initial_class())[0];

            if (client) {
              self.set_icon(app.iconName)
            } else {
              self.set_icon(`dot-symbolic`)
            }
          });
        }}
      ></icon> */}
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
