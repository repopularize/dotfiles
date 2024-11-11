import { bind } from "astal";
import AstalMpris from "gi://AstalMpris";
import Gtk from "gi://Gtk?version=3.0";

function convertSecondsToMMSS(seconds: number) {
  const minutes = Math.floor(seconds / 60); // Get the number of full minutes
  const remainingSeconds = seconds % 60; // Get the remaining seconds

  // Format minutes and seconds as two digits
  const formattedMinutes = String(minutes).padStart(2, "0");
  const formattedSeconds = String(remainingSeconds).padStart(2, "0");

  // Return the formatted time in mm:ss
  return `${formattedMinutes}:${formattedSeconds}`;
}

export function Mpris() {
  const mpris = AstalMpris.get_default();

  return <box>
    {bind(mpris, "players").as((players) =>
    players[0] ? (
      <box className={"bar-box mpris"} valign={Gtk.Align.CENTER}>
        <box hexpand halign={Gtk.Align.CENTER}>
          <box
            className="mpris-cover"
            valign={Gtk.Align.CENTER}
            css={bind(players[0], "coverArt").as(
              (cover) => `background-image: url('${cover}');`
            )}
          />
          <box
            vertical
            halign={Gtk.Align.FILL}
            valign={Gtk.Align.START}
            vexpand
          >
            <label
              halign={Gtk.Align.START}
              label={bind(players[0], "title").as(
                () =>
                  `${players[0].title
                    .replace(/\s*\(.*?\)\s*/g, "")
                    .replace(/\s*\[.*?\]\s*/g, "")}`
              )}
            ></label>
            <label
              halign={Gtk.Align.START}
              label={bind(players[0], "position").as(
                () => `${convertSecondsToMMSS(Math.round(players[0].position))}`
              )}
              css={`
                font-size: 10px;
                margin-top: -8px;
              `}
            ></label>
          </box>
        </box>
      </box>
    ) : (
      ""
    )
  )}
  </box>
}
