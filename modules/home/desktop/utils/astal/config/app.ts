import { App } from "astal/gtk3";
import { Bar, Launcher } from "widget";

App.start({
  main: () => {
    App.get_monitors().map(Bar); // initialize status bars

    Launcher();
  },
  requestHandler(request: string, res: (response: any) => void) {
    if (request == "launcher") {
      App.toggle_window("launcher")
    }
  },
});
