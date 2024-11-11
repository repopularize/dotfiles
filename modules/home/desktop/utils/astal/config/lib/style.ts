import { App } from "astal/gtk3";
import { writeFile, readFile, exec } from "astal";
import GLib from "gi://GLib?version=2.0";

/*
$base00: #242424;
$base06: #cdd6f4;
$base09: #b4befe;
$radius: 7px;
*/

const $ = (name: string, value: string) => `$${name}: ${value};`;

const variables = () => [
  $("base00", "#161616"),
  $("base01", "#262626"),
  $("base02", "#393939"),
  $("base03", "#525252"),
  $("base04", "#dde1e6"),
  $("base05", "#f2f4f8"),
  $("base06", "#ffffff"),
  $("base07", "#08bdba"),
  $("base08", "#3ddbd9"),
  $("base09", "#78a9ff"),
  $("base0A", "#ee5396"),
  $("base0B", "#33b1ff"),
  $("base0C", "#ff7eb6"),
  $("base0D", "#42be65"),
  $("base0E", "#be95ff"),
  $("base0F", "#82cfff"),

  $("radius", "8px"),
  $("padding", `7px`),
  $("transition", `200ms`),

  $("border-width", `1px`),
  $("border-color", "transparentize($base07, .96)"), // Example using base07 as accent color
  $("border", "$border-width solid $border-color"),
  $("shadow-color", "rgba(0,0,0,.6)"),
  $("text-shadow", "2pt 2pt 2pt $shadow-color"),
];

const mixins = readFile(`${SRC}/lib/mixins.scss`);

const css = [...variables(), `\n${mixins}`];

export async function style(data: string) {
  try {
    css.push(data);

    const temp = `/tmp/style.scss`;
    const out = `/tmp/out.css`;

    await writeFile(temp, css.join("\n"));

    await exec(`sass ${temp} ${out}`); // transpile scss
    const read = readFile(out);

    App.apply_css(read, true);
    console.log(out);
  } catch (error) {
    error instanceof Error ? logError(error) : console.error(error);
  }
}
