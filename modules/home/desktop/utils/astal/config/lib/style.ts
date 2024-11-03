import { App } from "astal/gtk3";
import { writeFile, readFile, exec } from "astal";
import GLib from "gi://GLib?version=2.0";

/*
$bg: #242424;
$fg: #cdd6f4;
$accent: #b4befe;
$radius: 7px;
*/

const $ = (name: string, value: string) => `$${name}: ${value};`;

const variables = () => [
  $("bg", "#000000"),
  $("fg", "#ffffff"),
  $("accent", "#ffffff"),

  $("radius", "8px"),
  $("padding", `7px`),
  $("transition", `200ms`),

  $("border-width", `1px`),
  $("border-color", `transparentize($accent, .96)`),
  $("border", "$border-width solid $border-color"),
  $("shadow-color", "rgba(0,0,0,.6)"),
  $("text-shadow", "2pt 2pt 2pt $shadow-color"),
];

const mixins = readFile(`${SRC}/lib/mixins.scss`)

const css = [
  ...variables(),
  `\n${mixins}`
];

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
