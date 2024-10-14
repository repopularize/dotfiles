import { App, exec, readFile, writeFile } from "astal";
/*
$bg: #1e1e2e;
$fg: #cdd6f4;
$accent: #b4befe;
$radius: 7px;
*/

const $ = (name: string, value: string) => `$${name}: ${value};`;

const variables = () => [
  $("bg", "#1e1e2e"),
  $("fg", "#cdd6f4"),
  $("accent", "#b4befe"),
  $("radius", "8px"),
];

export async function style(data: string) {
  try {
    const css = `${variables().join("\n")}\n${data}`;
    const temp = `/tmp/style.scss`;
    const out = `/tmp/out.css`;

    await writeFile(temp, css);

    await exec(`sass ${temp} ${out}`); // transpile scss
    const read = readFile(out);

    App.apply_css(read);
  } catch (error) {
    error instanceof Error ? logError(error) : console.error(error);
  }
}
