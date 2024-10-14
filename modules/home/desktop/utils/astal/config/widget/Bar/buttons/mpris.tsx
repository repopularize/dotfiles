import { bind } from "astal";
import AstalMpris from "gi://AstalMpris";
import Gtk from "gi://Gtk?version=3.0";

export function Mpris() {
  const mpris = AstalMpris.get_default();

  return (
    <box className="mpris">
      {bind(mpris, "players").as((ps) =>
        ps[0] ? (
          <box>
            <box
              className="mpris-cover"
              valign={Gtk.Align.CENTER}
              css={bind(ps[0], "coverArt").as(
                (cover) => `background-image: url('${cover}');`
              )}
            />
            <label label={bind(ps[0], "title").as(() => `${ps[0].title}`)} />
          </box>
        ) : (
          ""
        )
      )}
    </box>
  );
}
