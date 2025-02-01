import { App, Gtk } from "astal/gtk3";
import { bind } from "astal";
import Gdk from "gi://Gdk?version=3.0";
import AstalTray from "gi://AstalTray";

// export function Tray() {
//   const tray = AstalTray.get_default();

//   return (
//     <box className={"tray"}>
//       {bind(tray, "items").as((items) =>
//         items.map((item) => {
//           if (item.iconThemePath) App.add_icons(item.iconThemePath);

//           const menu = item.create_menu();

//           print(item.iconName)
//           print(item.iconThemePath)

//           return (
//             <button
//               tooltipMarkup={bind(item, "tooltipMarkup")}
//               onDestroy={() => menu?.destroy()}
//               className="tray-item"
//               onClickRelease={(self) => {
//                 menu?.popup_at_widget(
//                   self,
//                   Gdk.Gravity.SOUTH,
//                   Gdk.Gravity.NORTH,
//                   null
//                 );
//               }}
//             >
//               <icon
//                 gIcon={bind(item, "gicon")}
//               />
//             </button>
//           );
//         })
//       )}
//     </box>
//   );
// }

export function Tray() {
  const tray = AstalTray.get_default();
  return (
    <box spacing={5}>
      {bind(tray, "items").as((items) => {
        return items.map((item) => {
          if (item.icon_theme_path) App.add_icons(item.icon_theme_path);

          return (
            <button
              tooltipMarkup={bind(item, "tooltipMarkup")}
              className={"tray-item"}
              valign={Gtk.Align.CENTER}
              halign={Gtk.Align.CENTER}
              onClickRelease={(self, event) => {
              }}
            >
              <icon gicon={bind(item, "gicon")} />
            </button>
          );
        });
      })}
    </box>
  );
}
