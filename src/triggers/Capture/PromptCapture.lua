-- Capture all variables from the custom prompt (@Caelinus: this is pure genius)
ui = ui or {}

local CHP = matches.CHP
local MHP = matches.MHP
local CMP = matches.CMP
local MMP = matches.MMP
local THP = matches.THP
local TNM = matches.TNM
local CXP = matches.CXP
local NXP = matches.NXP
local GLD = matches.GLD
local QPS = matches.QPS
local HPS = matches.HPS
local RNM = matches.RNM
local EXT = matches.EXT
local LVL = matches.LVL
local FLV = matches.FLV
local LMP = matches.LMP
local ANM = matches.ANM
local RMS = matches.RMS
local VNM = matches.VNM
local QTM = matches.QTM
local ETM = matches.ETM
local GTM = matches.GTM
local JTM = matches.JTM
local XPE = matches.XPE
local QPE = matches.QPE
local QTE = matches.QTE
local MDP = matches.MDP
local PHP = matches.PHP
local PRE = matches.PRE
local PLT = matches.PLT

selectCurrentLine()
deleteLine()

moveCursor("MainBuffer", 0, getLastLineNumber("MainBuffer")-2)
deleteLine("MainBuffer")
deleteLine("MainBuffer")

-- Globalize variables for later use
ui.RoomVNUM = ""
ui.RoomVNUM = VNM
ui.PetsHP = PHP
ui.TargetName = TNM or ""

-- Are we fighting?
ui.hasTarget = false
if string.len(ui.TargetName) ~= 0 then
  ui.hasTarget = true
end

raiseEvent("UI_UpdateStatus", LVL, FLV, NXP, GLD, QPS, HPS, MDP, QTM, ETM, GTM, JTM, XPE, QPE, QTE, PLT) 
raiseEvent("UI_UpdatePrompt", CHP, MHP, CMP, MMP, THP, TNM, LMP, PRE, PHP) 
raiseEvent("UI_UpdateMapName", RNM, ANM, RMS, VNM)

-- prompt #1%h#2%H#3%m#4%M#5%p#6%T#7%x#8%X#9%g#10%C#11%u#12%r#13%e#14%L#15%I#16%n#17%B#18%S#19%R#20%f#21%F#22%J#23%j#24%G#25%k#26%K#27%N#28%P#29%Z#
-- regex = ^(?'PRE'[^#]+|)#1(?'CHP'[^#]+|)#2(?'MHP'[^#]+|)#3(?'CMP'[^#]+|)#4(?'MMP'[^#]+|)#5(?'THP'[^#]+|)#6(?'TNM'[^#]+|)#7(?'CXP'[^#]+|)#8(?'NXP'[^#]+|)#9(?'GLD'[^#]+|)#10(?'QPS'[^#]+|)#11(?'HPS'[^#]+|)#12(?'RNM'[^#]+|)#13(?'EXT'[^#]+|)#14(?'LVL'[^#]+|)#15(?'FLV'[^#]+|)#16(?'LMP'[^#]+|)#17(?'ANM'[^#]+|)#18(?'RMS'[^#]+|)#19(?'VNM'[^#]+|)#20(?'QTM'[^#]+|)#21(?'ETM'[^#]+|)#22(?'GTM'[^#]+|)#23(?'JTM'[^#]+|)#24(?'XPE'[^#]+|)#25(?'QPE'[^#]+|)#26(?'QTE'[^#]+|)#27(?'MDP'[^#]+|)#28(?'PHP'[^#]+)#29(?'PLT'[^#]+)#

--[[
1:Current HP = CHP
2:Max Hp = MHP
3:Current Mana = MCP
4:Max Mana = MMP
5:Target Health = THP
6:Target Name = TNM
7:Current EXP = CXP
8:XP to next = NXP
9:Gold = GLD
10:Quest Points = QPS
11:House Points = HPS
12:Room Name = RNM
13:Exits = EXT
14:Level = LVL
15:Faux Level = FLV
16:Limit Percent = LMP
17:Area Name = ANM
18:Room Sector = RMS
19:Room VNum = VNM
20:Quest Timer = QTM
21:Expedition Timer = ETM
22:Global Quest = GTM
23:Junkyard Timer = JTM
24:EXP Event = XPE
25:QP Event = QPE
26:Quest Timer Event = QTE
27:MudPies = MDP
28:Pet HP = PHP
29:Pigrimage Timer = PLT
00:PromptPrefix = PRE
--]]