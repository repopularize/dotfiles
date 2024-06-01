_:
let
  # assume the first monitor in the list of monitors is primary
  # get its name from the list of monitors
  # `primaryMonitor osConfig` -> "DP-1"
  primaryMonitor = config: builtins.elemAt config.modules.device.monitors 0;
in
{
  inherit primaryMonitor;
}