import { bind, Variable } from "astal";
import Wp from "gi://AstalWp?version=0.1";
import Gtk from "gi://Gtk?version=3.0";
import Network from "gi://AstalNetwork";

function Volume() {
  const speaker = Wp.get_default()?.audio.defaultSpeaker!;
  const scroll_revealed = Variable(false);

  return (
    <eventbox
      onHover={() => {
        scroll_revealed.set(true);
      }}
      onHoverLost={() => {
        scroll_revealed.set(false);
      }}
      tooltipText={bind(speaker, "volume").as((v) => {
        return `${Math.round(v * 100)}%`;
      })}
    >
      <box>
        <button
          onClickRelease={() => {
            speaker.mute = !speaker.mute;
          }}
        >
          <icon icon={bind(speaker, "volume_icon")} />
        </button>
        <revealer
          revealChild={scroll_revealed()}
          transitionType={Gtk.RevealerTransitionType.SLIDE_LEFT}
          valign={Gtk.Align.CENTER}
        >
          <slider
          className={"volume-slider"}
            hexpand
            onDragged={({ value }) => (speaker.volume = value)}
            value={bind(speaker, "volume")}
          />
        </revealer>
      </box>
    </eventbox>
  );
}

function Wifi() {
  const wifi = Network.get_default().wifi!;

  return (
    <icon
      className={"icon"}
      tooltipText={bind(wifi, "ssid").as((v) => `${v}`)}
      icon = {bind(wifi, "icon_name")}
    />
  );
}

export function Indicators() {
  return (
    <box className={"bar-box"} valign={Gtk.Align.CENTER}>
      <box
        className={"indicators"}
        valign={Gtk.Align.CENTER}
        halign={Gtk.Align.CENTER}
        hexpand
        spacing={10}
      >
        <Wifi />
        <Volume />
      </box>
    </box>
  );
}
