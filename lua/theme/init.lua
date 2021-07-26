local function enable(colorscheme)
  if (colorscheme == "tokyonight") then
    require("theme.tokyonight")
  elseif (colorscheme == "codedark") then
    require("theme.codedark")
  elseif (colorscheme == "material") then
    require("theme.material")
  elseif (colorscheme == "onedark") then
    require("theme.onedark")
  end
end

return {enable = enable}
