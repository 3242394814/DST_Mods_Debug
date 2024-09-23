-- local function zh_en(zh, en)  -- Other languages don't work
--     local chinese_languages =
--     {
--         zh = "zh", -- Chinese for Steam
--         zhr = "zh", -- Chinese for WeGame
--         ch = "zh", -- Chinese mod
--         chs = "zh", -- Chinese mod
--         sc = "zh", -- simple Chinese
--         zht = "zh", -- traditional Chinese for Steam
--         tc = "zh", -- traditional Chinese
--         cht = "zh", -- Chinese mod
--     }

--     if chinese_languages[locale] ~= nil then
--         lang = chinese_languages[locale]
--     else
--         lang = en
--     end

--     return lang ~= "zh" and en or zh
-- end

name = "MOD检测报告器"
version = "0.4"
description =
"检测你的MOD列表，告诉你哪些MOD是过时的/有BUG的，并为你推荐它的替代品。"
author = "冰冰羊"


api_version = 10
priority = 10

dst_compatible = true

all_clients_require_mod = false
client_only_mod = true
server_only_mod = false

icon_atlas = "images/modicon.xml"
icon = "modicon.tex"