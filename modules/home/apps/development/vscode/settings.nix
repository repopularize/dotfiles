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
  "discord.detailsDebugging" = "⚠️ {file_name}:{current_line}:{current_column}";
  "discord.detailsEditing" = "✏️ {file_name}:{current_line}:{current_column}";
  "discord.lowerDetailsIdling" = "😪💤";
  "discord.lowerDetailsEditing" = "🪐 {workspace}";
  "discord.detailsIdling" = "😪💤";
  "vscord.status.image.small" = "Code";
  "nix.enableLanguageServer" = true;
  "nix.serverPath" = "${lib.getExe pkgs.nil}";
  "nix.formatterPath" = "${lib.getExe pkgs.nixpkgs-fmt}";
  "nix.serverSettings" = {
    "nil" = {
      "formatting" = {
        "command" = [ "nixpkgs-fmt" ];
      };
    };
  };
  "svelte.enable-ts-plugin" = true;
  "security.workspace.trust.enabled" = false;
  "git.enableSmartCommit" = true;
  "githubPullRequests.createOnPublishBranch" = "never";
  "[javascript]" = {
    "editor.defaultFormatter" = "biomejs.biome";
  };
  "[javascriptreact]" = {
    "editor.defaultFormatter" = "biomejs.biome";
  };
  "[jsonc]" = {
    "editor.defaultFormatter" = "biomejs.biome";
  };
  "[json]" = {
    "editor.defaultFormatter" = "biomejs.biome";
  };
  "[typescript]" = {
    "editor.defaultFormatter" = "biomejs.biome";
  };
  "[typescriptreact]" = {
    "editor.defaultFormatter" = "biomejs.biome";
  };
  "[html]" = {
    "editor.defaultFormatter" = "biomejs.biome";
  };
  "[svelte]" = {
    "editor.defaultFormatter" = "svelte.svelte-vscode";
  };
  "[css]" = {
    "editor.defaultFormatter" = "biomejs.biome";
  };
  "[scss]" = {
    "editor.defaultFormatter" = "biomejs.biome";
  };
}
