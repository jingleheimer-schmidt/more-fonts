
local semibold_available = {
  ["ubuntu"] = true,
  ["josefin-sans"] = true,
  ["comic-sans"] = true,
  ["papyrus"] = true,
  ["helvetica"] = true,
  ["noteworthy"] = true,
  ["courier-new"] = true,
  ["arial"] = true,
  ["copperplate"] = true,
  ["libre-baskerville"] = true,
  ["i-miss-your-kiss"] = true,
  ["times-new-roman"] = true,
  ["space-age"] = true,
  ["heroes-assemble"] = true,
  ["powerpuff-girls"] = true,
  ["atkinson-hyperlegible"] = false,
}
local bold_available = {
  ["ubuntu"] = true,
  ["josefin-sans"] = true,
  ["comic-sans"] = true,
  ["papyrus"] = true,
  ["helvetica"] = true,
  ["noteworthy"] = true,
  ["olympic-carrier"] = true,
  ["courier-new"] = true,
  ["arial"] = true,
  ["copperplate"] = true,
  ["libre-baskerville"] = true,
  ["i-miss-your-kiss"] = true,
  ["times-new-roman"] = true,
  ["chalkboard"] = true,
  ["space-age"] = true,
  ["heroes-assemble"] = true,
  ["powerpuff-girls"] = true,
  ["atkinson-hyperlegible"] = true,
}
local size_adjustment = {
  ["default"] = 0,
  ["ubuntu"] = 0,
  ["josefin-sans"] = 0,
  ["comic-sans"] = 0,
  ["papyrus"] = 0,
  ["helvetica"] = 0,
  ["noteworthy"] = 0,
  ["olympic-carrier"] = 0,
  ["courier-new"] = 1,
  ["arial"] = 0,
  ["copperplate"] = 0,
  ["libre-baskerville"] = 0,
  ["i-miss-your-kiss"] = 5,
  ["times-new-roman"] = 0,
  ["chalkboard"] = 0,
  ["space-age"] = 0,
  ["heroes-assemble"] = 0,
  ["powerpuff-girls"] = 0,
  ["wingdings"] = 0,
  ["atkinson-hyperlegible"] = 1,
}

local original_default_dropdown = table.deepcopy(data.raw.font["default-dropdown"])
original_default_dropdown.name = "original-default-dropdown"

for each, font in pairs(data.raw.font) do
  local font_choice = settings.startup["more-fonts-font-family"].value
  if not (font_choice == "default") then
    if font.from == "default" then
      data.raw.font[each].from = font_choice
      data.raw.font[each].size = data.raw.font[each].size + size_adjustment[font_choice]
    elseif font.from == "default-semibold" then
      if semibold_available[font_choice] then
        data.raw.font[each].from = font_choice .. "-semibold"
        data.raw.font[each].size = data.raw.font[each].size + size_adjustment[font_choice]
      elseif bold_available[font_choice] then
        data.raw.font[each].from = font_choice .. "-bold"
        data.raw.font[each].size = data.raw.font[each].size + size_adjustment[font_choice]
      else
        data.raw.font[each].from = font_choice
        data.raw.font[each].size = data.raw.font[each].size + size_adjustment[font_choice]
      end
    elseif font.from == "default-bold" then
      if bold_available[font_choice] then
        data.raw.font[each].from = font_choice .. "-bold"
        data.raw.font[each].size = data.raw.font[each].size + size_adjustment[font_choice]
      elseif semibold_available[font_choice] then
        data.raw.font[each].from = font_choice .. "-semibold"
        data.raw.font[each].size = data.raw.font[each].size + size_adjustment[font_choice]
      else
        data.raw.font[each].from = font_choice
        data.raw.font[each].size = data.raw.font[each].size + size_adjustment[font_choice]
      end
    end
  end
end

--     if semibold_available[settings.startup["more-fonts-font-family"].value] then
--       if font.from == "default-semibold" then
--         data.raw.font[each].from = settings.startup["more-fonts-font-family"].value .. "-semibold"
--       end
--     elseif font.from == "default-semibold" or font.from == "default-bold" then
--       data.raw.font[each].from = settings.startup["more-fonts-font-family"].value .. "-bold"
--     end
--     if bold_available[settings.startup["more-fonts-font-family"].value] then
--       if font.from == "default-bold" then
--         data.raw.font[each].from = settings.startup["more-fonts-font-family"].value .. "-bold"
--       end
--     end
--   end
-- end

data:extend({
  original_default_dropdown,
  {
    type = "font",
    name = "comic-sans-dropdown",
    from = "comic-sans",
    size = 14
  },
  {
    type = "font",
    name = "papyrus-dropdown",
    from = "papyrus",
    size = 14
  },
  {
    type = "font",
    name = "helvetica-dropdown",
    from = "helvetica",
    size = 14
  },
  {
    type = "font",
    name = "chalkboard-dropdown",
    from = "chalkboard",
    size = 14
  },
  {
    type = "font",
    name = "times-new-roman-dropdown",
    from = "times-new-roman",
    size = 14
  },
  {
    type = "font",
    name = "arial-dropdown",
    from = "arial",
    size = 14
  },
  {
    type = "font",
    name = "courier-new-dropdown",
    from = "courier-new",
    size = 14
  },
  {
    type = "font",
    name = "copperplate-dropdown",
    from = "copperplate",
    size = 14
  },
  {
    type = "font",
    name = "ubuntu-dropdown",
    from = "ubuntu",
    size = 14
  },
  {
    type = "font",
    name = "libre-baskerville-dropdown",
    from = "libre-baskerville",
    size = 14
  },
  {
    type = "font",
    name = "josefin-sans-dropdown",
    from = "josefin-sans",
    size = 14
  },
  {
    type = "font",
    name = "noteworthy-dropdown",
    from = "noteworthy",
    size = 14
  },
  -- {
  --   type = "font",
  --   name = "jurassic-park-dropdown",
  --   from = "jurassic-park",
  --   size = 14
  -- },
  {
    type = "font",
    name = "olympic-carrier-dropdown",
    from = "olympic-carrier",
    size = 14
  },
  {
    type = "font",
    name = "i-miss-your-kiss-dropdown",
    from = "i-miss-your-kiss",
    size = 14
  },
  {
    type = "font",
    name = "wingdings-dropdown",
    from = "wingdings",
    size = 14
  },
  {
    type = "font",
    name = "space-age-dropdown",
    from = "space-age",
    size = 14
  },
  {
    type = "font",
    name = "heroes-assemble-dropdown",
    from = "heroes-assemble",
    size = 14
  },
  {
    type = "font",
    name = "powerpuff-girls-dropdown",
    from = "powerpuff-girls",
    size = 14
  },
  {
    type = "font",
    name = "atkinson-hyperlegible-dropdown",
    from = "atkinson-hyperlegible",
    size = 14
  }
})
