import { App } from "astal/gtk4";
import { writeFile, readFile, exec } from "astal";
import GLib from "gi://GLib?version=2.0";

const $ = (name: string, value: string) => `$${name}: ${value};`;

const theme = {
    accent: "#cba6f7",
    background: "#1e1e2e",
    foreground: "#cdd6f4",
    background_darker: "#181825",
    foreground_darker: "#a6adc8",
    radius: "8px",
    padding: "7px",
    transition: "200ms",
    border_width: "1px",
    border_color: "transparentize($accent, .96)",
    border: "$border-width solid $border-color",
    shadow_color: "rgba(0,0,0,.6)",
    text_shadow: "2pt 2pt 2pt $shadow-color"
};

const variables = () => [
    $("accent", theme.accent),
    
    $("background", theme.background),
    $("foreground", theme.foreground),

    $("background-darker", theme.background_darker),
    $("foreground-darker", theme.foreground_darker),

    $("radius", theme.radius),
    $("padding", theme.padding),
    $("transition", theme.transition),

    $("border-width", theme.border_width),
	$("border-color", theme.border_color),
	$("border", theme.border),
	$("shadow-color", theme.shadow_color),
	$("text-shadow", theme.text_shadow),
]

const common = readFile(`${SRC}/style/common.scss`);

const css = [...variables(), `\n${common}`];

export async function style (data: string) {
    try {
		css.push(data);

		const temp = "/tmp/style.scss";
		const out = "/tmp/out.css";

		await writeFile(temp, css.join("\n"));

		await exec(`sass ${temp} ${out}`); // transpile scss
		const read = readFile(out);

		App.apply_css(read, true);
		console.log(out);
	} catch (error) {
		error instanceof Error ? logError(error) : console.error(error);
	}
}