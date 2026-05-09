# 《回响深渊》AI素材提示词 - 敌人设计

> **ECHO ABYSS - AI Prompts for Enemy Design**
> **文档版本：1.0**
>
> **使用方法：将提示词直接粘贴到 GPT-Image 或其他AI绘图工具中使用**

---

## 目录

1. [敌人素材规范](#1-敌人素材规范)
2. [小型敌人](#2-小型敌人)
3. [中型敌人](#3-中型敌人)
4. [精英敌人](#4-精英敌人)
5. [BOSS设计](#5-boss设计)
6. [敌人精灵图模板](#6-敌人精灵图模板)
7. [批量生成清单](#7-批量生成清单)

---

## 1. 敌人素材规范

### 1.1 统一视觉语言

```
【敌人视觉特征】

所有敌人共有的特征：
- 发光的轮廓（根据敌人类型变化）
- 回响污染的痕迹（扭曲的身体）
- 声音可视化的特效

【敌人颜色编码】

红色系敌人（攻击型）：
- 强调色：#FF2E63
- 用于：危险标记、攻击特效

紫色系敌人（魔法型）：
- 强调色：#7B2CBF
- 用于：魔法特效、神秘感

绿色系敌人（森林）：
- 强调色：#00FF88
- 用于：森林区域敌人

橙色系敌人（熔岩）：
- 强调色：#FF6B35
- 用于：熔岩区域敌人

蓝色系敌人（深海）：
- 强调色：#00BFFF
- 用于：深海区域敌人

白色系敌人（骸骨）：
- 强调色：#FFFFFF
- 用于：骸骨圣殿敌人
```

### 1.2 素材尺寸规范

```
【敌人素材尺寸】

小型敌人（Scouts）：
- 尺寸：32x32 或 48x48 像素
- 示例：回响蝙蝠、阴影爬行者

中型敌人（Soldiers）：
- 尺寸：64x64 像素
- 示例：回响巨人、旋律猎手

精英敌人（Elites）：
- 尺寸：96x96 或 128x128 像素
- 示例：不谐之音、余响守护者

BOSS敌人（Bosses）：
- 尺寸：128x128 或 256x256 像素
- 特殊：可能需要多个角度

【精灵图帧数】
- 待机：2-4帧
- 移动：4-6帧
- 攻击：3-5帧
- 死亡：2-3帧
```

### 1.3 区域风格匹配

```
【回响森林敌人风格】
- 暗绿色调：#1A2E1A
- 发光植物：#00FF88
- 扭曲树木元素
- 藤蔓和真菌装饰

【熔岩回响敌人风格】
- 暗红色调：#2E1A1A
- 火焰效果：#FF6B35
- 岩浆和灰烬元素
- 扭曲的金属装饰

【深海低语敌人风格】
- 深蓝色调：#1A1A2E
- 生物发光：#00BFFF
- 水母和珊瑚元素
- 气泡特效

【骸骨圣殿敌人风格】
- 灰白色调：#2E2E2E
- 骨头元素：#FFFFFF
- 幽灵效果：淡蓝色
- 符文装饰

【深渊核心敌人风格】
- 深渊黑色调：#0D0D1A
- 混合所有颜色
- 扭曲和混沌
- 声音可视化
```

---

## 2. 小型敌人

### 2.1 回响蝙蝠

```
═══════════════════════════════════════════════════════════════
【回响蝙蝠】Echo Bat
═══════════════════════════════════════════════════════════════

区域：回响森林（主要）
编号：ENEMY_001

───────────────────────────────────────────────────────────────
【完整立绘】
───────────────────────────────────────────────────────────────

Prompt:
"Dark fantasy creature design of an echo bat monster,
small flying creature made of sound waves,
translucent dark purple body with glowing edges,
red glowing eyes, fangs visible,
wings shaped like sound wave patterns,
ethereal floating effect,
color palette: #1A1A2E (body), #FF2E63 (eyes), #7B2CBF (wings),
game enemy design, detailed, pixel art compatible,
transparent background"

尺寸建议: 128x128
用途: 敌人展示、图鉴

───────────────────────────────────────────────────────────────
【精灵图序列】
───────────────────────────────────────────────────────────────

【飞行精灵图】

Prompt:
"Pixel art sprite sheet for echo bat flying animation,
4 frames showing wing flap cycle,
translucent dark purple body, red glowing eyes,
sound wave wing shapes, hovering motion,
dark fantasy game style,
transparent background, clean sprites,
consistent size 32x32"

文件名: bat_fly_sheet.png
尺寸: 128x32 (4帧)

---

【攻击精灵图】

Prompt:
"Pixel art sprite sheet for echo bat attack animation,
3 frames (swoop down, bite, return),
dark purple bat diving with speed lines,
red glow effect on attack,
dark fantasy game style,
transparent background, 32x32 frames"

文件名: bat_attack_sheet.png
尺寸: 96x32 (3帧)

---

【死亡精灵图】

Prompt:
"Pixel art sprite sheet for echo bat death animation,
3 frames (dissolve into particles, fade, gone),
purple bat disintegrating into cyan/purple light particles,
soul fragment floating upward,
dark fantasy game style,
transparent background, 32x32 frames"

文件名: bat_death_sheet.png
尺寸: 96x32 (3帧)

───────────────────────────────────────────────────────────────
【头像/图标】
───────────────────────────────────────────────────────────────

Prompt:
"Game enemy icon for echo bat,
front view of bat creature with sound wave wings,
glowing red eyes, fangs bared,
dark purple and red color scheme,
circular icon frame, detailed,
pixel art style, transparent background"

尺寸建议: 64x64
文件名: bat_icon.png
```

### 2.2 阴影爬行者

```
═══════════════════════════════════════════════════════════════
【阴影爬行者】Shadow Crawler
═══════════════════════════════════════════════════════════════

区域：回响森林、骸骨圣殿
编号：ENEMY_002

───────────────────────────────────────────────────────────────
【完整立绘】
───────────────────────────────────────────────────────────────

Prompt:
"Dark fantasy creature design of a shadow crawler monster,
spider-like creature made of dark shadows,
six legs, semi-transparent dark body,
glowing red compound eyes,
sharp claws, shadowy vapor trailing,
crawling pose, predatory stance,
color palette: #0D0D1A (body), #FF2E63 (eyes), #1A1A2E (shadows),
game enemy design, detailed, pixel art compatible,
transparent background"

尺寸建议: 128x128
用途: 敌人展示、图鉴

───────────────────────────────────────────────────────────────
【精灵图序列】
───────────────────────────────────────────────────────────────

【爬行精灵图】

Prompt:
"Pixel art sprite sheet for shadow crawler walking animation,
4 frames showing leg movement cycle,
dark spider creature skittering,
six legs in alternating motion,
red eyes glowing,
dark fantasy game style,
transparent background, clean sprites, 32x32"

文件名: crawler_walk_sheet.png
尺寸: 128x32 (4帧)

---

【攻击精灵图】

Prompt:
"Pixel art sprite sheet for shadow crawler attack animation,
3 frames (rear up, strike, return),
spider creature raising front legs to attack,
sharp claws extended, red glow,
dark fantasy game style,
transparent background, 32x32 frames"

文件名: crawler_attack_sheet.png
尺寸: 96x32 (3帧)

---

【潜伏精灵图】

Prompt:
"Pixel art sprite sheet for shadow crawler ambush animation,
3 frames (fade into shadow, hidden, emerge),
dark spider becoming invisible in darkness,
only red eyes visible in shadow,
dark fantasy game style,
transparent background, 32x32 frames"

文件名: crawler_ambush_sheet.png
尺寸: 96x32 (3帧)

───────────────────────────────────────────────────────────────
【头像/图标】
───────────────────────────────────────────────────────────────

Prompt:
"Game enemy icon for shadow crawler,
front view of spider creature with glowing red eyes,
six legs visible, shadowy body,
dark purple and red color scheme,
circular icon frame, detailed,
pixel art style, transparent background"

尺寸建议: 64x64
文件名: crawler_icon.png
```

### 2.3 旋律幽灵

```
═══════════════════════════════════════════════════════════════
【旋律幽灵】Melody Specter
═══════════════════════════════════════════════════════════════

区域：回响森林、深海低语、骸骨圣殿
编号：ENEMY_003

───────────────────────────────────────────────────────────────
【完整立绘】
───────────────────────────────────────────────────────────────

Prompt:
"Dark fantasy creature design of a melody specter ghost,
semi-transparent ghostly figure made of sound waves,
glowing cyan outline, ethereal floating,
hooded cloak shape, no visible face,
music notes floating around body,
ghostly tail trailing like sound waves,
color palette: #08D9D6 (glow), #1A1A2E (body), #7B2CBF (accents),
game enemy design, detailed, pixel art compatible,
transparent background"

尺寸建议: 128x128
用途: 敌人展示、图鉴

───────────────────────────────────────────────────────────────
【精灵图序列】
───────────────────────────────────────────────────────────────

【飘浮精灵图】

Prompt:
"Pixel art sprite sheet for melody specter floating animation,
4 frames showing gentle bobbing and flowing,
ghostly figure with sound wave trail,
cyan glowing outline, music notes,
dark fantasy game style,
transparent background, clean sprites, 48x48"

文件名: specter_float_sheet.png
尺寸: 192x48 (4帧)

---

【攻击精灵图】

Prompt:
"Pixel art sprite sheet for melody specter attack animation,
3 frames (charge up, fire beam, release),
ghost raising arms, cyan energy beam shooting forward,
sound wave projectiles,
dark fantasy game style,
transparent background, 48x48 frames"

文件名: specter_attack_sheet.png
尺寸: 144x48 (3帧)

---

【隐身精灵图】

Prompt:
"Pixel art sprite sheet for melody specter phase animation,
4 frames (solid, flickering, translucent, invisible),
ghost becoming more transparent,
only glowing outline visible at end,
dark fantasy game style,
transparent background, 48x48 frames"

文件名: specter_phase_sheet.png
尺寸: 192x48 (4帧)

───────────────────────────────────────────────────────────────
【头像/图标】
───────────────────────────────────────────────────────────────

Prompt:
"Game enemy icon for melody specter,
ghostly hooded figure with glowing cyan edges,
music notes floating around,
ethereal mysterious appearance,
dark blue and cyan color scheme,
circular icon frame, detailed,
pixel art style, transparent background"

尺寸建议: 64x64
文件名: specter_icon.png
```

### 2.4 回响甲虫

```
═══════════════════════════════════════════════════════════════
【回响甲虫】Echo Beetle
═══════════════════════════════════════════════════════════════

区域：熔岩回响
编号：ENEMY_004

───────────────────────────────────────────────────────────────
【完整立绘】
───────────────────────────────────────────────────────────────

Prompt:
"Dark fantasy creature design of an echo beetle monster,
large insect with hard shell made of dark red crystal,
sound wave patterns carved on shell,
six legs, powerful mandibles,
glowing orange cracks in shell like lava,
roll-up defense pose shown,
color palette: #2E1A1A (shell), #FF6B35 (cracks), #FF2E63 (glow),
game enemy design, detailed, pixel art compatible,
transparent background"

尺寸建议: 128x128
用途: 敌人展示、图鉴

───────────────────────────────────────────────────────────────
【精灵图序列】
───────────────────────────────────────────────────────────────

【爬行精灵图】

Prompt:
"Pixel art sprite sheet for echo beetle walking animation,
4 frames showing leg movement,
large red beetle creature, shell glowing,
dark fantasy game style,
transparent background, clean sprites, 48x48"

文件名: beetle_walk_sheet.png
尺寸: 192x48 (4帧)

---

【滚动冲锋精灵图】

Prompt:
"Pixel art sprite sheet for echo beetle roll attack animation,
4 frames (curl up, spin, roll forward, uncurl),
beetle forming ball shape, rolling with fire trail,
dark red with orange glow,
dark fantasy game style,
transparent background, 48x48 frames"

文件名: beetle_roll_sheet.png
尺寸: 192x48 (4帧)

---

【死亡精灵图】

Prompt:
"Pixel art sprite sheet for echo beetle death animation,
3 frames (crack appears, shell shatters, lava spills),
beetle shell breaking apart, orange lava leaking,
dark fantasy game style,
transparent background, 48x48 frames"

文件名: beetle_death_sheet.png
尺寸: 144x48 (3帧)

───────────────────────────────────────────────────────────────
【头像/图标】
───────────────────────────────────────────────────────────────

Prompt:
"Game enemy icon for echo beetle,
front view of armored beetle with glowing cracks,
dark red shell with sound wave patterns,
intimidating mandibles,
dark red and orange color scheme,
circular icon frame, detailed,
pixel art style, transparent background"

尺寸建议: 64x64
文件名: beetle_icon.png
```

---

## 3. 中型敌人

### 3.1 回响巨人

```
═══════════════════════════════════════════════════════════════
【回响巨人】Echo Colossus
═══════════════════════════════════════════════════════════════

区域：熔岩回响、深海低语
编号：ENEMY_010

───────────────────────────────────────────────────────────────
【完整立绘】
───────────────────────────────────────────────────────────────

Prompt:
"Dark fantasy creature design of an echo colossus,
massive humanoid creature made of dark stone and shadows,
glowing red cracks all over body like veins,
hulking powerful build, fists the size of boulders,
glowing sound wave patterns on chest,
looming over viewer, imposing presence,
color palette: #2E2E2E (stone), #FF2E63 (cracks), #1A1A2E (shadows),
game enemy design, detailed, pixel art compatible,
transparent background"

尺寸建议: 256x256
用途: 敌人展示、图鉴

───────────────────────────────────────────────────────────────
【精灵图序列】
───────────────────────────────────────────────────────────────

【行走精灵图】

Prompt:
"Pixel art sprite sheet for echo colossus walking animation,
4 frames showing heavy footsteps,
massive stone creature trudging forward,
red glowing cracks pulsing with each step,
dark fantasy game style,
transparent background, clean sprites, 96x96"

文件名: colossus_walk_sheet.png
尺寸: 384x96 (4帧)

---

【攻击精灵图】

Prompt:
"Pixel art sprite sheet for echo colossus attack animation,
4 frames (raise fist, slam down, impact, recovery),
giant raising massive fist, ground crack on impact,
red energy explosion,
dark fantasy game style,
transparent background, 96x96 frames"

文件名: colossus_attack_sheet.png
尺寸: 384x96 (4帧)

---

【怒吼精灵图】

Prompt:
"Pixel art sprite sheet for echo colossus roar animation,
3 frames (inhale, roar, shockwave),
stone creature opening mouth wide,
red energy coming from mouth,
expanding shockwave ring,
dark fantasy game style,
transparent background, 96x96 frames"

文件名: colossus_roar_sheet.png
尺寸: 288x96 (3帧)

───────────────────────────────────────────────────────────────
【头像/图标】
───────────────────────────────────────────────────────────────

Prompt:
"Game enemy icon for echo colossus,
head and shoulders of massive stone creature,
glowing red cracks on face,
intimidating expression,
dark gray and red color scheme,
circular icon frame, detailed,
pixel art style, transparent background"

尺寸建议: 128x128
文件名: colossus_icon.png
```

### 3.2 旋律猎手

```
═══════════════════════════════════════════════════════════════
【旋律猎手】Melody Hunter
═══════════════════════════════════════════════════════════════

区域：熔岩回响、深海低语、骸骨圣殿
编号：ENEMY_011

───────────────────────────────────────────────────────────────
【完整立绘】
───────────────────────────────────────────────────────────────

Prompt:
"Dark fantasy creature design of a melody hunter,
humanoid hunter figure made of sound waves,
body composed of floating musical notes and sound bars,
glowing cyan eyes, archer stance,
holding bow made of sound waves,
agile sleek build, floating motion,
color palette: #08D9D6 (body), #7B2CBF (accents), #0D0D1A (outline),
game enemy design, detailed, pixel art compatible,
transparent background"

尺寸建议: 256x256
用途: 敌人展示、图鉴

───────────────────────────────────────────────────────────────
【精灵图序列】
───────────────────────────────────────────────────────────────

【移动精灵图】

Prompt:
"Pixel art sprite sheet for melody hunter moving animation,
6 frames showing fluid gliding motion,
sound wave humanoid floating forward,
musical notes trailing behind,
dark fantasy game style,
transparent background, clean sprites, 64x64"

文件名: hunter_move_sheet.png
尺寸: 384x64 (6帧)

---

【射击精灵图】

Prompt:
"Pixel art sprite sheet for melody hunter attack animation,
4 frames (draw bow, aim, fire, relax),
sound wave archer drawing glowing arrow,
release with sonic boom effect,
dark fantasy game style,
transparent background, 64x64 frames"

文件名: hunter_attack_sheet.png
尺寸: 256x64 (4帧)

---

【闪避精灵图】

Prompt:
"Pixel art sprite sheet for melody hunter dodge animation,
3 frames (blur, vanish, reappear elsewhere),
hunter dodging with afterimage,
appearing at different position,
dark fantasy game style,
transparent background, 64x64 frames"

文件名: hunter_dodge_sheet.png
尺寸: 192x64 (3帧)

───────────────────────────────────────────────────────────────
【头像/图标】
───────────────────────────────────────────────────────────────

Prompt:
"Game enemy icon for melody hunter,
upper body of sound wave archer,
glowing cyan eyes, musical note details,
holding bow, ready stance,
dark blue and cyan color scheme,
circular icon frame, detailed,
pixel art style, transparent background"

尺寸建议: 128x128
文件名: hunter_icon.png
```

### 3.3 合唱团领唱

```
═══════════════════════════════════════════════════════════════
【合唱团领唱】Chorus Leader
═══════════════════════════════════════════════════════════════

区域：骸骨圣殿
编号：ENEMY_012

───────────────────────────────────────────────────────────────
【完整立绘】
───────────────────────────────────────────────────────────────

Prompt:
"Dark fantasy creature design of chorus leader,
skeletal conductor figure made of bones and sound,
wearing tattered musical robes,
holding conductor baton made of light,
surrounded by floating music notes and clefs,
commanding pose, ghostly aura,
color palette: #FFFFFF (bones), #08D9D6 (energy), #7B2CBF (robes),
game enemy design, detailed, pixel art compatible,
transparent background"

尺寸建议: 256x256
用途: 敌人展示、图鉴

───────────────────────────────────────────────────────────────
【精灵图序列】
───────────────────────────────────────────────────────────────

【指挥精灵图】

Prompt:
"Pixel art sprite sheet for chorus leader conducting animation,
4 frames showing baton movements,
skeletal conductor with music notes floating,
dark fantasy game style,
transparent background, clean sprites, 64x64"

文件名: chorus_idle_sheet.png
尺寸: 256x64 (4帧)

---

【召唤精灵图】

Prompt:
"Pixel art sprite sheet for chorus leader summon animation,
4 frames (raise baton, energy gather, summon, release),
skeletal figure calling minions,
sound wave energy exploding,
dark fantasy game style,
transparent background, 64x64 frames"

文件名: chorus_summon_sheet.png
尺寸: 256x64 (4帧)

---

【死亡精灵图】

Prompt:
"Pixel art sprite sheet for chorus leader death animation,
3 frames (collapse, explode, gone),
skeletal figure crumbling apart,
soul energy releasing,
dark fantasy game style,
transparent background, 64x64 frames"

文件名: chorus_death_sheet.png
尺寸: 192x64 (3帧)

───────────────────────────────────────────────────────────────
【头像/图标】
───────────────────────────────────────────────────────────────

Prompt:
"Game enemy icon for chorus leader,
skeletal conductor with glowing baton,
music notes surrounding,
ghostly ethereal appearance,
white and cyan color scheme,
circular icon frame, detailed,
pixel art style, transparent background"

尺寸建议: 128x128
文件名: chorus_icon.png
```

---

## 4. 精英敌人

### 4.1 不谐之音

```
═══════════════════════════════════════════════════════════════
【不谐之音】Dissonant One
═══════════════════════════════════════════════════════════════

区域：骸骨圣殿
类型：精英敌人
编号：ENEMY_020

───────────────────────────────────────────────────────────────
【完整立绘】
───────────────────────────────────────────────────────────────

Prompt:
"Dark fantasy elite enemy design of dissonant one,
twisted humanoid figure made of conflicting colors and sounds,
body constantly distorting and shifting,
multiple arms in different poses,
crying and laughing faces appearing and disappearing,
surrounded by chaotic sound waves and noise patterns,
terrifying unstable appearance,
color palette: #FF2E63, #08D9D6, #EEFF00, #7B2CBF (chaotic mix),
game elite enemy design, highly detailed, pixel art compatible,
transparent background"

尺寸建议: 256x256
用途: 精英敌人展示

───────────────────────────────────────────────────────────────
【精灵图序列】
───────────────────────────────────────────────────────────────

【待机精灵图】

Prompt:
"Pixel art sprite sheet for dissonant one idle animation,
4 frames showing constant body distortion,
twisted humanoid figure with shifting colors,
arms moving independently,
chaotic sound waves surrounding,
dark fantasy game style,
transparent background, clean sprites, 96x96"

文件名: dissonant_idle_sheet.png
尺寸: 384x96 (4帧)

---

【攻击精灵图】

Prompt:
"Pixel art sprite sheet for dissonant one attack animation,
4 frames (grab, strike, chaos wave, recover),
twisted figure reaching out with multiple arms,
chaotic energy wave exploding,
dark fantasy game style,
transparent background, 96x96 frames"

文件名: dissonant_attack_sheet.png
尺寸: 384x96 (4帧)

---

【闪现精灵图】

Prompt:
"Pixel art sprite sheet for dissonant one teleport animation,
4 frames (dissolve, trail, reform, appear),
figure breaking into noise particles,
teleporting with distortion trail,
dark fantasy game style,
transparent background, 96x96 frames"

文件名: dissonant_teleport_sheet.png
尺寸: 384x96 (4帧)

───────────────────────────────────────────────────────────────
【头像/图标】
───────────────────────────────────────────────────────────────

Prompt:
"Game elite enemy icon for dissonant one,
twisted distorted face with multiple features,
conflicting colors swirling,
terrifying chaotic appearance,
red, cyan, yellow, purple chaos,
circular icon frame, highly detailed,
pixel art style, transparent background"

尺寸建议: 128x128
文件名: dissonant_icon.png
```

### 4.2 余响守护者

```
═══════════════════════════════════════════════════════════════
【余响守护者】Reverberation Guardian
═══════════════════════════════════════════════════════════════

区域：深海低语
类型：精英敌人
编号：ENEMY_021

───────────────────────────────────────────────────────────────
【完整立绘】
───────────────────────────────────────────────────────────────

Prompt:
"Dark fantasy elite enemy design of reverberation guardian,
massive armored warrior figure with heavy plate armor,
armor covered in glowing blue runes and sound waves,
tower shield on one arm, sword on other,
luminous blue energy emanating from joints,
imposing defensive stance,
color palette: #1A1A2E (armor), #00BFFF (runes), #00FF88 (accents),
game elite enemy design, highly detailed, pixel art compatible,
transparent background"

尺寸建议: 256x256
用途: 精英敌人展示

───────────────────────────────────────────────────────────────
【精灵图序列】
───────────────────────────────────────────────────────────────

【待机精灵图】

Prompt:
"Pixel art sprite sheet for reverberation guardian idle animation,
4 frames showing heavy breathing, armor settling,
massive armored warrior standing firm,
glowing rune patterns pulsing,
dark fantasy game style,
transparent background, clean sprites, 96x96"

文件名: guardian_idle_sheet.png
尺寸: 384x96 (4帧)

---

【盾击精灵图】

Prompt:
"Pixel art sprite sheet for guardian shield bash animation,
4 frames (raise shield, charge, bash, recover),
armored warrior charging with massive shield,
blue energy trail,
impact explosion effect,
dark fantasy game style,
transparent background, 96x96 frames"

文件名: guardian_shield_sheet.png
尺寸: 384x96 (4帧)

---

【护甲破碎精灵图】

Prompt:
"Pixel art sprite sheet for guardian armor break animation,
5 frames (crack appears, multiple cracks, shatter, armor pieces fall, vulnerable form),
massive armored figure with cracking armor,
blue energy exploding outward,
armor debris scattering,
dark fantasy game style,
transparent background, 96x96 frames"

文件名: guardian_break_sheet.png
尺寸: 480x96 (5帧)

───────────────────────────────────────────────────────────────
【头像/图标】
───────────────────────────────────────────────────────────────

Prompt:
"Game elite enemy icon for reverberation guardian,
armored helmet with glowing blue runes,
one glowing blue eye visible,
massive imposing warrior face,
dark blue and cyan color scheme,
circular icon frame, highly detailed,
pixel art style, transparent background"

尺寸建议: 128x128
文件名: guardian_icon.png
```

---

## 5. BOSS设计

### 5.1 回响守卒（森林BOSS）

```
═══════════════════════════════════════════════════════════════
【回响守卒 - 回声卫】Echo Warden
═══════════════════════════════════════════════════════════════

区域：回响森林
类型：BOSS
编号：BOSS_001

───────────────────────────────────────────────────────────────
【完整立绘 - 第一形态】
───────────────────────────────────────────────────────────────

Prompt:
"Dark fantasy boss enemy design of echo warden,
massive stone guardian with tree roots and vines intertwined,
humanoid upper body, massive stone fists,
glowing green echo core in chest,
ancient forest runes carved on body,
looming intimidating presence,
forest green and dark stone colors,
color palette: #1A2E1A (stone), #00FF88 (core), #2E4E2E (runes),
game boss design, extremely detailed, concept art quality,
transparent background"

尺寸建议: 512x512
用途: BOSS战展示

───────────────────────────────────────────────────────────────
【完整立绘 - 第二形态（护甲碎裂）】
───────────────────────────────────────────────────────────────

Prompt:
"Dark fantasy boss enemy design of echo warden broken form,
massive stone guardian with cracked and broken armor,
cracks glowing with green energy,
more aggressive expression,
roots bursting from cracks,
enraged stance, ready to attack,
color palette: #1A2E1A (stone), #00FF88 (cracks), #FF2E63 (rage),
game boss design, extremely detailed, concept art quality,
transparent background"

尺寸建议: 512x512
用途: BOSS第二阶段展示

───────────────────────────────────────────────────────────────
【精灵图序列】
───────────────────────────────────────────────────────────────

【BOSS待机精灵图】

Prompt:
"Pixel art sprite sheet for echo warden boss idle animation,
4 frames showing slow breathing, core pulsing,
massive stone guardian standing firm,
green energy flowing through cracks,
dark fantasy game style,
transparent background, clean sprites, 128x128"

文件名: warden_idle_sheet.png
尺寸: 512x128 (4帧)

---

【BOSS重锤攻击精灵图】

Prompt:
"Pixel art sprite sheet for echo warden heavy attack animation,
5 frames (raise fist, slam down, impact, ground crack, recovery),
massive stone fist crashing down,
green energy explosion on impact,
screen shake effect,
dark fantasy game style,
transparent background, 128x128 frames"

文件名: warden_attack_heavy_sheet.png
尺寸: 640x128 (5帧)

---

【BOSS震荡波精灵图】

Prompt:
"Pixel art sprite sheet for echo warden ground pound attack animation,
4 frames (plant fist, channel energy, release wave, recover),
stone guardian driving fist into ground,
green energy ring expanding outward,
dark fantasy game style,
transparent background, 128x128 frames"

文件名: warden_pound_sheet.png
尺寸: 512x128 (4帧)

───────────────────────────────────────────────────────────────
【头像/图标】
───────────────────────────────────────────────────────────────

Prompt:
"Game boss icon for echo warden,
massive stone face with glowing green core in forehead,
tree root patterns, ancient runes,
intimidating guardian expression,
forest green and dark colors,
circular icon frame, highly detailed,
pixel art style, transparent background"

尺寸建议: 256x256
文件名: warden_icon.png
```

### 5.2 颤音魔女（熔岩BOSS）

```
═══════════════════════════════════════════════════════════════
【颤音魔女 - 音浪夫人】Dame Soundwave
═══════════════════════════════════════════════════════════════

区域：熔岩回响
类型：BOSS
编号：BOSS_002

───────────────────────────────────────────────────────────────
【完整立绘 - 第一形态】
───────────────────────────────────────────────────────────────

Prompt:
"Dark fantasy boss enemy design of dame soundwave,
elegant yet terrifying female figure floating,
multiple arms holding glowing orbs,
hair made of flowing sound waves and fire,
dress composed of flame-colored energy,
crown of musical notes,
smiling but dangerous expression,
color palette: #FF6B35 (fire), #FF2E63 (accents), #EEFF00 (orbs),
game boss design, extremely detailed, concept art quality,
transparent background"

尺寸建议: 512x512
用途: BOSS战展示

───────────────────────────────────────────────────────────────
【完整立绘 - 分身形态】
───────────────────────────────────────────────────────────────

Prompt:
"Dark fantasy boss enemy design of dame soundwave splitting,
elegant female figure dividing into two copies,
both copies with half the body glowing,
fire and sound waves separating,
more intense expression,
color palette: #FF6B35, #FF2E63, #EEFF00,
game boss design, extremely detailed, concept art quality,
transparent background"

尺寸建议: 512x512
用途: BOSS第二阶段展示

───────────────────────────────────────────────────────────────
【完整立绘 - 最终形态】
───────────────────────────────────────────────────────────────

Prompt:
"Dark fantasy boss enemy design of dame soundwave final form,
fully empowered female figure wreathed in flames,
sound wave hair becoming a wildfire,
multiple arms fully extended,
musical notes exploding outward,
terrifying power display,
color palette: #FF0000 (fire), #EEFF00 (intensity), #FF6B35 (accents),
game boss design, extremely detailed, concept art quality,
transparent background"

尺寸建议: 512x512
用途: BOSS第三阶段展示

───────────────────────────────────────────────────────────────
【精灵图序列】
───────────────────────────────────────────────────────────────

【BOSS悬浮精灵图】

Prompt:
"Pixel art sprite sheet for dame soundwave floating animation,
4 frames showing gentle hovering motion,
elegant female figure floating with hair flowing,
multiple arms holding orbs,
dark fantasy game style,
transparent background, clean sprites, 128x128"

文件名: soundwave_float_sheet.png
尺寸: 512x128 (4帧)

---

【BOSS射线攻击精灵图】

Prompt:
"Pixel art sprite sheet for dame soundwave ray attack animation,
4 frames (aim, charge, fire, release),
female figure with glowing hand gestures,
beam of sound wave energy shooting forward,
flame trail effect,
dark fantasy game style,
transparent background, 128x128 frames"

文件名: soundwave_ray_sheet.png
尺寸: 512x128 (4帧)

---

【BOSS风暴攻击精灵图】

Prompt:
"Pixel art sprite sheet for dame soundwave fire storm animation,
4 frames (raise arms, summon flames, fire storm, dissipate),
female figure commanding massive flame explosion,
entire frame filled with fire,
dark fantasy game style,
transparent background, 128x128 frames"

文件名: soundwave_storm_sheet.png
尺寸: 512x128 (4帧)

───────────────────────────────────────────────────────────────
【头像/图标】
───────────────────────────────────────────────────────────────

Prompt:
"Game boss icon for dame soundwave,
seductive yet terrifying female face wreathed in flames,
multiple glowing eyes,
hair like living fire,
musical notes floating,
orange red and yellow colors,
circular icon frame, highly detailed,
pixel art style, transparent background"

尺寸建议: 256x256
文件名: soundwave_icon.png
```

### 5.3 深渊之心（最终BOSS）

```
═══════════════════════════════════════════════════════════════
【深渊之心 - 虚空低语】The Void Whisper
═══════════════════════════════════════════════════════════════

区域：深渊核心
类型：最终BOSS
编号：BOSS_003

───────────────────────────────────────────────────────────────
【完整立绘 - 觉醒形态（第一阶段）】
───────────────────────────────────────────────────────────────

Prompt:
"Dark fantasy final boss design of the void whisper,
massive living heart shape made of intertwined sound waves,
hundreds of glowing eyes embedded in flesh,
countless mouths singing different notes,
deep purple and cyan colors swirling,
dark energy emanating,
cosmic horror presence,
color palette: #7B2CBF (primary), #08D9D6 (eyes), #0D0D1A (void),
game final boss design, extremely detailed, cosmic horror style,
concept art quality, transparent background"

尺寸建议: 512x512
用途: 最终BOSS战展示

───────────────────────────────────────────────────────────────
【完整立绘 - 扩张形态（第二阶段）】
───────────────────────────────────────────────────────────────

Prompt:
"Dark fantasy final boss design of void whisper expanded form,
transcendent entity filling the space,
body made of chaotic sound waves and void energy,
eyes and mouths multiplying,
formless yet purposeful,
all colors bleeding together,
overwhelming cosmic presence,
color palette: #0D0D1A, #7B2CBF, #08D9D6, #EEFF00, #FF2E63 (all chaos),
game final boss design, extremely detailed, cosmic horror style,
concept art quality, transparent background"

尺寸建议: 512x512
用途: 最终BOSS第二阶段展示

───────────────────────────────────────────────────────────────
【完整立绘 - 本质形态（最终阶段）】
───────────────────────────────────────────────────────────────

Prompt:
"Dark fantasy final boss design of void whisper true form,
pure concentrated sound and silence combined,
humanoid silhouette made of pure energy,
neither good nor evil,
vast intelligence behind eyes,
transcendent peaceful form,
cosmic entities surrounding,
color palette: #08D9D6, #FFFFFF, #E8E8E8 (pure light),
game final boss design, extremely detailed, concept art quality,
transparent background"

尺寸建议: 512x512
用途: 最终BOSS第三阶段展示

───────────────────────────────────────────────────────────────
【精灵图序列】
───────────────────────────────────────────────────────────────

【BOSS心跳精灵图】

Prompt:
"Pixel art sprite sheet for void whisper heartbeat animation,
4 frames showing slow rhythmic pulsing,
massive heart shape expanding and contracting,
eyes blinking in rhythm,
dark fantasy game style,
transparent background, clean sprites, 256x256"

文件名: void_heartbeat_sheet.png
尺寸: 1024x256 (4帧)

---

【BOSS弹幕攻击精灵图】

Prompt:
"Pixel art sprite sheet for void whisper attack animation,
4 frames (eyes glow, energy gathers, release, projectile trail),
entity releasing wave of sound projectiles,
multiple energy orbs spreading outward,
dark fantasy game style,
transparent background, 256x256 frames"

文件名: void_attack_sheet.png
尺寸: 1024x256 (4帧)

---

【BOSS最终形态精灵图】

Prompt:
"Pixel art sprite sheet for void whisper transcendent form animation,
4 frames showing entity evolving,
humanoid shape forming from chaos,
energy cascading,
eyes opening,
dark fantasy game style,
transparent background, 256x256 frames"

文件名: void_transcend_sheet.png
尺寸: 1024x256 (4帧)

───────────────────────────────────────────────────────────────
【头像/图标】
───────────────────────────────────────────────────────────────

Prompt:
"Game final boss icon for the void whisper,
single massive glowing eye with multiple pupils,
surrounded by swirling void energy,
deep cosmic horror atmosphere,
all colors mixed but harmonized,
circular icon frame, extremely detailed,
concept art quality, pixel art style, transparent background"

尺寸建议: 256x256
文件名: void_icon.png
```

---

## 6. 敌人精灵图模板

### 6.1 通用精灵图生成

```
═══════════════════════════════════════════════════════════════
【通用敌人精灵图模板】
═══════════════════════════════════════════════════════════════

所有敌人精灵图可以使用以下通用模板生成：

【待机模板】
Prompt:
"Pixel art sprite sheet for [ENEMY_NAME] idle animation,
[DESCRIPTION_OF_CREATURE],
[COLOR_PALETTE],
[NUMBER] frames showing subtle motion,
dark fantasy game style,
transparent background, clean sprites,
consistent size [SIZE], game ready"

---

【移动模板】
Prompt:
"Pixel art sprite sheet for [ENEMY_NAME] walking animation,
[DESCRIPTION_OF_CREATURE],
[COLOR_PALETTE],
[NUMBER] frames walk cycle,
dark fantasy game style,
transparent background, clean sprites,
consistent size [SIZE], game ready"

---

【攻击模板】
Prompt:
"Pixel art sprite sheet for [ENEMY_NAME] attack animation,
[DESCRIPTION_OF_CREATURE] attacking,
[ATTACK_DESCRIPTION],
[COLOR_PALETTE],
[NUMBER] frames showing attack motion,
dark fantasy game style,
transparent background, clean sprites,
consistent size [SIZE], game ready"

---

【死亡模板】
Prompt:
"Pixel art sprite sheet for [ENEMY_NAME] death animation,
[DESCRIPTION_OF_CREATURE] dying,
[DEATH_DESCRIPTION],
[COLOR_PALETTE],
[NUMBER] frames showing death sequence,
dark fantasy game style,
transparent background, clean sprites,
consistent size [SIZE], game ready"
```

### 6.2 区域统一风格

```
═══════════════════════════════════════════════════════════════
【回响森林敌人风格】
═══════════════════════════════════════════════════════════════

区域通用风格提示词：

Prompt:
"Dark fantasy creature design for forest zone enemy,
[CREATURE_DESCRIPTION],
overgrown with vines and moss,
glowing green echo particles,
corrupted nature appearance,
forest colors with green glow: #1A2E1A, #00FF88, #2E4E2E,
game enemy design, detailed,
transparent background"

精灵图统一尺寸：48x48

---

═══════════════════════════════════════════════════════════════
【熔岩回响敌人风格】
═══════════════════════════════════════════════════════════════

区域通用风格提示词：

Prompt:
"Dark fantasy creature design for lava zone enemy,
[CREATURE_DESCRIPTION],
embedded with cooling lava cracks,
molten rock textures,
fire and ember particles,
lava colors with orange glow: #2E1A1A, #FF6B35, #FF2E63,
game enemy design, detailed,
transparent background"

精灵图统一尺寸：48x48

---

═══════════════════════════════════════════════════════════════
【深海低语敌人风格】
═══════════════════════════════════════════════════════════════

区域通用风格提示词：

Prompt:
"Dark fantasy creature design for deep sea zone enemy,
[CREATURE_DESCRIPTION],
bioluminescent patches on body,
underwater pressure effects,
bubble particles,
deep sea colors with blue glow: #1A1A2E, #00BFFF, #008B8B,
game enemy design, detailed,
transparent background"

精灵图统一尺寸：48x48

---

═══════════════════════════════════════════════════════════════
【骸骨圣殿敌人风格】
═══════════════════════════════════════════════════════════════

区域通用风格提示词：

Prompt:
"Dark fantasy creature design for bone cathedral enemy,
[CREATURE_DESCRIPTION],
skeletal or bone-based form,
ghostly ethereal aura,
musical note decorations,
bone colors with blue glow: #2E2E2E, #FFFFFF, #00BFFF,
game enemy design, detailed,
transparent background"

精灵图统一尺寸：48x48

---

═══════════════════════════════════════════════════════════════
【深渊核心敌人风格】
═══════════════════════════════════════════════════════════════

区域通用风格提示词：

Prompt:
"Dark fantasy creature design for abyss core enemy,
[CREATURE_DESCRIPTION],
formless shifting appearance,
all colors mixed with void,
sound waves made visible,
chaos colors: #0D0D1A, #7B2CBF, #08D9D6, #EEFF00, #FF2E63,
game enemy design, detailed, cosmic horror style,
transparent background"

精灵图统一尺寸：64x64
```

---

## 7. 批量生成清单

### 7.1 完整敌人素材清单

```
═══════════════════════════════════════════════════════════════
【敌人素材完整清单】
═══════════════════════════════════════════════════════════════

┌─────────────────────────────────────────────────────────────┐
│ 小型敌人                                                      │
├─────────────────────────────────────────────────────────────┤
│ ☐ bat_icon.png              - 回响蝙蝠图标 (64x64)          │
│ ☐ bat_fly_sheet.png         - 回响蝙蝠飞行 (128x32, 4帧)   │
│ ☐ bat_attack_sheet.png      - 回响蝙蝠攻击 (96x32, 3帧)    │
│ ☐ bat_death_sheet.png       - 回响蝙蝠死亡 (96x32, 3帧)    │
│                                                              │
│ ☐ crawler_icon.png          - 阴影爬行者图标 (64x64)        │
│ ☐ crawler_walk_sheet.png    - 阴影爬行者移动 (128x32, 4帧) │
│ ☐ crawler_attack_sheet.png  - 阴影爬行者攻击 (96x32, 3帧)  │
│ ☐ crawler_ambush_sheet.png  - 阴影爬行者伏击 (96x32, 3帧)  │
│                                                              │
│ ☐ specter_icon.png          - 旋律幽灵图标 (64x64)          │
│ ☐ specter_float_sheet.png   - 旋律幽灵飘浮 (192x48, 4帧)   │
│ ☐ specter_attack_sheet.png  - 旋律幽灵攻击 (144x48, 3帧)   │
│ ☐ specter_phase_sheet.png    - 旋律幽灵隐身 (192x48, 4帧)  │
│                                                              │
│ ☐ beetle_icon.png           - 回响甲虫图标 (64x64)          │
│ ☐ beetle_walk_sheet.png     - 回响甲虫移动 (192x48, 4帧)   │
│ ☐ beetle_roll_sheet.png     - 回响甲虫冲锋 (192x48, 4帧)   │
│ ☐ beetle_death_sheet.png    - 回响甲虫死亡 (144x48, 3帧)   │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ 中型敌人                                                      │
├─────────────────────────────────────────────────────────────┤
│ ☐ colossus_icon.png         - 回响巨人图标 (128x128)       │
│ ☐ colossus_full.png         - 回响巨人完整立绘 (256x256)   │
│ ☐ colossus_walk_sheet.png   - 回响巨人移动 (384x96, 4帧)  │
│ ☐ colossus_attack_sheet.png - 回响巨人攻击 (384x96, 4帧)   │
│ ☐ colossus_roar_sheet.png   - 回响巨人怒吼 (288x96, 3帧)  │
│                                                              │
│ ☐ hunter_icon.png           - 旋律猎手图标 (128x128)      │
│ ☐ hunter_full.png           - 旋律猎手完整立绘 (256x256)   │
│ ☐ hunter_move_sheet.png     - 旋律猎手移动 (384x64, 6帧)   │
│ ☐ hunter_attack_sheet.png   - 旋律猎手攻击 (256x64, 4帧)   │
│ ☐ hunter_dodge_sheet.png    - 旋律猎手闪避 (192x64, 3帧)   │
│                                                              │
│ ☐ chorus_icon.png           - 合唱团领唱图标 (128x128)      │
│ ☐ chorus_full.png           - 合唱团领唱完整立绘 (256x256)  │
│ ☐ chorus_idle_sheet.png     - 合唱团领唱指挥 (256x64, 4帧) │
│ ☐ chorus_summon_sheet.png   - 合唱团领唱召唤 (256x64, 4帧) │
│ ☐ chorus_death_sheet.png    - 合唱团领唱死亡 (192x64, 3帧) │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ 精英敌人                                                      │
├─────────────────────────────────────────────────────────────┤
│ ☐ dissonant_icon.png        - 不谐之音图标 (128x128)        │
│ ☐ dissonant_full.png        - 不谐之音完整立绘 (256x256)   │
│ ☐ dissonant_idle_sheet.png  - 不谐之音待机 (384x96, 4帧)   │
│ ☐ dissonant_attack_sheet.png - 不谐之音攻击 (384x96, 4帧)  │
│ ☐ dissonant_teleport_sheet.png - 不谐之音闪现 (384x96, 4帧)│
│                                                              │
│ ☐ guardian_icon.png         - 余响守护者图标 (128x128)      │
│ ☐ guardian_full.png         - 余响守护者完整立绘 (256x256)  │
│ ☐ guardian_idle_sheet.png   - 余响守护者待机 (384x96, 4帧) │
│ ☐ guardian_shield_sheet.png - 余响守护者盾击 (384x96, 4帧) │
│ ☐ guardian_break_sheet.png  - 余响守护者破碎 (480x96, 5帧) │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ BOSS敌人                                                      │
├─────────────────────────────────────────────────────────────┤
│ ☐ warden_icon.png           - 回响守卒图标 (256x256)        │
│ ☐ warden_phase1.png         - 回响守卒第一形态 (512x512)   │
│ ☐ warden_phase2.png         - 回响守卒第二形态 (512x512)   │
│ ☐ warden_idle_sheet.png     - 回响守卒待机 (512x128, 4帧)  │
│ ☐ warden_heavy_sheet.png    - 回响守卒重锤 (640x128, 5帧) │
│ ☐ warden_pound_sheet.png    - 回响守卒震荡 (512x128, 4帧) │
│                                                              │
│ ☐ soundwave_icon.png       - 颤音魔女图标 (256x256)        │
│ ☐ soundwave_phase1.png     - 颤音魔女第一形态 (512x512)   │
│ ☐ soundwave_phase2.png     - 颤音魔女分身形态 (512x512)   │
│ ☐ soundwave_phase3.png     - 颤音魔女最终形态 (512x512)   │
│ ☐ soundwave_float_sheet.png - 颤音魔女悬浮 (512x128, 4帧) │
│ ☐ soundwave_ray_sheet.png   - 颤音魔女射线 (512x128, 4帧) │
│ ☐ soundwave_storm_sheet.png - 颤音魔女风暴 (512x128, 4帧) │
│                                                              │
│ ☐ void_icon.png            - 深渊之心图标 (256x256)        │
│ ☐ void_phase1.png          - 深渊之心觉醒 (512x512)       │
│ ☐ void_phase2.png          - 深渊之心扩张 (512x512)       │
│ ☐ void_phase3.png           - 深渊之心本质 (512x512)       │
│ ☐ void_heartbeat_sheet.png - 深渊之心心跳 (1024x256, 4帧) │
│ ☐ void_attack_sheet.png    - 深渊之心攻击 (1024x256, 4帧) │
│ ☐ void_transcend_sheet.png - 深渊之心蜕变 (1024x256, 4帧)│
└─────────────────────────────────────────────────────────────┘
```

### 7.2 生成优先级

```
═══════════════════════════════════════════════════════════════
【敌人素材生成优先级】
═══════════════════════════════════════════════════════════════

【第一优先级 - 核心敌人】

必须生成，否则游戏无法运行：

回响蝙蝠：
- icon
- fly_sheet
- attack_sheet

回响巨人：
- icon
- full
- walk_sheet
- attack_sheet

回响守卒（Boss）：
- icon
- phase1
- idle_sheet
- heavy_sheet

【第二优先级 - 完整游戏】

建议生成，提供完整游戏体验：

阴影爬行者
旋律幽灵
回响甲虫
旋律猎手
合唱团领唱
颤音魔女（Boss）

【第三优先级 - 额外内容】

可选生成，提升游戏品质：

不谐之音
余响守护者
深渊之心（最终Boss）

【特殊敌人清单】

每个区域至少需要：
- 1种主要小型敌人（icon + 2-3个精灵图）
- 1种中型敌人（icon + full + 2-3个精灵图）
- 1个BOSS（icon + 2个形态 + 3-4个精灵图）
```

---

**文档版本：1.0**
**最后更新：2025年**

**下一步：查看 `07_environment_prompts.md` 生成环境与场景素材提示词**
