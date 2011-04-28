name "font_converter"
description "Set up a Font-Convertion-Server. Including all tools needed for trancoding font files"

run_list(
  "role[default]",
  "recipe[fontforge]",
  "recipe[ttf2eot]"
)
