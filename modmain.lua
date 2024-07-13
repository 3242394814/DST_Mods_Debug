local _G = GLOBAL
local debug_list = {}
num = 1

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
local function addlist_debug(title,desc,URL,NewMod) -- 标题，内容，旧模组创意工坊链接，新的模组替代品
    table.insert(debug_list,{title,desc,URL,NewMod})
end

-- 检测部分（添加到 debug_list）
if IsmodDownLoad(382177939) then -- DST Storm Cellar
    addlist_debug("DST Storm Cellar","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅","https://steamcommunity.com/sharedfiles/filedetails/?id=382177939")
end

if IsmodDownLoad(346962876) then -- DST Freezer
    addlist_debug("DST Freezer","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅","https://steamcommunity.com/sharedfiles/filedetails/?id=346962876")
end

if IsmodDownLoad(363112314) then -- Map Revealer for DST
    addlist_debug("Map Revealer for DST","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅","https://steamcommunity.com/sharedfiles/filedetails/?id=363112314")
end

if IsmodDownLoad(780009141) then -- Finder
    addlist_debug("Finder","这是一个过时的MOD 无法正常使用\n建议您前往创意工坊取消订阅","https://steamcommunity.com/sharedfiles/filedetails/?id=780009141")
end

if IsmodDownLoad(375859599) then -- Health Info
    addlist_debug("Health Info","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅","https://steamcommunity.com/sharedfiles/filedetails/?id=375859599")
end

if IsmodDownLoad(758532836) then -- Global Pause
    addlist_debug("Global Pause","这是一个过时的MOD\n建议您前往创意工坊取消订阅","https://steamcommunity.com/sharedfiles/filedetails/?id=758532836")
end

if IsmodDownLoad(375850593) then -- Extra Equip Slots
    addlist_debug("Extra Equip Slots","这是一个过时的MOD 且含有诸多BUG\n建议您前往创意工坊取消订阅并订阅其它新版本","https://steamcommunity.com/sharedfiles/filedetails/?id=375850593")
end
if IsmodDownLoad(1819567085) then -- DST 四格装备栏
    addlist_debug("DST 四格装备栏","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅并订阅其它新版本","https://steamcommunity.com/sharedfiles/filedetails/?id=1819567085")
end
if IsmodDownLoad(2373346252) then -- 五格装备栏（幽冥汉化版）
    addlist_debug("五格装备栏（幽冥汉化版）","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅并订阅其它新版本","https://steamcommunity.com/sharedfiles/filedetails/?id=2373346252")
end

if IsmodDownLoad(786556008) then -- 45 Inventory Slots 这是原版
    addlist_debug("45 Inventory Slots","这是一个过时的MOD 含有诸多BUG！\n建议您前往创意工坊取消订阅并换成xuopleu制作的整合版？\n(我推荐不订阅45格，BUG总是有的，还不如给自己指令刷一个坎普斯背包)","https://steamcommunity.com/sharedfiles/filedetails/?id=786556008")
end
if IsmodDownLoad(2965758547) then -- 45 Inventory Slots
    addlist_debug("45 Inventory Slots","这是一个过时的MOD 含有诸多BUG！\n建议您前往创意工坊取消订阅并换成xuopleu制作的整合版？\n(我推荐不订阅45格，BUG总是有的，还不如给自己指令刷一个坎普斯背包)","https://steamcommunity.com/sharedfiles/filedetails/?id=2965758547")
end
if IsmodDownLoad(2906717350) then -- 45 Inventory Slots [EquipSlot UI expand]
    addlist_debug("45 Inventory Slots [EquipSlot UI expand]","这是一个过时的MOD 含有诸多BUG！\n建议您前往创意工坊取消订阅并换成xuopleu制作的整合版？\n(我推荐不订阅45格，BUG总是有的，还不如给自己指令刷一个坎普斯背包)","https://steamcommunity.com/sharedfiles/filedetails/?id=2906717350")
end

if IsmodDownLoad(347079953) then -- Display Food Values
    addlist_debug("Display Food Values","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅，并使用Show Me(中文)或Insight替代它","https://steamcommunity.com/sharedfiles/filedetails/?id=347079953")
end

if IsmodDownLoad(668708075) then -- [T] Map Plugins(DST)
    addlist_debug("Map Plugins(DST)","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅","https://steamcommunity.com/sharedfiles/filedetails/?id=668708075","https://steamcommunity.com/sharedfiles/filedetails/?id=2923713671")
end
if IsmodDownLoad(1157975551) then -- Extended Map Icons
    addlist_debug("Extended Map Icons","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅","https://steamcommunity.com/sharedfiles/filedetails/?id=1157975551","https://steamcommunity.com/sharedfiles/filedetails/?id=2923713671")
end
if IsmodDownLoad(449537190) then -- Wall Map Icons
    addlist_debug("Wall Map Icons","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅","https://steamcommunity.com/sharedfiles/filedetails/?id=449537190","https://steamcommunity.com/sharedfiles/filedetails/?id=2923713671")
end

if IsmodDownLoad(347360448) then -- DST Where's My Beefalo?
    addlist_debug("DST Where's My Beefalo?","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅","https://steamcommunity.com/sharedfiles/filedetails/?id=347360448","https://steamcommunity.com/sharedfiles/filedetails/?id=2923713671")
end
if IsmodDownLoad(2565578363) then -- Where's My Beefalo?
    addlist_debug("Where's My Beefalo?","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅","https://steamcommunity.com/sharedfiles/filedetails/?id=2565578363","https://steamcommunity.com/sharedfiles/filedetails/?id=2923713671")
end

if IsmodDownLoad(362175979) then -- Wormhole Marks [DST]
    addlist_debug("Wormhole Marks [DST]","这是一个过时的MOD 且含有BUG 建议您前往创意工坊取消订阅并换成下方推荐的模组\n并搭配Chinese++ Pro来修正中文翻译","https://steamcommunity.com/sharedfiles/filedetails/?id=362175979","https://steamcommunity.com/sharedfiles/filedetails/?id=2621090176")
end

if IsmodDownLoad(365119238) then -- Smarter Crock Pot
    addlist_debug("Smarter Crock Pot","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅并换成最新版","https://steamcommunity.com/sharedfiles/filedetails/?id=365119238","https://steamcommunity.com/sharedfiles/filedetails/?id=727774324")
end

if IsmodDownLoad(609051112) then --Action Queue(DST)
    addlist_debug("Action Queue(DST)","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅并换成最新版","https://steamcommunity.com/sharedfiles/filedetails/?id=609051112","https://steamcommunity.com/sharedfiles/filedetails/?id=3018652965")
end
if IsmodDownLoad(1608191708) then -- ActionQueue Reborn
    addlist_debug("ActionQueue Reborn","这是一个较老的MOD，功能较少\n我建议您前往创意工坊取消订阅并换成最新版","https://steamcommunity.com/sharedfiles/filedetails/?id=1608191708","https://steamcommunity.com/sharedfiles/filedetails/?id=3018652965")
end
if IsmodDownLoad(2898654623) then -- 黑化列队行为学
    addlist_debug("黑化列队行为学","这是一个较老的MOD，功能较少\n我建议您前往创意工坊取消订阅并换成最新版","https://steamcommunity.com/sharedfiles/filedetails/?id=2898654623","https://steamcommunity.com/sharedfiles/filedetails/?id=3018652965")
end
if IsmodDownLoad(2325441848) then -- ActionQueue RB2 (RWYS supported)
    addlist_debug("ActionQueue RB2 (RWYS supported)","这是一个较老的MOD，功能较少还是英文！\n我建议您前往创意工坊取消订阅并换成最新的中文版行为学","https://steamcommunity.com/sharedfiles/filedetails/?id=2325441848","https://steamcommunity.com/sharedfiles/filedetails/?id=3018652965")
end
if IsmodDownLoad(2873533916) then -- ActionQueue RB3 (New action compatible)
    addlist_debug("ActionQueue RB3 (New action compatible)","这是英文版的排队论！\n我建议您前往创意工坊取消订阅并换成中文版滴~","https://steamcommunity.com/sharedfiles/filedetails/?id=2873533916","https://steamcommunity.com/sharedfiles/filedetails/?id=3018652965")
end

if IsmodDownLoad(374550642) then -- Increased Stack size
    addlist_debug("Increased Stack size","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅并换成最新版","https://steamcommunity.com/sharedfiles/filedetails/?id=374550642","https://steamcommunity.com/sharedfiles/filedetails/?id=2774093373")
end
if IsmodDownLoad(1571581787) then -- 改变堆叠大小 MAX9999
    addlist_debug("改变堆叠大小 MAX9999","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅并换成最新版","https://steamcommunity.com/sharedfiles/filedetails/?id=1571581787","https://steamcommunity.com/sharedfiles/filedetails/?id=2774093373")
end
if IsmodDownLoad(831523966) then -- 999堆叠
    addlist_debug("999堆叠","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅并换成最新版","https://steamcommunity.com/sharedfiles/filedetails/?id=831523966","https://steamcommunity.com/sharedfiles/filedetails/?id=2774093373")
end

if IsmodDownLoad(2078243581) then -- Display Attack Range
    addlist_debug("Display Attack Range","这是一个过时的MOD 含有一些BUG\n建议您前往创意工坊取消订阅并换成FIX版","https://steamcommunity.com/sharedfiles/filedetails/?id=2078243581","https://steamcommunity.com/sharedfiles/filedetails/?id=3033933065")
end

if IsmodDownLoad(836583293) then -- Item Info 这是原版
    addlist_debug("Item Info","这是一个过时的MOD\n建议您前往创意工坊取消订阅并换成最新版","https://steamcommunity.com/sharedfiles/filedetails/?id=836583293","https://steamcommunity.com/sharedfiles/filedetails/?id=3118627881")
end
if IsmodDownLoad(1901927445) then -- Item Info
    addlist_debug("Item Info","这是一个过时的MOD\n建议您前往创意工坊取消订阅并换成最新版","https://steamcommunity.com/sharedfiles/filedetails/?id=1901927445","https://steamcommunity.com/sharedfiles/filedetails/?id=3118627881")
end
if IsmodDownLoad(2049203096) then -- item info 物品信息 - Shang 汉化版
    addlist_debug("item info 物品信息 - Shang 汉化版","这是一个过时的MOD\n建议您前往创意工坊取消订阅并换成最新版","https://steamcommunity.com/sharedfiles/filedetails/?id=2049203096","https://steamcommunity.com/sharedfiles/filedetails/?id=3118627881")
end

if IsmodDownLoad(2438350724) then -- 组合状态[最新/中文]-Combined Status
    addlist_debug("组合状态[最新/中文]-Combined Status","这不是官方原版的组合状态，建议您前往创意工坊切换为官方版本\n并搭配Chinese++ Pro来获取最完整的中文汉化","https://steamcommunity.com/sharedfiles/filedetails/?id=2438350724","https://steamcommunity.com/sharedfiles/filedetails/?id=376333686")
end
if IsmodDownLoad(1896968971) and not IsmodDownLoad(376333686) then -- Combined Status (modified) server version 订阅了服务器版综合状态却没有订阅原版
    addlist_debug("Combined Status (modified) server version","你订阅了非官方版的综合状态显示，建议您前往创意工坊切换为官方版本\n并搭配Chinese++ Pro来获取最完整的中文汉化","https://steamcommunity.com/sharedfiles/filedetails/?id=1896968971","https://steamcommunity.com/sharedfiles/filedetails/?id=376333686")
end
if IsmodDownLoad(3092317730) and not IsmodDownLoad(376333686) then -- Combined Status online(季节时钟转联机) 订阅了服务器版综合状态却没有订阅原版
    addlist_debug("Combined Status online(季节时钟转联机)","你订阅了非官方版的综合状态显示，建议您前往创意工坊切换为官方版本\n并搭配Chinese++ Pro来获取最完整的中文汉化","https://steamcommunity.com/sharedfiles/filedetails/?id=3092317730","https://steamcommunity.com/sharedfiles/filedetails/?id=376333686")
end
if IsmodDownLoad(816057392) then -- Force Download: Combined Status
    addlist_debug("Force Download: Combined Status","你订阅了非官方版的综合状态显示！请您前往创意工坊订阅官方版本！\n并搭配Chinese++ Pro来获取最完整的中文汉化","https://steamcommunity.com/sharedfiles/filedetails/?id=816057392","https://steamcommunity.com/sharedfiles/filedetails/?id=376333686")
end

if IsmodDownLoad(551338671) then -- [DST]Too Many Items
    addlist_debug("[DST]Too Many Items","这是一个过时的MOD 含有诸多BUG\n建议您前往创意工坊取消订阅并换成最新版","https://steamcommunity.com/sharedfiles/filedetails/?id=551338671","https://steamcommunity.com/sharedfiles/filedetails/?id=2896126381")
end
if IsmodDownLoad(881455419) then -- Too Many Items Fix (really old, don't use)
    addlist_debug("Too Many Items Fix (really old, don't use)","这是一个过时的MOD 含有诸多BUG 连作者都叫你别用！\n请您前往创意工坊取消订阅并换成最新版","https://steamcommunity.com/sharedfiles/filedetails/?id=881455419","https://steamcommunity.com/sharedfiles/filedetails/?id=2896126381")
end
if IsmodDownLoad(1365141672) then -- [TMIP]Too Many Items Plus
    addlist_debug("[TMIP]Too Many Items Plus","这是一个过时的MOD\n建议您前往创意工坊取消订阅并换成最新版","https://steamcommunity.com/sharedfiles/filedetails/?id=1365141672","https://steamcommunity.com/sharedfiles/filedetails/?id=2896126381")
end
if IsmodDownLoad(2763963752) then -- T键物品增加
    addlist_debug("T键物品增加","这是Too Many Items Plus模组的补充包\n建议您前往创意工坊取消订阅此模组还有T键Plus并换成最新版T键","https://steamcommunity.com/sharedfiles/filedetails/?id=2763963752","https://steamcommunity.com/sharedfiles/filedetails/?id=2896126381")
end

if IsmodDownLoad(2634976992) and IsmodDownLoad(1467214795) then -- 暖石无限耐久与岛屿冒险同时订阅
    addlist_debug("暖石无限耐久","你同时订阅了暖石无限耐久与岛屿冒险，这两个模组是不兼容的\n建议您前往创意工坊取消订阅并换成兼容的版本","https://steamcommunity.com/sharedfiles/filedetails/?id=2634976992","https://steamcommunity.com/sharedfiles/filedetails/?id=466732225")
end
if IsmodDownLoad(1951468597) and IsmodDownLoad(1467214795) then -- 小房子和岛屿冒险同时订阅
    addlist_debug("小房子","你同时订阅了小房子与岛屿冒险，这两个模组是不兼容的\n注意不要同时开启！！！！！！","https://steamcommunity.com/sharedfiles/filedetails/?id=1951468597")
end

if IsmodDownLoad(804413673) then -- MaxView(大视野)
    addlist_debug("MaxView(大视野)","这是一个过时的MOD\n建议您前往创意工坊取消订阅并换成OB视角模组","https://steamcommunity.com/sharedfiles/filedetails/?id=804413673","https://steamcommunity.com/sharedfiles/filedetails/?id=1579421388")
end

if IsmodDownLoad(343753877) then -- Status Announcements 这是原版，太老了
    addlist_debug("Status Announcements","这是一个过时的MOD\n建议您前往创意工坊取消订阅并换成更新的版本","https://steamcommunity.com/sharedfiles/filedetails/?id=343753877","https://steamcommunity.com/sharedfiles/filedetails/?id=2785634357")
end
if IsmodDownLoad(2773348050) then -- 快捷宣告新·中文（原作授权） 评价是不够新！
    addlist_debug("快捷宣告新·中文（原作授权）","这是一个过时的MOD\n建议您前往创意工坊取消订阅并换成更新的版本","https://steamcommunity.com/sharedfiles/filedetails/?id=2773348050","https://steamcommunity.com/sharedfiles/filedetails/?id=2785634357")
end

if IsmodDownLoad(1898292532) then -- [Tips]提示猎狗和BOSS的攻击时间
    addlist_debug("[Tips]提示猎狗和BOSS的攻击时间","这是一个有问题的MOD！该MOD会每秒遍历全局Ents表占用服务器大量性能！\n建议您前往创意工坊取消订阅！！！","https://steamcommunity.com/sharedfiles/filedetails/?id=1898292532")
end

if IsmodDownLoad(2321974509) then -- Automatic chest sorting
    addlist_debug("Automatic chest sorting","这是一个过时的MOD\n建议您前往创意工坊取消订阅并换成更新的版本","https://steamcommunity.com/sharedfiles/filedetails/?id=2321974509","https://steamcommunity.com/sharedfiles/filedetails/?id=3223103565")
end
if IsmodDownLoad(2996027471) then -- 😶‍🌫️自动整理物品 Automatic chest sorting
    addlist_debug("自动整理物品 Automatic chest sorting","这是一个过时的MOD\n建议您前往创意工坊取消订阅并换成更新的版本","https://steamcommunity.com/sharedfiles/filedetails/?id=2996027471","https://steamcommunity.com/sharedfiles/filedetails/?id=3223103565")
end

if IsmodDownLoad(2995399263) then -- 😶‍🌫️骑牛状态显示 Beefalo Status Bar
    addlist_debug("骑牛状态显示 Beefalo Status Bar","这不是官方版的Beefalo Status Bar 兼容性较差（不兼容驯养考拉象MOD）！建议您前往创意工坊切换为官方版本\n并搭配Chinese++ Pro来获取完整的中文汉化","https://steamcommunity.com/sharedfiles/filedetails/?id=2995399263","https://steamcommunity.com/sharedfiles/filedetails/?id=2477889104")
end


AddClassPostConstruct("screens/redux/mainscreen", function(self) -- 如果在主页面
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
                    "恭喜，你的MOD都是最新的！",
                    "但你还没有订阅Chinese++Pro\n你可以订阅Chinese++ Pro来获取各大官方MOD的翻译！",
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
        else
            local PopupDialogScreen = require("screens/redux/popupdialog")
            TheFrontEnd:PushScreen(
                PopupDialogScreen(
                    "MOD检测报告器",
                    "恭喜，你的MOD都是最新的！你现在可以关闭此模组了\n等此模组有更新时，再尝试开启检测",
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