local _G = GLOBAL
local debug_list = {}
local num = 1

-- 判断是否下载了对应模组
local function IsmodDownLoad(name)
    if _G.KnownModIndex:GetModInfo("workshop-"..name) then
        return true
    else
        return false
    end
end

-- 判断是否有新的模组替代它
local function switch_NewMod(NewMod)
    if NewMod then
        return
            {
                text = "带我订阅此MOD的替代品",
                cb = function()
                    _G.VisitURL(NewMod)
                end
            }
    end
end

-- 带我去订阅Chinese++ Pro
local function show_Chinese_pro()
    if not IsmodDownLoad(2941527805) then
        local PopupDialogScreen = require("screens/redux/popupdialog")
            TheFrontEnd:PushScreen(
                PopupDialogScreen(
                    "最后一步",
                    "订阅Chinese++ Pro来获取各大官方MOD的翻译！",
                    {
                        {
                            text = "订阅完成！",
                            cb = function()
                                TheFrontEnd:PopScreen()
                            end,
                        },
                        {
                            text = "带我去订阅！",
                            cb = function()
                                _G.VisitURL("https://steamcommunity.com/sharedfiles/filedetails/?id=2941527805")
                            end,
                        },
                    }
                )
            )
    end
end


-- 显示结果
local function show_debug(title,desc,URL,NewMod)
	local PopupDialogScreen = require("screens/redux/popupdialog")
		TheFrontEnd:PushScreen(
			PopupDialogScreen(
				title,
				desc,
				{
					{
						text = "下一个！",
						cb = function()
                            num = num + 1
							TheFrontEnd:PopScreen()

                            if num <= #debug_list then
                                show_debug(debug_list[num][1],debug_list[num][2],debug_list[num][3],debug_list[num][4])
                            else
                                show_Chinese_pro()
                            end
						end,
					},
					{
						text = "带我去取消订阅",
						cb = function()
							_G.VisitURL(URL)
						end,
					},
                    switch_NewMod(NewMod),
				}
			)
		)
end

-- 添加需要处理的模组
local function addlist_debug(modid, title, desc, NewMod) -- 标题，内容，旧模组创意工坊链接，新的模组替代品
    if IsmodDownLoad(modid) then
        table.insert(debug_list, {title, desc, "https://steamcommunity.com/sharedfiles/filedetails/?id="..modid, type(NewMod) == "number" and "https://steamcommunity.com/sharedfiles/filedetails/?id=" .. NewMod or NewMod})
    end
end

-- 检测部分（添加到 debug_list）

-- DST Storm Cellar
addlist_debug(382177939,"DST Storm Cellar","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅")

-- DST Freezer
addlist_debug(346962876,"DST Freezer","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅")

-- Map Revealer for DST
addlist_debug(363112314,"Map Revealer for DST","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅")

-- Finder
addlist_debug(780009141,"Finder","这是一个过时的MOD 无法正常使用\n建议您前往创意工坊取消订阅")

-- Health Info
addlist_debug(375859599,"Health Info","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅")

-- Global Pause
addlist_debug(758532836,"Global Pause","这是一个过时的MOD\n建议您前往创意工坊取消订阅")

-- Global Player Icons
addlist_debug(632082897,"Global Player Icons","这是一个过时的MOD，功能已经失效了\n建议您前往创意工坊取消订阅")

-- Extra Equip Slots
addlist_debug(375850593,"Extra Equip Slots","这是一个过时的MOD 且含有诸多BUG\n强烈建议您前往游戏脱掉装备后去创意工坊取消订阅\nTips:目前我找到的所有更多装备栏Mod都有不同程度的BUG，所以最好别订阅..")

-- Extra Equip Slots (Updated)
addlist_debug(1818688368,"Extra Equip Slots (Updated)","这是一个过时的MOD 且含有诸多BUG\n建议您前往游戏脱掉装备后去创意工坊取消订阅\nTips:目前我找到的所有更多装备栏Mod都有不同程度的BUG，所以最好别订阅..")

-- DST 四格装备栏
addlist_debug(1819567085,"DST 四格装备栏","这是一个过时的MOD 含有诸多BUG\n建议您前往游戏脱掉装备后去创意工坊取消订阅\nTips:目前我找到的所有更多装备栏Mod都有不同程度的BUG，所以最好别订阅..")

-- 五格装备栏（幽冥汉化版）
addlist_debug(2373346252,"五格装备栏（幽冥汉化版）","这是一个过时的MOD 含有诸多BUG\n建议您前往游戏脱掉装备后去创意工坊取消订阅\nTips:目前我找到的所有更多装备栏Mod都有不同程度的BUG，所以最好别订阅..")

--额外物品装备栏&UI优化
addlist_debug(1405120786,"额外物品装备栏&UI优化","这是一个过时的MOD 含有诸多BUG\n建议您前往游戏脱掉装备后去创意工坊取消订阅\nTips:目前我找到的所有更多装备栏Mod都有不同程度的BUG，所以最好别订阅..")

-- 45 Inventory Slots 这是原版
addlist_debug(786556008,"45 Inventory Slots","这是一个过时的MOD 含有诸多BUG！\n建议您前往创意工坊取消订阅并换成xuopleu制作的整合版？\n(我推荐不订阅45格，BUG总是有的，还不如给自己指令刷一个坎普斯背包)")

-- 45 Inventory Slots
addlist_debug(2965758547,"45 Inventory Slots","这是一个过时的MOD 含有诸多BUG！\n建议您前往创意工坊取消订阅并换成xuopleu制作的整合版？\n(我推荐不订阅45格，BUG总是有的，还不如给自己指令刷一个坎普斯背包)")

-- 45 Inventory Slots and the fixed fishing rod slots.
addlist_debug(2568821043,"45 Inventory Slots and the fixed fishing rod slots.","这是一个过时的MOD 含有诸多BUG！\n建议您前往创意工坊取消订阅并换成xuopleu制作的整合版？\n(我推荐不订阅45格，BUG总是有的，还不如给自己指令刷一个坎普斯背包)")

-- 45 Inventory Slots [EquipSlot UI expand]
addlist_debug(2906717350,"45 Inventory Slots [EquipSlot UI expand]","这是一个过时的MOD 含有诸多BUG！\n建议您前往创意工坊取消订阅并换成xuopleu制作的整合版？\n(我推荐不订阅45格，BUG总是有的，还不如给自己指令刷一个坎普斯背包)")


-- [Discontinued] VK Extra Equipment and Inventory
addlist_debug(943020433,"[Discontinued] VK Extra Equipment and Inventory","这是一个过时的MOD 含有诸多BUG！\n建议您前往创意工坊取消订阅")


-- [OUTDATED] Complete Your Map
addlist_debug(459280938,"[OUTDATED] Complete Your Map","这是一个过时的MOD，打开它会让你的游戏立刻闪退。请取消订阅")


-- Complete Your Map[FIX]
addlist_debug(2003064672,"Complete Your Map[FIX]","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅")


-- Display Food Values
addlist_debug(347079953,"Display Food Values","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅，并使用Show Me(中文)或Insight替代它")


-- [T] Map Plugins(DST)
addlist_debug(668708075,"Map Plugins(DST)","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅",2923713671)

-- Extended Map Icons
addlist_debug(1157975551,"Extended Map Icons","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅",2923713671)

-- Wall Map Icons
addlist_debug(449537190,"Wall Map Icons","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅",2923713671)


-- DST Where's My Beefalo?
addlist_debug(347360448,"DST Where's My Beefalo?","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅",2923713671)

-- Where's My Beefalo?
addlist_debug(2565578363,"Where's My Beefalo?","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅",2923713671)


-- Wormhole icons
addlist_debug(821143467,"Wormhole icons","这是一个过时的MOD 且含有BUG 建议您前往创意工坊取消订阅并换成下方推荐的模组\n并搭配Chinese++ Pro来获取中文翻译",2831613121)


-- Wormhole Icons [Fixed]
addlist_debug(1295277999,"Wormhole Icons [Fixed]","这是一个过时的MOD 且含有BUG 建议您前往创意工坊取消订阅并换成下方推荐的模组\n并搭配Chinese++ Pro来获取中文翻译",2831613121)


-- Wormhole Marks [DST]
addlist_debug(362175979,"Wormhole Marks [DST]","这是一个过时的MOD 且含有BUG 建议您前往创意工坊取消订阅并换成下方推荐的模组\n并搭配Chinese++ Pro来修正中文翻译",2621090176)


-- Smarter Crock Pot
addlist_debug(365119238,"Smarter Crock Pot","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅并换成最新版",727774324)

-- craft pot
if not IsmodDownLoad(727774324) then
    -- craft pot(服务器版)
    addlist_debug(3448934423,"craft pot","你订阅了非官方版的craft pot 容易发生兼容性问题\n建议您前往创意工坊取消订阅并换成官方版本",727774324)
    addlist_debug(3445445695,"craft pot","你订阅了非官方版的craft pot 容易发生兼容性问题\n并搭配Chinese++ Pro来获取中文翻译",727774324)
end

-- Egg Pain Together(蛋疼排队论)
addlist_debug(949822556,"Egg Pain Together(蛋疼排队论)","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅并换成最新版",3018652965)

-- Action Queue(DST)
addlist_debug(609051112,"Action Queue(DST)","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅并换成最新版",3018652965)

-- ActionQueue Reborn
addlist_debug(1608191708,"ActionQueue Reborn","这是一个较老的MOD，功能较少\n我建议您前往创意工坊取消订阅并换成最新版",3018652965)

-- 黑化列队行为学
addlist_debug(2898654623,"黑化列队行为学","这是一个较老的MOD，功能较少\n我建议您前往创意工坊取消订阅并换成最新版",3018652965)

-- ActionQueue RB2 (RWYS supported)
addlist_debug(2325441848,"ActionQueue RB2 (RWYS supported)","这是一个较老的MOD，功能较少还是英文！\n我建议您前往创意工坊取消订阅并换成最新的中文版行为学",3018652965)

-- ActionQueue RB3 (New action compatible)
addlist_debug(2873533916,"ActionQueue RB3 (New action compatible)","这是英文版的排队论！\n我建议您前往创意工坊取消订阅并换成中文版滴~",3018652965)

-- 动作队列·重启·叁模组汉化丨ActionQueue RB3 CN
addlist_debug(3415621265,"动作队列·重启·叁","此中文翻译版本较差（机翻？），建议你切换为另一个翻译版本",3018652965)


-- Increased Stack size
addlist_debug(374550642,"Increased Stack size","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅并换成最新版",2774093373)

-- 改变堆叠大小 MAX9999
addlist_debug(1571581787,"改变堆叠大小 MAX9999","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅并换成最新版",2774093373)

-- 999堆叠
addlist_debug(831523966,"999堆叠","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅并换成最新版",2774093373)


-- Display Attack Range
addlist_debug(2078243581,"Display Attack Range","这是一个有BUG的MOD 碰到某些生物会导致服务器崩溃\n建议您前往创意工坊取消订阅",2078243581)


-- Item Info 这是原版
addlist_debug(836583293,"Item Info","这是一个过时的MOD\n建议您前往创意工坊取消订阅并换成最新版",3118627881)

-- Item Info
addlist_debug(1901927445,"Item Info","这是一个过时的MOD\n建议您前往创意工坊取消订阅并换成最新版",3118627881)

-- item info 物品信息 - Shang 汉化版
addlist_debug(2049203096,"item info 物品信息 - Shang 汉化版","这是一个过时的MOD\n建议您前往创意工坊取消订阅并换成最新版",3118627881)

-- Item Info Improved
addlist_debug(2972499450,"Item Info Improved","这是一个过时的MOD 有概率导致游戏崩溃\n建议您前往创意工坊取消订阅并换成最新版",3118627881)

-- 小地图HUD模组汉化丨Minimap HUD CN
addlist_debug(3415567277,"小地图HUD","这不是官方原版的小地图Mod，建议您前往创意工坊切换为官方版本\n并搭配Chinese++ Pro来获取最完整的中文汉化\nTips:官方版本与其它Mod的兼容性更好",345692228)


-- 组合状态[最新/中文]-Combined Status
addlist_debug(2438350724,"组合状态[最新/中文]-Combined Status","这不是官方原版的组合状态，兼容性较差。墙裂建议您前往创意工坊切换为官方版本\n并搭配Chinese++ Pro来获取最完整的中文汉化\nTips:官方版本与其它Mod的兼容性更好",376333686)

-- Combined Status (modified) server version
addlist_debug(1896968971,"Combined Status (modified) server version","你订阅了非官方版的综合状态显示！且是老旧版本！\n请您务必前往创意工坊订阅官方版本！\n并搭配Chinese++ Pro来获取最完整的中文汉化",376333686)

-- Combined Status online(季节时钟转联机)
addlist_debug(3092317730,"Combined Status online(季节时钟转联机)","你订阅了非官方版的综合状态显示！且是老旧版本！\n请您务必前往创意工坊订阅官方版本！\n并搭配Chinese++ Pro来获取最完整的中文汉化",376333686)

-- 综合状态 服务端 Combined Status Server
addlist_debug(2995319954,"综合状态 服务端 Combined Status Server","你订阅了非官方版的综合状态显示！且是老旧版本！\n请您务必前往创意工坊订阅官方版本！\n并搭配Chinese++ Pro来获取最完整的中文汉化",376333686)

-- Combined Status (Server-Sided)
addlist_debug(2885354999,"Combined Status (Server-Sided)","你订阅了非官方版的综合状态显示！且是老旧版本！\n请您务必前往创意工坊订阅官方版本！\n并搭配Chinese++ Pro来获取最完整的中文汉化",376333686)

-- Force Download: Combined Status
addlist_debug(816057392,"Force Download: Combined Status","你订阅了非官方版的综合状态显示！且是老旧版本！\n请您务必前往创意工坊订阅官方版本！\n并搭配Chinese++ Pro来获取最完整的中文汉化",376333686)

-- Combined Status(盗版)
addlist_debug(632083515,"Combined Status","你订阅了非官方版的综合状态显示！且是老旧版本！\n请您务必前往创意工坊订阅官方版本！\n并搭配Chinese++ Pro来获取最完整的中文汉化",376333686)


-- [DST]Too Many Items
addlist_debug(551338671,"[DST]Too Many Items","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅并换成最新版",2896126381)

-- Too Many Items Fix (really old, don't use)
addlist_debug(881455419,"Too Many Items Fix (really old, don't use)","这是一个过时的MOD 含有诸多BUG 连作者都叫你别用！\n请您前往创意工坊取消订阅并换成最新版",2896126381)

-- [TMIP]Too Many Items Plus
addlist_debug(1365141672,"[TMIP]Too Many Items Plus","这是一个过时的MOD\n建议您前往创意工坊取消订阅并换成最新版",2896126381)

-- T键物品增加
addlist_debug(2763963752,"T键物品增加","这是Too Many Items Plus模组的补充包\n建议您前往创意工坊取消订阅此模组还有T键Plus并换成最新版T键",2896126381)


-- 简易血条DST (旧)
addlist_debug(1651623054,"简易血条DST (旧)","这是一个过时的MOD\n建议您前往创意工坊取消订阅并换成最新版",1207269058)


if IsmodDownLoad(1467214795) then
    -- 暖石无限耐久与岛屿冒险同时订阅
    addlist_debug(2634976992,"暖石无限耐久","你同时订阅了暖石无限耐久与岛屿冒险，这两个模组是不兼容的\n建议您前往创意工坊取消订阅并换成兼容的版本",466732225)

    -- 小房子和岛屿冒险同时订阅
    addlist_debug(1951468597,"小房子","你同时订阅了小房子与岛屿冒险，这两个模组是不兼容的\n注意不要同时开启！！！！！！")

    -- 独行长路和岛屿冒险同时订阅
    addlist_debug(2657513551,"独行长路","你同时订阅了独行长路与岛屿冒险，这两个模组是不兼容的\n注意不要同时开启！！！！！！")
end

-- MaxView(大视野)
addlist_debug(804413673,"MaxView(大视野)","这是一个过时的MOD\n建议您前往创意工坊取消订阅并换成OB视角模组",1579421388)


-- Status Announcements 这是原版，太老了
addlist_debug(343753877,"Status Announcements","这是一个过时的MOD\n建议您前往创意工坊取消订阅并换成更新的版本",2785634357)

-- 快捷宣告新·中文（原作授权） 我的评价是不够新！
addlist_debug(2773348050,"快捷宣告新·中文（原作授权）","这是一个过时的MOD\n建议您前往创意工坊取消订阅并换成更新的版本",2785634357)


-- Show Nicknames 显示昵称（客户端）
addlist_debug(956206484,"Show Nicknames 显示昵称（客户端）","这是一个有BUG的MOD\n当玩家因诅咒变为猴子时，游戏会崩溃。\n建议你订阅新版本",2917322514)


-- [Tips]提示猎狗和BOSS的攻击时间
addlist_debug(1898292532,"[Tips]提示猎狗和BOSS的攻击时间","这是一个有问题的MOD！该MOD会每秒遍历全局Ents表占用服务器大量性能！\n建议您前往创意工坊取消订阅！！！",1898292532)


-- 自动寻路 | Never Get Lost
addlist_debug(2119128165,"自动寻路 | Never Get Lost","这是一个有BUG的MOD\n建议您前往创意工坊取消订阅并换成更新的版本",2849308125)


-- 无视服务器MOD过期
addlist_debug(2805318787,"无视服务器MOD过期","此模组会使客户端无视服务器MOD下载状态并强行加入服务器\n这容易导致严重的BUG发生！强烈建议您取消订阅并查看正确的解决方法","https://www.bilibili.com/opus/954763232708395009")


-- 无视服务器MOD过期 by.萌萌的新
addlist_debug(3025319554,"无视服务器MOD过期","此模组会使客户端无视服务器MOD下载状态并强行加入服务器\n这容易导致严重的BUG发生！强烈建议您取消订阅并查看正确的解决方法","https://www.bilibili.com/opus/954763232708395009")


-- Automatic chest sorting
addlist_debug(2321974509,"Automatic chest sorting","这是一个有BUG的MOD\n建议您前往创意工坊取消订阅并换成更新的版本",3223103565)

-- 😶‍🌫️自动整理物品 Automatic chest sorting
addlist_debug(2996027471,"自动整理物品 Automatic chest sorting","这是一个有BUG的MOD\n建议您前往创意工坊取消订阅并换成更新的版本",3223103565)


-- 😶‍🌫️骑牛状态显示 Beefalo Status Bar
addlist_debug(2995399263,"骑牛状态显示 Beefalo Status Bar","这不是官方版的Beefalo Status Bar 兼容性较差（不兼容驯养考拉象MOD）！建议您前往创意工坊切换为官方版本\n并搭配Chinese++ Pro来获取完整的中文汉化",2477889104)


-- 快速丢弃-客户端版本
addlist_debug(873350047,"快速丢弃-客户端版本","此Mod的功能已经被官方收录到原版游戏中了！\n你不需要开启此Mod即可享受它的功能！",873350047)


-- 简易血条DST
addlist_debug(1207269058,"简易血条DST","此Mod在蛇年更新后会有概率导致洞穴崩溃\n请停止使用。",1207269058)


-- 错误追踪
addlist_debug(2427481232,"错误追踪（炸了）","此Mod已停止维护，现在它只会让你的游戏崩溃",2427481232)

if not IsmodDownLoad(2796122895) then
    -- Show Oceanfish（服务器版）
    addlist_debug(3449296058,"Show Oceanfish","这不是官方版的显示鱼群+自动海钓 Mod\n建议您前往创意工坊切换为官方版本",2796122895)
end



AddClassPostConstruct("screens/redux/multiplayermainscreen", function(self) -- 如果在主页面
    self.inst:DoTaskInTime(2, function() -- 等2秒 急了会崩溃0.0
        -- 处理结果并依次展示
        if #debug_list > 0 then

            -- 处理信息
            local title = debug_list[num][1]
            local desc = debug_list[num][2]
            local URL = debug_list[num][3]
            local NewMod = debug_list[num][4]

            show_debug(title,desc,URL,NewMod)
        elseif not IsmodDownLoad(2941527805) then -- 没有订阅Chinese++ Pro
            local PopupDialogScreen = require("screens/redux/popupdialog")
            TheFrontEnd:PushScreen(
                PopupDialogScreen(
                    "MOD检测报告器",
                    "恭喜！我没有检测到你订阅了有问题的MOD！\n你现在可以关闭此模组了。但你还没有订阅Chinese++Pro\n你可以订阅Chinese++ Pro来获取各大官方MOD的翻译！",
                    {
                        {
                            text = "关闭此模组",
                            cb = function()
                                _G.KnownModIndex:Disable(modname) -- 没问题就关闭模组
                                TheFrontEnd:PopScreen()
                            end,
                        },
                        {
                            text = "带我去订阅！",
                            cb = function()
                                _G.VisitURL("https://steamcommunity.com/sharedfiles/filedetails/?id=2941527805")
                            end,
                        },
                    }
                )
            )
        else
            local PopupDialogScreen = require("screens/redux/popupdialog")
            TheFrontEnd:PushScreen(
                PopupDialogScreen(
                    "MOD检测报告器",
                    "恭喜！我没有检测到你订阅了有问题的MOD！\n你现在可以关闭此模组了\n等此模组有更新时，再尝试开启检测\n(如果还有其它有问题的模组但未被检测出来，欢迎前往创意工坊反馈)",
                    {
                        {
                            text = "关闭此模组",
                            cb = function()
                                _G.KnownModIndex:Disable(modname) -- 没问题就关闭模组
                                TheFrontEnd:PopScreen()
                            end,
                        },
                    }
                )
            )
        end
    end)
end)