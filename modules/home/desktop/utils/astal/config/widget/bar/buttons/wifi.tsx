import Network from "gi://AstalNetwork?version=0.1";
import { bind } from "astal";
import { launchApp } from "lib";
import AstalApps from "gi://AstalApps?version=0.1";

export function Wifi() {
  const { wifi } = Network.get_default();
  const apps = new AstalApps.Apps({
    includeEntry: true,
    includeExecutable: true,
  });

  return (
      <icon
        tooltipText={bind(wifi, "ssid").as(String)}
        className="wifi"
        icon={bind(wifi, "iconName")}
      />
  );
}
