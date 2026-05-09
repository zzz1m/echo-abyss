# 《回响深渊》AI素材提示词 - UI与特效

> **ECHO ABYSS - AI Prompts for UI & Effects**
> **文档版本：1.0**
>
> **使用方法：将提示词直接粘贴到 GPT-Image 或其他AI绘图工具中使用**

---

## 目录

1. [UI设计规范](#1-ui设计规范)
2. [主菜单界面](#2-主菜单界面)
3. [游戏HUD](#3-游戏hud)
4. [技能图标](#4-技能图标)
5. [物品图标](#5-物品图标)
6. [战斗特效](#6-战斗特效)
7. [环境特效](#7-环境特效)
8. [UI装饰元素](#8-ui装饰元素)
9. [完整素材清单](#9-完整素材清单)

---

## 1. UI设计规范

### 1.1 UI配色方案

```
【UI主色调】

深渊黑        #0D0D1A   - 主要背景
暗紫蓝        #1A1A2E   - 次要背景
深渊紫        #252240   - 卡片背景
深渊深紫      #3D3D6B   - 按钮悬停

【UI强调色】

聆听青        #08D9D6   - 主要操作/玩家相关
回响黄        #EEFF00   - 重要/能量相关
回响绿        #00FF88   - 成功/正面反馈
回响红        #FF2E63   - 危险/负面/敌人
深渊紫        #7B2CBF   - 特殊/神秘

【UI文字色】

UI白          #E8E8E8   - 主要文字
UI灰          #888888   - 次要文字
UI暗          #555555   - 禁用/低优先级
```

### 1.2 UI元素规范

```
【按钮样式】

- 圆角矩形：8px圆角
- 边框：2px实线
- 悬停效果：发光 + 轻微放大
- 点击效果：颜色加深 + 轻微缩小

【卡片样式】

- 圆角矩形：12px圆角
- 背景：半透明深色
- 边框：1px实线（根据类型变化）
- 阴影：柔和投影

【图标样式】

- 基础尺寸：32x32、48x48、64x64
- 风格：简洁、清晰
- 颜色：纯色或双色
- 背景：透明或与UI背景协调
```

### 1.3 字体与排版

```
【字体选择】

标题：Bold Sans-serif
正文：Regular Sans-serif
数字：Monospace

【排版规范】

- 标题：居中，较大字号
- 正文：左对齐或居中
- 数字：右对齐
- 间距：8px基础单位
```

---

## 2. 主菜单界面

### 2.1 菜单背景

```
═══════════════════════════════════════════════════════════════
【主菜单背景】
═══════════════════════════════════════════════════════════════

Prompt:
"Dark fantasy game main menu background art,
mysterious void space with swirling sound waves,
glowing cyan and purple echoes floating,
ancient ruins floating in abyss,
deep atmospheric background,
game title area with ethereal glow,
cinematic composition, 1920x1080,
high quality, concept art style"

尺寸: 1920x1080
文件名: menu_background.png

用途: 游戏主菜单背景

---

Prompt:
"Dark fantasy game main menu background variant,
mystical portal with swirling energy,
all colors mixing in center,
void-like edges,
dramatic lighting,
ready for text overlay,
game UI background, 1920x1080"

尺寸: 1920x1080
文件名: menu_background_portal.png

用途: 主菜单背景变体
```

### 2.2 菜单按钮

```
═══════════════════════════════════════════════════════════════
【菜单按钮设计】
═══════════════════════════════════════════════════════════════

【普通按钮】

Prompt:
"Dark fantasy game UI button design,
rounded rectangle button with glowing border,
transparent dark background,
glowing cyan edge,
ready for text,
game menu button asset,
pixel art style, 256x64"

尺寸: 256x64
文件名: button_normal.png

---

【悬停状态按钮】

Prompt:
"Dark fantasy game UI button design - hover state,
rounded rectangle button with enhanced glow,
glowing cyan border more prominent,
slight scale up effect,
hover effect preview,
game menu button asset,
pixel art style, 256x64"

尺寸: 256x64
文件名: button_hover.png

---

【禁用状态按钮】

Prompt:
"Dark fantasy game UI button design - disabled state,
rounded rectangle button grayed out,
no glow, muted colors,
game menu button asset,
pixel art style, 256x64"

尺寸: 256x64
文件名: button_disabled.png

---

【主要操作按钮】

Prompt:
"Dark fantasy game UI button design - primary action,
rounded rectangle button with gold/yellow glow,
emphasized importance,
ready for text,
game menu button asset,
pixel art style, 256x64"

尺寸: 256x64
文件名: button_primary.png

---

【危险操作按钮】

Prompt:
"Dark fantasy game UI button design - danger action,
rounded rectangle button with red glow,
warning/danger styling,
game menu button asset,
pixel art style, 256x64"

尺寸: 256x64
文件名: button_danger.png
```

### 2.3 菜单装饰

```
═══════════════════════════════════════════════════════════════
【菜单装饰元素】
═══════════════════════════════════════════════════════════════

【游戏标题Logo背景】

Prompt:
"Dark fantasy game title frame design,
ornate frame with sound wave patterns,
glowing runes at corners,
dark purple and cyan color scheme,
ready for title text,
game UI decoration asset,
pixel art style, 512x128"

尺寸: 512x128
文件名: title_frame.png

---

【分隔线】

Prompt:
"Dark fantasy UI divider line,
glowing sound wave pattern,
horizontal separator,
cyan and purple gradient,
game UI decoration asset,
pixel art style, 256x8"

尺寸: 256x8
文件名: divider.png

---

【角落装饰】

Prompt:
"Dark fantasy UI corner decoration,
ornate corner flourish,
sound wave and rune patterns,
glowing cyan highlights,
game UI corner element,
pixel art style, 128x128"

尺寸: 128x128
文件名: corner_decoration.png
```

---

## 3. 游戏HUD

### 3.1 生命值与能量条

```
═══════════════════════════════════════════════════════════════
【HUD元素设计】
═══════════════════════════════════════════════════════════════

【生命值条背景】

Prompt:
"Dark fantasy game UI health bar frame design,
rounded rectangle container,
dark background with subtle glow,
ready for health fill,
game HUD element,
pixel art style, 256x32"

尺寸: 256x32
文件名: healthbar_frame.png

---

【回响能量条背景】

Prompt:
"Dark fantasy game UI energy bar frame design,
rounded rectangle container,
cyan tinted background,
ready for energy fill,
game HUD element,
pixel art style, 256x32"

尺寸: 256x32
文件名: energybar_frame.png

---

【完整生命值条】

Prompt:
"Dark fantasy game UI complete health bar,
health bar frame with red fill,
showing various fill levels,
notch markers for thresholds,
game HUD element,
pixel art style, 256x32"

尺寸: 256x32
文件名: healthbar_complete.png

---

【完整能量值条】

Prompt:
"Dark fantasy game UI complete energy bar,
energy bar frame with cyan fill,
showing various fill levels,
glowing effect at full,
game HUD element,
pixel art style, 256x32"

尺寸: 256x32
文件名: energybar_complete.png
```

### 3.2 迷你地图与导航

```
═══════════════════════════════════════════════════════════════
【小地图与导航】
═══════════════════════════════════════════════════════════════

【小地图边框】

Prompt:
"Dark fantasy game UI minimap frame design,
circular or rounded square container,
ornate border with sound wave motifs,
dark transparent background,
game HUD element,
pixel art style, 192x192"

尺寸: 192x192
文件名: minimap_frame.png

---

【房间指示器】

Prompt:
"Dark fantasy game UI room indicator icons,
various room type symbols,
cleared room, current room, secret room,
enemy room, shop room, boss room,
game HUD element,
pixel art style, 32x32 each"

尺寸: 64x64 (2x2图标)
文件名: room_indicators.png

---

【区域指示器】

Prompt:
"Dark fantasy game UI zone indicator design,
stylized zone icons,
forest tree, lava flame, deepsea wave, bone skull, abyss void,
region indicator element,
game HUD element,
pixel art style, 64x64"

尺寸: 64x64
文件名: zone_indicator.png
```

### 3.3 角色面板

```
═══════════════════════════════════════════════════════════════
【角色信息面板】
═══════════════════════════════════════════════════════════════

【角色头像框】

Prompt:
"Dark fantasy game UI character portrait frame,
ornate frame with glow effect,
ready for character image,
game HUD element,
pixel art style, 128x128"

尺寸: 128x128
文件名: portrait_frame.png

---

【属性面板背景】

Prompt:
"Dark fantasy game UI stat panel background,
card-like container,
transparent dark background,
ornate border,
ready for stats display,
game HUD element,
pixel art style, 320x240"

尺寸: 320x240
文件名: stat_panel_bg.png

---

【属性图标】

Prompt:
"Dark fantasy game UI stat icons,
health icon, attack icon, defense icon, speed icon,
skill point icon, echo icon,
colored icons with glow,
game HUD element,
pixel art style, 32x32 each"

尺寸: 64x64 (2x2图标)
文件名: stat_icons.png
```

---

## 4. 技能图标

### 4.1 聆听者技能图标

```
═══════════════════════════════════════════════════════════════
【聆听者技能图标】
═══════════════════════════════════════════════════════════════

【被动技能图标 - 聆听之心】

Prompt:
"Dark fantasy game skill icon design,
heart shape with sound wave patterns inside,
glowing cyan aura,
passive skill indicator,
clean icon on transparent background,
game UI element, pixel art style, 64x64"

文件名: skill_listener_passive.png

---

【Q技能图标 - 音波冲击】

Prompt:
"Dark fantasy game skill icon design,
sound wave cone expanding outward,
glowing cyan and green,
energy wave projection,
clean icon on transparent background,
game UI element, pixel art style, 64x64"

文件名: skill_listener_q.png

---

【W技能图标 - 回响护盾】

Prompt:
"Dark fantasy game skill icon design,
hexagonal shield with sound patterns,
glowing cyan barrier effect,
defensive skill indicator,
clean icon on transparent background,
game UI element, pixel art style, 64x64"

文件名: skill_listener_w.png

---

【E技能图标 - 聆听领域】

Prompt:
"Dark fantasy game skill icon design,
circular healing area with pulse rings,
glowing green and cyan,
healing circle indicator,
clean icon on transparent background,
game UI element, pixel art style, 64x64"

文件名: skill_listener_e.png

---

【R技能图标 - 终章：回响齐鸣】

Prompt:
"Dark fantasy game ultimate skill icon design,
multiple sound waves converging,
massive energy burst,
golden glowing edge,
ultimate skill indicator,
clean icon on transparent background,
game UI element, pixel art style, 64x64"

文件名: skill_listener_r.png
```

### 4.2 喧嚣者技能图标

```
═══════════════════════════════════════════════════════════════
【喧嚣者技能图标】
═══════════════════════════════════════════════════════════════

【被动技能图标 - 战鼓节奏】

Prompt:
"Dark fantasy game skill icon design,
drum with rhythm waves,
glowing orange and yellow,
beat indicator,
clean icon on transparent background,
game UI element, pixel art style, 64x64"

文件名: skill_roarer_passive.png

---

【Q技能图标 - 战鼓连击】

Prompt:
"Dark fantasy game skill icon design,
drumsticks striking rapidly,
multiple hit indicators,
orange flame effects,
clean icon on transparent background,
game UI element, pixel art style, 64x64"

文件名: skill_roarer_q.png

---

【W技能图标 - 战吼】

Prompt:
"Dark fantasy game skill icon design,
sound waves expanding outward,
roaring energy,
buff indicator,
clean icon on transparent background,
game UI element, pixel art style, 64x64"

文件名: skill_roarer_w.png

---

【E技能图标 - 怒吼】

Prompt:
"Dark fantasy game skill icon design,
fear effect with skull,
sound wave disruption,
crowd control indicator,
clean icon on transparent background,
game UI element, pixel art style, 64x64"

文件名: skill_roarer_e.png

---

【R技能图标 - 终章：毁灭之鼓】

Prompt:
"Dark fantasy game ultimate skill icon design,
massive drum explosion,
destruction wave,
golden flame border,
ultimate skill indicator,
clean icon on transparent background,
game UI element, pixel art style, 64x64"

文件名: skill_roarer_r.png
```

### 4.3 沉默者技能图标

```
═══════════════════════════════════════════════════════════════
【沉默者技能图标】
═══════════════════════════════════════════════════════════════

【被动技能图标 - 无声移动】

Prompt:
"Dark fantasy game skill icon design,
footprints fading away,
stealth indicator,
purple shadow effect,
clean icon on transparent background,
game UI element, pixel art style, 64x64"

文件名: skill_silent_passive.png

---

【Q技能图标 - 暗影突袭】

Prompt:
"Dark fantasy game skill icon design,
dagger through shadow,
stealth strike indicator,
purple energy,
clean icon on transparent background,
game UI element, pixel art style, 64x64"

文件名: skill_silent_q.png

---

【W技能图标 - 无声步】

Prompt:
"Dark fantasy game skill icon design,
teleport trail effect,
dash indicator,
purple motion blur,
clean icon on transparent background,
game UI element, pixel art style, 64x64"

文件名: skill_silent_w.png

---

【E技能图标 - 寂静领域】

Prompt:
"Dark fantasy game skill icon design,
silence zone indicator,
muted sound waves,
slow effect,
clean icon on transparent background,
game UI element, pixel art style, 64x64"

文件名: skill_silent_e.png

---

【R技能图标 - 终章：无声处决】

Prompt:
"Dark fantasy game ultimate skill icon design,
assassination strike from behind,
critical hit indicator,
purple and gold glow,
ultimate skill indicator,
clean icon on transparent background,
game UI element, pixel art style, 64x64"

文件名: skill_silent_r.png
```

### 4.4 冷却指示器

```
═══════════════════════════════════════════════════════════════
【冷却指示器图标】
═══════════════════════════════════════════════════════════════

【冷却遮罩】

Prompt:
"Dark fantasy game UI skill cooldown overlay,
radial wipe effect showing remaining time,
semi-transparent dark color,
clean icon on transparent background,
game UI element, pixel art style, 64x64"

文件名: cooldown_overlay.png

---

【技能就绪指示】

Prompt:
"Dark fantasy game UI skill ready indicator,
glowing border effect,
ready to cast indicator,
green or golden glow,
clean icon on transparent background,
game UI element, pixel art style, 64x64"

文件名: skill_ready_glow.png

---

【快捷键提示】

Prompt:
"Dark fantasy game UI keybind hint overlay,
letter Q, W, E, R indicators,
keyboard key style,
transparent background,
game UI element, pixel art style, 32x32"

文件名: keybind_hint.png
```

---

## 5. 物品图标

### 5.1 回响币与碎片

```
═══════════════════════════════════════════════════════════════
【货币与收集品图标】
═══════════════════════════════════════════════════════════════

【回响币图标】

Prompt:
"Dark fantasy game currency icon design,
coin with sound wave pattern,
glowing cyan and purple,
currency indicator,
clean icon on transparent background,
game UI element, pixel art style, 32x32"

文件名: currency_echo_coin.png

---

【普通回响碎片图标】

Prompt:
"Dark fantasy game collectible icon design,
small glowing orb,
green color with particles,
health restore indicator,
clean icon on transparent background,
game UI element, pixel art style, 32x32"

文件名: item_echo_fragment_green.png

---

【稀有回响碎片图标】

Prompt:
"Dark fantasy game collectible icon design,
medium glowing orb,
blue color with particles,
health and energy restore indicator,
clean icon on transparent background,
game UI element, pixel art style, 32x32"

文件名: item_echo_fragment_blue.png

---

【传说回响碎片图标】

Prompt:
"Dark fantasy game collectible icon design,
large glowing orb,
golden color with intense particles,
full restore indicator,
clean icon on transparent background,
game UI element, pixel art style, 32x32"

文件名: item_echo_fragment_gold.png
```

### 5.2 装备图标

```
═══════════════════════════════════════════════════════════════
【装备图标】
═══════════════════════════════════════════════════════════════

【聆听者法杖】

Prompt:
"Dark fantasy game weapon icon design,
staff with glowing cyan orb,
sound wave patterns on staff,
listening character weapon,
clean icon on transparent background,
game UI element, pixel art style, 64x64"

文件名: equip_staff_listener.png

---

【喧嚣者战鼓】

Prompt:
"Dark fantasy game weapon icon design,
war drum with runes,
glowing orange energy,
roarer character weapon,
clean icon on transparent background,
game UI element, pixel art style, 64x64"

文件名: equip_drum_roarer.png

---

【沉默者匕首】

Prompt:
"Dark fantasy game weapon icon design,
twin daggers with purple glow,
shadowy effect,
silent character weapon,
clean icon on transparent background,
game UI element, pixel art style, 64x64"

文件名: equip_dagger_silent.png

---

【通用防具图标】

Prompt:
"Dark fantasy game armor icon design,
chestplate with sound wave motifs,
purple glow accents,
defensive gear indicator,
clean icon on transparent background,
game UI element, pixel art style, 64x64"

文件名: equip_armor_generic.png

---

【通用饰品图标】

Prompt:
"Dark fantasy game accessory icon design,
amulet with glowing gem,
mystical artifact,
special effect indicator,
clean icon on transparent background,
game UI element, pixel art style, 64x64"

文件名: equip_accessory_generic.png
```

### 5.3 消耗品图标

```
═══════════════════════════════════════════════════════════════
【消耗品图标】
═══════════════════════════════════════════════════════════════

【生命药水】

Prompt:
"Dark fantasy game consumable icon design,
potion bottle with red liquid,
heart symbol,
health restore consumable,
clean icon on transparent background,
game UI element, pixel art style, 32x32"

文件名: consumable_health_potion.png

---

【能量药水】

Prompt:
"Dark fantasy game consumable icon design,
potion bottle with cyan liquid,
lightning symbol,
energy restore consumable,
clean icon on transparent background,
game UI element, pixel art style, 32x32"

文件名: consumable_energy_potion.png

---

【万能药水】

Prompt:
"Dark fantasy game consumable icon design,
potion bottle with golden liquid,
star symbol,
full restore consumable,
clean icon on transparent background,
game UI element, pixel art style, 32x32"

文件名: consumable_full_potion.png

---

【钥匙图标】

Prompt:
"Dark fantasy game key icon design,
ornate key with sound wave patterns,
mystical artifact,
unlock indicator,
clean icon on transparent background,
game UI element, pixel art style, 32x32"

文件名: item_key.png
```

---

## 6. 战斗特效

### 6.1 伤害数字

```
═══════════════════════════════════════════════════════════════
【伤害数字显示】
═══════════════════════════════════════════════════════════════

【普通伤害数字】

Prompt:
"Dark fantasy game damage number design,
number sprite showing damage value,
white text with dark outline,
damage indicator,
pixel art style, suitable for floating damage numbers,
32x32 frame with transparent background"

文件名: damage_number.png

---

【暴击伤害数字】

Prompt:
"Dark fantasy game critical damage number design,
larger number with exclamation,
golden yellow color,
critical hit indicator,
pixel art style, 48x48 frame with transparent background"

文件名: damage_crit.png

---

【治疗数字】

Prompt:
"Dark fantasy game heal number design,
number with plus symbol,
green color,
healing indicator,
pixel art style, suitable for floating heal numbers,
32x32 frame with transparent background"

文件名: heal_number.png

---

【状态图标】

Prompt:
"Dark fantasy game status effect icons,
poison, burn, slow, stun, silence icons,
small effect indicators,
pixel art style, 24x24 each"

文件名: status_icons.png
```

### 6.2 技能特效精灵图

```
═══════════════════════════════════════════════════════════════
【技能特效精灵图】
═══════════════════════════════════════════════════════════════

【音波冲击特效】

Prompt:
"Pixel art sprite sheet for sound wave attack effect,
4 frames showing wave expanding,
cyan and green sound wave projectile,
expanding ring effect,
dark fantasy game effect,
transparent background, clean sprites, 64x64"

文件名: effect_sound_wave.png
尺寸: 256x64 (4帧)

---

【护盾特效】

Prompt:
"Pixel art sprite sheet for shield effect,
4 frames showing shield appearing,
glowing cyan hexagonal barrier,
forming and stabilizing,
dark fantasy game effect,
transparent background, clean sprites, 64x64"

文件名: effect_shield.png
尺寸: 256x64 (4帧)

---

【治疗领域特效】

Prompt:
"Pixel art sprite sheet for healing area effect,
4 frames showing healing pulse expanding,
green and cyan healing rings,
pulsing outward,
dark fantasy game effect,
transparent background, clean sprites, 128x128"

文件名: effect_heal_area.png
尺寸: 512x128 (4帧)

---

【终极技能特效】

Prompt:
"Pixel art sprite sheet for ultimate skill effect,
6 frames showing massive energy explosion,
all colors converging then exploding,
screen-wide impact,
dark fantasy game effect,
transparent background, clean sprites, 256x256"

文件名: effect_ultimate.png
尺寸: 1536x256 (6帧)

---

【闪避特效】

Prompt:
"Pixel art sprite sheet for dodge effect,
3 frames showing afterimage trail,
character silhouette fading,
motion blur effect,
dark fantasy game effect,
transparent background, clean sprites, 64x64"

文件名: effect_dodge.png
尺寸: 192x64 (3帧)

---

【地面冲击波特效】

Prompt:
"Pixel art sprite sheet for ground pound effect,
4 frames showing shockwave from ground,
expanding ring on ground level,
impact particles,
dark fantasy game effect,
transparent background, clean sprites, 128x128"

文件名: effect_ground_pound.png
尺寸: 512x128 (4帧)
```

### 6.3 通用粒子特效

```
═══════════════════════════════════════════════════════════════
【通用粒子效果】
═══════════════════════════════════════════════════════════════

【击中粒子】

Prompt:
"Dark fantasy game hit particle effect,
burst of small particles on impact,
color varies by element,
impact indicator,
transparent background,
game effect sprite, pixel art style, 32x32"

文件名: particle_hit.png

---

【能量收集粒子】

Prompt:
"Dark fantasy game collect particle effect,
small orbs floating toward collector,
pulling effect,
collection indicator,
transparent background,
game effect sprite, pixel art style, 32x32"

文件名: particle_collect.png

---

【升级粒子】

Prompt:
"Dark fantasy game level up effect,
golden sparkles ascending,
star particles,
achievement indicator,
transparent background,
game effect sprite, pixel art style, 64x64"

文件名: particle_levelup.png

---

【传送门粒子】

Prompt:
"Dark fantasy game portal particle effect,
swirling energy in circle,
teleport indicator,
vortex effect,
transparent background,
game effect sprite, pixel art style, 64x64"

文件名: particle_portal.png

---

【爆炸粒子】

Prompt:
"Dark fantasy game explosion effect,
radial burst of particles,
destruction indicator,
various sizes,
transparent background,
game effect sprite, pixel art style, 128x128"

文件名: particle_explosion.png
```

---

## 7. 环境特效

### 7.1 区域特殊特效

```
═══════════════════════════════════════════════════════════════
【区域环境特效】
═══════════════════════════════════════════════════════════════

【森林 - 回响光点】

Prompt:
"Dark fantasy forest ambient effect,
floating cyan/green particles,
sound echo visualization,
gentle floating motion,
transparent background,
game environment effect, pixel art style, 64x64"

文件名: ambient_forest_particles.png

---

【熔岩 - 火焰喷射】

Prompt:
"Dark fantasy lava ambient effect,
flame burst from vent,
rising fire particles,
heat distortion,
transparent background,
game environment effect, pixel art style, 64x64"

文件名: ambient_lava_flame.png

---

【深海 - 气泡上升】

Prompt:
"Dark fantasy deep sea ambient effect,
rising bubbles,
bioluminescent glow,
underwater atmosphere,
transparent background,
game environment effect, pixel art style, 64x64"

文件名: ambient_deepsea_bubbles.png

---

【骸骨 - 灵魂飘浮】

Prompt:
"Dark fantasy bone cathedral ambient effect,
ghostly wisps floating,
blue ethereal glow,
spectral atmosphere,
transparent background,
game environment effect, pixel art style, 64x64"

文件名: ambient_bone_souls.png

---

【深渊 - 混沌能量】

Prompt:
"Dark fantasy abyss ambient effect,
swirling chaos particles,
all colors mixed,
reality distortion,
transparent background,
game environment effect, pixel art style, 64x64"

文件名: ambient_abyss_chaos.png
```

### 7.2 天气与环境效果

```
═══════════════════════════════════════════════════════════════
【天气系统效果】
═══════════════════════════════════════════════════════════════

【回响雨】

Prompt:
"Dark fantasy echo rain effect,
falling cyan particles,
sound wave shaped drops,
mystical weather,
transparent background,
game weather effect, pixel art style, 64x64"

文件名: weather_echo_rain.png

---

【岩浆雨（危险区）】

Prompt:
"Dark fantasy lava rain effect,
falling fire particles,
danger zone indicator,
volcanic weather,
transparent background,
game weather effect, pixel art style, 64x64"

文件名: weather_lava_rain.png

---

【深海压强波】

Prompt:
"Dark fantasy water pressure wave effect,
expanding pressure ring,
deep sea hazard,
underwater pressure,
transparent background,
game weather effect, pixel art style, 128x128"

文件名: weather_pressure_wave.png
```

### 7.3 危险区域指示

```
═══════════════════════════════════════════════════════════════
【危险区域视觉】
═══════════════════════════════════════════════════════════════

【地面危险区】

Prompt:
"Dark fantasy danger zone indicator,
ground area marked with red glow,
hazard warning pattern,
floor trap indicator,
transparent background,
game hazard effect, pixel art style, 128x128"

文件名: hazard_floor_red.png

---

【安全区指示】

Prompt:
"Dark fantasy safe zone indicator,
ground area marked with green glow,
healing circle pattern,
safe area indicator,
transparent background,
game zone effect, pixel art style, 128x128"

文件名: zone_safe_green.png

---

【BOSS区域指示】

Prompt:
"Dark fantasy boss arena indicator,
dramatic border glow,
warning patterns,
boss encounter zone,
transparent background,
game zone effect, pixel art style, 256x256"

文件名: zone_boss_arena.png

---

【隐藏区域暗示】

Prompt:
"Dark fantasy secret area hint,
subtle wall crack or glow,
slightly different wall texture,
secret passage indicator,
transparent background,
game hint effect, pixel art style, 64x64"

文件名: hint_secret_wall.png
```

---

## 8. UI装饰元素

### 8.1 边框与框架

```
═══════════════════════════════════════════════════════════════
【UI边框设计】
═══════════════════════════════════════════════════════════════

【对话框边框】

Prompt:
"Dark fantasy game dialogue box frame design,
ornate border with sound wave patterns,
dark transparent background,
ready for text,
game UI frame asset,
pixel art style, 512x128"

尺寸: 512x128
文件名: dialog_frame.png

---

【卡片边框】

Prompt:
"Dark fantasy game card frame design,
rounded rectangle container,
glowing border effect,
item card or upgrade card frame,
game UI frame asset,
pixel art style, 192x256"

尺寸: 192x256
文件名: card_frame.png

---

【技能框边框】

Prompt:
"Dark fantasy game skill slot frame,
square container with glow,
ready for skill icon,
cooldown overlay ready,
game UI frame asset,
pixel art style, 64x64"

尺寸: 64x64
文件名: skill_slot_frame.png

---

【装备槽边框】

Prompt:
"Dark fantasy game equipment slot frame,
rounded square container,
type indicator icon,
empty or filled state,
game UI frame asset,
pixel art style, 64x64"

尺寸: 64x64
文件名: equip_slot_frame.png
```

### 8.2 指示器与标记

```
═══════════════════════════════════════════════════════════════
【游戏指示器】
═══════════════════════════════════════════════════════════════

【交互提示】

Prompt:
"Dark fantasy game interaction prompt design,
E key or interaction icon,
glowing cyan color,
press to interact indicator,
transparent background,
game UI element, pixel art style, 32x32"

文件名: prompt_interact.png

---

【NEW标记】

Prompt:
"Dark fantasy game new item indicator,
glowing "NEW" text or badge,
pulsing animation frame,
new content indicator,
transparent background,
game UI element, pixel art style, 64x32"

文件名: indicator_new.png

---

【锁定图标】

Prompt:
"Dark fantasy game locked content icon,
lock symbol,
grayed out or with chain,
locked state indicator,
transparent background,
game UI element, pixel art style, 32x32"

文件名: icon_locked.png

---

【完成标记】

Prompt:
"Dark fantasy game completed checkmark,
glowing green checkmark,
success indicator,
completed state,
transparent background,
game UI element, pixel art style, 32x32"

文件名: indicator_complete.png
```

### 8.3 过渡与动画背景

```
═══════════════════════════════════════════════════════════════
【过渡效果】
═══════════════════════════════════════════════════════════════

【加载画面背景】

Prompt:
"Dark fantasy game loading screen background,
swirling void energy,
echo particles,
loading indicator ready,
atmospheric background,
game UI background, 1920x1080"

尺寸: 1920x1080
文件名: loading_background.png

---

【房间过渡效果】

Prompt:
"Dark fantasy game room transition effect,
door or portal opening,
sound wave fade effect,
transition ready,
transparent background,
game transition effect, pixel art style, 1920x1080"

尺寸: 1920x1080
文件名: transition_room.png

---

【区域过渡效果】

Prompt:
"Dark fantasy game zone transition effect,
swirling portal energy,
color shift between zones,
dramatic transition ready,
transparent background,
game transition effect, pixel art style, 1920x1080"

尺寸: 1920x1080
文件名: transition_zone.png
```

---

## 9. 完整素材清单

### 9.1 UI素材清单

```
═══════════════════════════════════════════════════════════════
【UI素材完整清单】
═══════════════════════════════════════════════════════════════

┌─────────────────────────────────────────────────────────────┐
│ 主菜单                                                      │
├─────────────────────────────────────────────────────────────┤
│ ☐ menu_background.png         - 菜单背景 (1920x1080)        │
│ ☐ menu_background_portal.png   - 菜单背景变体 (1920x1080)   │
│ ☐ button_normal.png           - 普通按钮 (256x64)          │
│ ☐ button_hover.png            - 悬停按钮 (256x64)          │
│ ☐ button_disabled.png         - 禁用按钮 (256x64)          │
│ ☐ button_primary.png          - 主要按钮 (256x64)          │
│ ☐ button_danger.png           - 危险按钮 (256x64)          │
│ ☐ title_frame.png             - 标题框 (512x128)          │
│ ☐ divider.png                - 分隔线 (256x8)             │
│ ☐ corner_decoration.png       - 角落装饰 (128x128)        │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ 游戏HUD                                                      │
├─────────────────────────────────────────────────────────────┤
│ ☐ healthbar_frame.png         - 生命条框 (256x32)          │
│ ☐ energybar_frame.png         - 能量条框 (256x32)          │
│ ☐ healthbar_complete.png      - 完整生命条 (256x32)         │
│ ☐ energybar_complete.png      - 完整能量条 (256x32)         │
│ ☐ minimap_frame.png           - 小地图框 (192x192)         │
│ ☐ room_indicators.png         - 房间指示器 (64x64)         │
│ ☐ zone_indicator.png         - 区域指示器 (64x64)         │
│ ☐ portrait_frame.png          - 头像框 (128x128)           │
│ ☐ stat_panel_bg.png          - 属性面板背景 (320x240)      │
│ ☐ stat_icons.png             - 属性图标 (64x64)           │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ 技能图标                                                      │
├─────────────────────────────────────────────────────────────┤
│ 聆听者技能:                                                  │
│ ☐ skill_listener_passive.png  - 聆听之心 (64x64)          │
│ ☐ skill_listener_q.png        - 音波冲击 (64x64)           │
│ ☐ skill_listener_w.png        - 回响护盾 (64x64)           │
│ ☐ skill_listener_e.png        - 聆听领域 (64x64)           │
│ ☐ skill_listener_r.png        - 终章 (64x64)              │
│                                                              │
│ 喧嚣者技能:                                                  │
│ ☐ skill_roarer_passive.png   - 战鼓节奏 (64x64)          │
│ ☐ skill_roarer_q.png         - 战鼓连击 (64x64)           │
│ ☐ skill_roarer_w.png         - 战吼 (64x64)              │
│ ☐ skill_roarer_e.png         - 怒吼 (64x64)              │
│ ☐ skill_roarer_r.png         - 终章 (64x64)              │
│                                                              │
│ 沉默者技能:                                                  │
│ ☐ skill_silent_passive.png   - 无声移动 (64x64)          │
│ ☐ skill_silent_q.png         - 暗影突袭 (64x64)           │
│ ☐ skill_silent_w.png         - 无声步 (64x64)            │
│ ☐ skill_silent_e.png         - 寂静领域 (64x64)           │
│ ☐ skill_silent_r.png         - 终章 (64x64)              │
│                                                              │
│ 冷却指示:                                                    │
│ ☐ cooldown_overlay.png        - 冷却遮罩 (64x64)          │
│ ☐ skill_ready_glow.png       - 就绪发光 (64x64)          │
│ ☐ keybind_hint.png           - 快捷键提示 (32x32)         │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ 物品图标                                                      │
├─────────────────────────────────────────────────────────────┤
│ 货币:                                                        │
│ ☐ currency_echo_coin.png     - 回响币 (32x32)             │
│ ☐ item_echo_fragment_green.png - 普通碎片 (32x32)         │
│ ☐ item_echo_fragment_blue.png - 稀有碎片 (32x32)         │
│ ☐ item_echo_fragment_gold.png - 传说碎片 (32x32)         │
│                                                              │
│ 装备:                                                        │
│ ☐ equip_staff_listener.png   - 聆听者法杖 (64x64)         │
│ ☐ equip_drum_roarer.png     - 战鼓 (64x64)              │
│ ☐ equip_dagger_silent.png   - 暗影匕首 (64x64)           │
│ ☐ equip_armor_generic.png   - 防具 (64x64)              │
│ ☐ equip_accessory_generic.png - 饰品 (64x64)             │
│                                                              │
│ 消耗品:                                                      │
│ ☐ consumable_health_potion.png - 生命药水 (32x32)         │
│ ☐ consumable_energy_potion.png - 能量药水 (32x32)         │
│ ☐ consumable_full_potion.png - 万能药水 (32x32)           │
│ ☐ item_key.png              - 钥匙 (32x32)              │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ 战斗特效                                                      │
├─────────────────────────────────────────────────────────────┤
│ 伤害显示:                                                    │
│ ☐ damage_number.png           - 伤害数字 (32x32)          │
│ ☐ damage_crit.png            - 暴击数字 (48x48)          │
│ ☐ heal_number.png            - 治疗数字 (32x32)          │
│ ☐ status_icons.png          - 状态图标 (24x24)         │
│                                                              │
│ 技能特效:                                                    │
│ ☐ effect_sound_wave.png      - 音波冲击 (256x64, 4帧)     │
│ ☐ effect_shield.png          - 护盾 (256x64, 4帧)        │
│ ☐ effect_heal_area.png       - 治疗领域 (512x128, 4帧)   │
│ ☐ effect_ultimate.png        - 终极技能 (1536x256, 6帧)  │
│ ☐ effect_dodge.png           - 闪避 (192x64, 3帧)        │
│ ☐ effect_ground_pound.png   - 地面冲击 (512x128, 4帧)   │
│                                                              │
│ 粒子特效:                                                    │
│ ☐ particle_hit.png           - 击中粒子 (32x32)          │
│ ☐ particle_collect.png       - 收集粒子 (32x32)          │
│ ☐ particle_levelup.png       - 升级粒子 (64x64)          │
│ ☐ particle_portal.png        - 传送门粒子 (64x64)        │
│ ☐ particle_explosion.png     - 爆炸粒子 (128x128)        │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ 环境特效                                                      │
├─────────────────────────────────────────────────────────────┤
│ 区域特效:                                                    │
│ ☐ ambient_forest_particles.png - 森林光点 (64x64)         │
│ ☐ ambient_lava_flame.png     - 熔岩火焰 (64x64)           │
│ ☐ ambient_deepsea_bubbles.png - 深海气泡 (64x64)          │
│ ☐ ambient_bone_souls.png    - 灵魂飘浮 (64x64)           │
│ ☐ ambient_abyss_chaos.png   - 混沌能量 (64x64)           │
│                                                              │
│ 天气:                                                        │
│ ☐ weather_echo_rain.png     - 回响雨 (64x64)            │
│ ☐ weather_lava_rain.png     - 岩浆雨 (64x64)             │
│ ☐ weather_pressure_wave.png - 压强波 (128x128)           │
│                                                              │
│ 危险区:                                                      │
│ ☐ hazard_floor_red.png      - 危险区 (128x128)           │
│ ☐ zone_safe_green.png       - 安全区 (128x128)           │
│ ☐ zone_boss_arena.png       - BOSS区 (256x256)          │
│ ☐ hint_secret_wall.png      - 隐藏暗示 (64x64)          │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ 边框与装饰                                                    │
├─────────────────────────────────────────────────────────────┤
│ ☐ dialog_frame.png           - 对话框 (512x128)           │
│ ☐ card_frame.png            - 卡片框 (192x256)           │
│ ☐ skill_slot_frame.png      - 技能框 (64x64)              │
│ ☐ equip_slot_frame.png      - 装备槽 (64x64)              │
│ ☐ prompt_interact.png        - 交互提示 (32x32)           │
│ ☐ indicator_new.png          - NEW标记 (64x32)            │
│ ☐ icon_locked.png           - 锁定图标 (32x32)            │
│ ☐ indicator_complete.png     - 完成标记 (32x32)           │
│ ☐ loading_background.png    - 加载背景 (1920x1080)       │
│ ☐ transition_room.png       - 房间过渡 (1920x1080)       │
│ ☐ transition_zone.png       - 区域过渡 (1920x1080)       │
└─────────────────────────────────────────────────────────────┘
```

### 9.2 生成优先级

```
═══════════════════════════════════════════════════════════════
【UI素材生成优先级】
═══════════════════════════════════════════════════════════════

【第一优先级 - 核心UI】

必须生成，否则游戏无法运行：

- 菜单背景 × 1
- 按钮 × 3种状态
- 生命条/能量条 × 2
- 技能图标 × 12个（每个角色4个技能）
- 伤害数字 × 2种
- 对话框 × 1

总计：约25个素材

【第二优先级 - 完整游戏】

建议生成，提供完整游戏体验：

- 所有技能图标（包含被动）
- 所有物品图标
- 特效精灵图 × 5-6个
- HUD框架 × 5-6个
- 交互提示 × 3-4个

总计：约50个素材

【第三优先级 - 完美呈现】

可选生成，提升游戏品质：

- 菜单装饰全套
- 所有粒子特效
- 环境特效 × 5个
- 天气效果 × 3个
- 过渡效果 × 2个
- 特殊标记 × 4-5个

总计：约75个素材
```

---

## 附录：快速参考表

### 常用尺寸速查

```
图标类：32x32, 48x48, 64x64
精灵图：64x64, 128x128, 256x256
HUD元素：256x32, 320x240
背景：1920x1080, 2560x1440
```

### 常用颜色速查

```
玩家/正面：#08D9D6 (聆听青)
危险/敌人：#FF2E63 (回响红)
能量/道具：#EEFF00 (回响黄)
成功/治疗：#00FF88 (回响绿)
神秘/特殊：#7B2CBF (深渊紫)
背景：#0D0D1A, #1A1A2E
```

### 常用关键词速查

```
UI类：
- "game UI element" (游戏UI元素)
- "pixel art style" (像素风格)
- "transparent background" (透明背景)

特效类：
- "game effect sprite" (游戏特效精灵)
- "particle effect" (粒子特效)
- "expanding ring" (扩散圆环)

氛围类：
- "ambient effect" (氛围特效)
- "dark fantasy atmosphere" (暗黑奇幻氛围)
- "glowing" (发光效果)
```

---

**文档版本：1.0**
**最后更新：2025年**

---

## 总结

现在你已经拥有了完整的**《回响深渊》**游戏设计文档和AI素材提示词：

### 设计文档（`/workspace/docs/`）

| 文档 | 内容 |
|------|------|
| `01_world_lore.md` | 世界观与背景设定 |
| `02_characters.md` | 角色与NPC详细设计 |
| `03_zones.md` | 区域与地点设计 |
| `04_skills.md` | 职业技能系统设计 |
| `05_enemies.md` | 敌人与BOSS设计 |

### AI素材提示词（`/workspace/prompts/`）

| 文档 | 内容 |
|------|------|
| `05_character_prompts.md` | 角色与NPC素材提示词 |
| `06_enemy_prompts.md` | 敌人设计提示词 |
| `07_environment_prompts.md` | 环境与场景提示词 |
| `08_ui_effects_prompts.md` | UI与特效提示词 |

### 下一步

你可以：

1. **阅读设计文档**，确认设计方向
2. **使用提示词**，开始生成AI素材
3. **开始Godot开发**，构建游戏核心系统
4. **逐步迭代**，根据实际情况调整设计

如果需要我开始帮你创建Godot项目结构或核心代码，随时告诉我！ 🎮
