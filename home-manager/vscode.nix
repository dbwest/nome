{ pkgs }:

let
  colorTheme = "Ayu Dark Bordered";
  font = "JetBrains Mono";
  terminalFont = "JetBrains Mono";
  iconTheme = "material-icon-theme";
  zoomLevel = 1.25;
  autosave = "afterDelay";

  ext = publisher: name: version: sha256: pkgs.vscode-utils.buildVscodeMarketplaceExtension {
    mktplcRef = { inherit name publisher sha256 version; };
  };
in
{
  enable = true;

  enableExtensionUpdateCheck = true;

  extensions = (with pkgs.vscode-extensions; [
    astro-build.astro-vscode
    bbenoist.nix
    bradlc.vscode-tailwindcss
    denoland.vscode-deno
    editorconfig.editorconfig
    esbenp.prettier-vscode
    github.vscode-github-actions
    github.github-vscode-theme
    golang.go
    hashicorp.terraform
    matthewpi.caddyfile-support
    prisma.prisma
    phoenixframework.phoenix
    rust-lang.rust-analyzer
    tamasfe.even-better-toml
    thenuprojectcontributors.vscode-nushell-lang
    unifiedjs.vscode-mdx
  ]) ++ [
    # Extensions not in Nixpkgs
    (ext "b4dM4n" "nixpkgs-fmt" "0.0.1" "sha256-vz2kU36B1xkLci2QwLpl/SBEhfSWltIDJ1r7SorHcr8=")
    (ext "enkia" "tokyo-night" "1.0.6" "sha256-VWdUAU6SC7/dNDIOJmSGuIeffbwmcfeGhuSDmUE7Dig=")
    (ext "hashicorp" "hcl" "0.3.2" "sha256-cxF3knYY29PvT3rkRS8SGxMn9vzt56wwBXpk2PqO0mo=")
    (ext "JakeBecker" "elixir-ls" "0.17.10" "sha256-4/B70DyNlImz60PSTSL5CKihlOJen/tR1/dXGc3s1ZY=")
    (ext "jeff-hykin" "better-nix-syntax" "1.0.7" "sha256-vqfhUIjFBf9JvmxB4QFrZH4KMhxamuYjs5n9VyW/BiI=")
    (ext "markusylisiurunen" "githubdarkmode" "0.1.6" "sha256-Xzh8g5bEi4kPul1nJyROcN0CeDnXuNxQEYt6HgMepvM=")
    (ext "ms-vscode" "vscode-typescript-next" "5.4.20231127" "sha256-UVuYggzeWyQTmQxXdM4sT78FUOtYGKD4SzREntotU5g=")
    (ext "PKief" "material-icon-theme" "4.32.0" "sha256-6I9/nWv449PgO1tHJbLy/wxzG6BQF6X550l3Qx0IWpw=")
    (ext "teabyii" "ayu" "1.0.5" "sha256-+IFqgWliKr+qjBLmQlzF44XNbN7Br5a119v9WAnZOu4=")
    (ext "vue" "volar" "1.8.24" "sha256-KK6u9JFndTctq9h8Irhb0LzrJH9peNsq9+TzaNE9b8o=")
    (ext "whizkydee" "material-palenight-theme" "2.0.3" "sha256-qz2pz9JlnO2OV3eJnRqzbcic1lzpl0ViygwhNjZOWpI=")
  ];

  globalSnippets = { };

  keybindings = [ ];

  mutableExtensionsDir = false;

  userSettings = {
    "[nix]" = {
      "editor.defaultFormatter" = "B4dM4n.nixpkgs-fmt";
      "editor.formatOnSave" = true;
    };
    "[rust]" = {
      "editor.defaultFormatter" = "rust-lang.rust-analyzer";
      "editor.formatOnSave" = true;
    };
    "[toml]" = {
      "editor.defaultFormatter" = "tamasfe.even-better-toml";
      "editor.formatOnSave" = true;
    };
    "search.exclude" = {
      "**/.direnv" = true;
      "**/.git" = true;
      "**/node_modules" = true;
      "*.lock" = true;
      "dist" = true;
      "tmp" = true;
    };
    "files.autosave" = autosave;
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
    "terminal.integrated.fontFamily" = terminalFont;
    "workbench.colorTheme" = colorTheme;
    "workbench.iconTheme" = iconTheme;
    "window.zoomLevel" = zoomLevel;
  };
}
