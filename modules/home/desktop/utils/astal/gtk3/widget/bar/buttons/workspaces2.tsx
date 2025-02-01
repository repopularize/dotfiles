import { bind } from "astal";
import { Gdk, Gtk } from "astal/gtk3";
import Hyprland from "gi://AstalHyprland";
import cairo from "gi://cairo?version=1.0";
import { rem } from "lib/utils";
import { DrawingArea } from "../../../../../../../../../../.local/share/ags/gtk3/widget";

const wp_count = 9;
const wp_button_size = 15;
const wp_button_thickness = 4.5;
const wp_button_size_css = rem(35);

export function Workspaces() {
  const hypr = Hyprland.get_default();

  let wp_ids: number[] = [];

  const update = () => {
    wp_ids = [];
    hypr.clients.forEach((client) => {
      const id = Math.floor(client.workspace.id);

      if (!wp_ids[id]) {
        wp_ids[id] = 1;
      }
    });
  };

  hypr.connect("notify::clients", update);
  hypr.connect("client-moved", update);

  let wp_buttons: number[] = [];

  for (let i = 0; i < wp_count; i++) {
    wp_buttons.push(i);
  }

  const WpButtonBox = () => {
    return (
      <box
        halign={Gtk.Align.CENTER}
        valign={Gtk.Align.CENTER}
        className={"bar-box"}
        width_request={wp_button_size * wp_count}
      >
        {wp_buttons.map((i) => {
          return (
            <button
              valign={Gtk.Align.CENTER}
              setup={(self) => {
                const update = () => {
                  if (wp_ids[i]) {
                    self.className =
                      "" + wp_ids[i - 1]
                        ? "right "
                        : "" + wp_ids[i + 1]
                        ? "left "
                        : "";

                    // if (wp_ids[i - 1]) {
                    //     self.className = "right ";
                    // };

                    // if (wp_ids[i + 1]) {
                    //     self.className = "left ";
                    // }
                  } else {
                    self.className = "left flat workspace-button";
                  }
                };

                self.hook(hypr, "notify::clients", update);
                self.hook(hypr, "client-moved", update);
              }}
              onClickRelease={() => {
                hypr.dispatch("workspace", `${i}`);
              }}
            >
              <drawingarea
                className={"circle"}
                halign={Gtk.Align.CENTER}
                valign={Gtk.Align.CENTER}
                widthRequest={wp_button_size}
                height_request={wp_button_size}
                setup={(self) => {
                  const update = () => {
                    if (wp_ids[i]) {
                      self.className = "circle active";
                    } else {
                      self.className = "circle";
                    }
                  };

                  self.hook(hypr, "notify::clients", update);
                  self.hook(hypr, "client-moved", update);
                }}
                //@ts-ignore
                onDraw={(self, cr) => {
                  const GdkRGBA = self
                    .get_style_context()
                    .get_property("color", Gtk.StateFlags.NORMAL) as any;

                  const size = wp_button_size;
                  const thickness = wp_button_thickness;
                  const radius = (size - thickness) / 2;

                  cr.setLineWidth(thickness);
                  cr.setSourceRGBA(
                    GdkRGBA.red,
                    GdkRGBA.green,
                    GdkRGBA.blue,
                    GdkRGBA.alpha
                  );
                  cr.arc(size / 2, size / 2, radius, 0, 2 * Math.PI);
                  cr.stroke();

                  cr.$dispose();
                }}
              ></drawingarea>
            </button>
          );
        })}
      </box>
    );
  };

  const WpIndicatorBox = () => {
    return (
      <box valign={Gtk.Align.CENTER} hexpand>
        <box
          className={"wp-indicator"}
          valign={Gtk.Align.CENTER}
          halign={Gtk.Align.CENTER}
          css={bind(hypr, "focusedWorkspace").as(
            (wp) =>
              `margin-left: %.4frem;\n${
                wp_button_size_css * (wp.id - 1) +
                rem(wp.id < wp_count ? wp.id : wp_count)
              }`
          )}
        ></box>
      </box>
    );
  };

  const wp_indicator_box = WpIndicatorBox();
  const wp_button_box = WpButtonBox();

  hypr.notify("clients");

  return (
    <overlay
      valign={Gtk.Align.CENTER}
      setup={(self) => {
        self.set_overlay_pass_through(wp_indicator_box, true);
      }}
      overlays={[wp_indicator_box]}
    >
      {wp_button_box}
    </overlay>
  );
}
