import { App } from "astal";
import { Bar, Launcher } from "./widget";

App.start({
  main: () => {
    App.get_monitors().map(Bar); // initialize status bars
  },
  requestHandler(request: string, res: (response: any) => void) {
    if (request == "launcher") {
      Launcher();
    }
  },
});
