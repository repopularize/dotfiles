{ pkgs, lib, ... }:

{
  "terminal.integrated.shell.linux" = "${lib.getExe pkgs.nushell}";
  "terminal.integrated.defaultProfile.linux" = "Nushell";
  "workbench.colorTheme" = "Catppuccin Mocha";
  "workbench.iconTheme" = "catppuccin-mocha";
  "editor.smoothScrolling" = true;
  "workbench.list.smoothScrolling" = true;
  "window.customTitleBarVisibility" = "auto";
  "window.titleBarStyle" = "custom";
  "files.autoSave" = "afterDelay";
  "files.autoSaveDelay" = 500;
  "github.gitAuthentication" = false;
  "git.confirmSync" = false;
  "git.autofetch" = true;
  "editor.formatOnSave" = true;
  "editor.semanticHighlighting.enabled" = true;
  "editor.fontFamily" = "'JetBrainsMono Nerd Font', 'DejaVu Sans Mono'";
  "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font'";
  "vscord.status.buttons.button1.enabled" = true;
  "vscord.status.state.text.debugging" =
    "⚠️ {file_name}:{current_line}:{current_column}";
  "vscord.status.details.textx.debugging" = "🪐✏️ {workspace} {problems}";
  "vscord.status.image.small" = "Code";
  "nix.enableLanguageServer" = true;
  "nix.serverPath" = "${lib.getExe pkgs.nil}";
  "nix.formatterPath" = "${lib.getExe pkgs.nixpkgs-fmt}";
  "nix.serverSettings" = {
    "nil" = { "formatting" = { "command" = [ "nixpkgs-fmt" ]; }; };
  };
  "security.workspace.trust.enabled" = false;
  "git.enableSmartCommit" = true;
  "[javascript]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
  "[javascriptreact]" = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
  "[jsonc]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
  "[json]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
  "[typescript]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
  "[typescriptreact]" = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
  "[html]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
  "[svelte]" = { "editor.defaultFormatter" = "svelte.svelte-vscode"; };
}
