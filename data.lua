
local semibold_available = {
  ["ubuntu"] = true,
  ["josefin-sans"] = true,
}

for each, font in pairs(data.raw.font) do
  if not (settings.startup["more-fonts-font-family"].value == "default") then
    if font.from == "default" then
      data.raw.font[each].from = settings.startup["more-fonts-font-family"].value
    end
    if semibold_available[settings.startup["more-fonts-font-family"].value] then
      if font.from == "default-semibold" then
        data.raw.font[each].from = settings.startup["more-fonts-font-family"].value .. "-semibold"
      end
      if font.from == "default-bold" then
        data.raw.font[each].from = settings.startup["more-fonts-font-family"].value .. "-bold"
      end
    elseif font.from == "default-semibold" or font.from == "default-bold" then
      data.raw.font[each].from = settings.startup["more-fonts-font-family"].value .. "-bold"
    end
  end
end
