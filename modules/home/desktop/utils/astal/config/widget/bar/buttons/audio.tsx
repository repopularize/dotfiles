import { bind } from "astal";
import Wp from "gi://AstalWp";

export function Audio() {
  const speaker = Wp.get_default()?.audio.defaultSpeaker!;

  return (
    <box className="audio">
      <icon icon={bind(speaker, "volumeIcon")} />
      {/* <slider
        hexpand
        onDragged={({ value }) => (speaker.volume = value)}
        value={bind(speaker, "volume")}
      /> */}
      <label label={bind(speaker, "volume").as((v) => `${Math.round(v * 100)}%`)} />
    </box>
  );
}
