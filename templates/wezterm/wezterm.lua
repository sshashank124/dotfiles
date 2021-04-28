local wezterm = require 'wezterm';
return {
  font = wezterm.font("{{ fonts.monospace }}"),

  colors = {
    background = "#{{ colors.black }}",
    foreground = "#{{ colors.white }}",

    cursor_bg = "#{{ colors.accent }}",
    cursor_border = "#{{ colors.accent }}",
    cursor_fg = "#{{ colors.black }}",

    selection_bg = "#{{ colors.bg.2 }}",
    selection_fg = "#{{ colors.white }}",

    ansi = {"#{{ colors.black }}", "#{{ colors.red }}",
            "#{{ colors.green }}", "#{{ colors.yellow }}",
            "#{{ colors.blue }}", "#{{ colors.magenta }}",
            "#{{ colors.cyan }}", "#{{ colors.white }}"},
    brights = {"#{{ colors.bg.2 }}", "#{{ colors.red }}",
               "#{{ colors.green }}", "#{{ colors.yellow }}",
               "#{{ colors.blue }}", "#{{ colors.magenta }}",
               "#{{ colors.cyan }}", "#{{ colors.white }}"},
  },

  window_padding = { left={{ dimens.spacing }}, right={{ dimens.spacing }},
                     top={{ dimens.spacing }}, bottom={{ dimens.spacing }}, },

  enable_tab_bar = false,

  disable_default_key_bindings = true,
  keys = {
    { key="c", mods="ALT", action=wezterm.action{CopyTo="Clipboard"} },
    { key="v", mods="ALT", action=wezterm.action{PasteFrom="Clipboard"} },

    { key='-', mods="ALT", action="DecreaseFontSize" },
    { key='=', mods="ALT", action="IncreaseFontSize" },
    { key='0', mods="ALT", action="ResetFontSize" },
  },
}
