import Network from "gi://AstalNetwork?version=0.1";
import { bind } from "astal";

export function Wifi() {
  const { wifi } = Network.get_default();

  return (
    <icon
      tooltipText={bind(wifi, "ssid").as(String)}
      className="wifi"
      icon={bind(wifi, "iconName")}
    />
  );
}
