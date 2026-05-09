# 《回响深渊》AI素材提示词 - 角色与NPC

> **ECHO ABYSS - AI Prompts for Characters & NPCs**
> **文档版本：1.0**
>
> **使用方法：将提示词直接粘贴到 GPT-Image 或其他AI绘图工具中使用**

---

## 目录

1. [使用说明](#1-使用说明)
2. [主角 - 聆听者艾文](#2-主角---聆听者艾文)
3. [角色2 - 喧嚣者托尔](#3-角色2---喧嚣者托尔)
4. [角色3 - 沉默者涟](#4-角色3---沉默者涟)
5. [NPC - 大聆听者艾琳娜](#5-npc---大聆听者艾琳娜)
6. [特殊道具 - 聆听者之眼](#6-特殊道具---聆听者之眼)
7. [角色动作序列](#7-角色动作序列)
8. [批量生成清单](#8-批量生成清单)

---

## 1. 使用说明

### 1.1 AI生成图片基础要求

```
【生成工具】
推荐：GPT-Image-2 或 Midjourney

【基础格式要求】
所有提示词遵循以下格式：
"主体描述，风格，细节，背景，技术参数"

【推荐尺寸】
- 角色立绘：1024x1024 或 1024x1536
- 角色动作：512x512 或 768x768
- 图标/头像：256x256

【输出格式】
- PNG 格式
- 透明背景（如需要）
- 高清（避免低分辨率）
```

### 1.2 统一风格指南

```
【游戏整体美术风格】
- 暗黑奇幻风格
- 暗色为主 + 霓虹光效
- 像素风 + 现代特效结合
- 声音可视化

【配色方案】
主色：
- 深渊黑：#0D0D1A
- 暗紫蓝：#1A1A2E
- 深渊紫：#252240

强调色：
- 回响红：#FF2E63（敌人/危险）
- 聆听青：#08D9D6（玩家/治愈）
- 回响黄：#EEFF00（能量/道具）
- 回响绿：#00FF88（成功/正面）

UI色：
- UI白：#E8E8E8
- UI灰：#888888
```

### 1.3 提示词优化技巧

```
【提升质量的关键词】
✓ 添加：
- "detailed" (详细)
- "high quality" (高质量)
- "cinematic lighting" (电影级光照)
- "concept art" (概念艺术)
- "game art style" (游戏美术风格)

✗ 避免：
- 过于写实的风格
- 与游戏整体风格不匹配的明亮色调
- 版权角色（如皮卡丘等）
- 不适合游戏的暴力或裸露内容

【颜色控制】
使用颜色代码确保一致性：
- "color palette: #0D0D1A, #08D9D6, #7B2CBF"
- "dominant color: dark purple (#1A1A2E)"
- "accent color: glowing cyan (#08D9D6)"
```

---

## 2. 主角 - 聆听者艾文

### 2.1 完整立绘

```
═══════════════════════════════════════════════════════════════
【主角 - 聆听者艾文 - 完整立绘】
═══════════════════════════════════════════════════════════════

【基础立绘提示词】

Prompt:
"Full body character art of a young male warrior in dark fantasy style,
wearing a flowing dark purple hooded cloak with glowing sound wave patterns on the edges,
wearing a mystical eye mask that emits soft cyan glow,
holding a staff with a glowing cyan orb at the top,
calm and determined expression,
slender build, brown short hair,
color palette: #0D0D1A (background), #08D9D6 (glowing elements), #1A1A2E (clothing),
cinematic lighting, dark atmospheric background,
game character design, detailed, high quality,
concept art style, fantasy RPG character"

Negative Prompt:
"cartoonish, bright colors, simple, low quality, anime style, realistic photography"

尺寸建议: 1024x1536 (竖版)
用途: 角色选择界面、商店展示
```

```
【简化版立绘提示词】

Prompt:
"Video game character sprite sheet of a hooded figure in dark purple cloak,
glowing cyan eyes through mask, holding glowing staff,
dark fantasy art style, pixel art compatible,
8 directions view, standing pose,
color scheme: dark purple (#1A1A2E) and cyan (#08D9D6),
RPG game asset, clean lines, transparent background"

尺寸建议: 512x512
用途: 精灵图/序列帧基础
```

### 2.2 角色头像

```
═══════════════════════════════════════════════════════════════
【主角头像 - 聆听者艾文】
═══════════════════════════════════════════════════════════════

Prompt:
"Character portrait close-up of a young man in dark fantasy style,
hooded cloak visible, mystical glowing eye mask (cyan glow),
mysterious expression, dark purple atmosphere,
color palette dominated by #0D0D1A and #08D9D6,
game UI portrait style, detailed face, high quality,
concept art, clean background"

尺寸建议: 256x256 或 512x512
用途: HUD头像、技能图标、对话框
```

### 2.3 角色动作

```
═══════════════════════════════════════════════════════════════
【主角动作序列 - 聆听者艾文】
═══════════════════════════════════════════════════════════════

【待机动作】

Prompt:
"Character idle animation frame of hooded mage standing in dark fantasy style,
subtle breathing motion, cloak gently swaying,
glowing cyan staff orb pulsing slowly,
dark purple and cyan color scheme,
pixel art style, game sprite, transparent background"

尺寸建议: 256x256
文件名建议: player_idle_01.png

---

【行走动作】

Prompt:
"Character walking animation frame in dark fantasy style,
hooded figure moving forward, cloak flowing,
one foot slightly raised, dynamic pose,
color scheme: dark purple (#1A1A2E) and cyan (#08D9D6),
pixel art compatible, game sprite sheet,
transparent background, high quality"

尺寸建议: 256x256
文件名建议: player_walk_01.png

系列提示词（生成多帧）:
- walk_01: 右脚抬起
- walk_02: 过渡姿态
- walk_03: 左脚抬起
- walk_04: 过渡姿态

---

【攻击动作】

Prompt:
"Character attack animation frame in dark fantasy style,
hooded mage thrusting staff forward,
glowing cyan sound wave expanding from staff tip,
dynamic motion lines, combat pose,
dark purple cloak billowing,
color palette: #1A1A2E, #08D9D6, #EEFF00,
pixel art style, game sprite, transparent background"

尺寸建议: 256x256
文件名建议: player_attack_01.png

---

【受伤动作】

Prompt:
"Character hurt/damage animation frame in dark fantasy style,
hooded mage recoiling, defensive pose,
red flash effect on character,
pain expression through body language,
dark purple and red color scheme (#FF2E63),
pixel art style, game sprite, transparent background"

尺寸建议: 256x256
文件名建议: player_hurt_01.png

---

【闪避动作】

Prompt:
"Character dodge/dash animation frame in dark fantasy style,
hooded mage in swift motion blur,
afterimage trail effect,
cape flowing dramatically,
cyan motion lines,
dark atmosphere with purple tones,
pixel art style, game sprite, transparent background"

尺寸建议: 256x256
文件名建议: player_dodge_01.png

---

【死亡动作】

Prompt:
"Character death animation frame in dark fantasy style,
hooded mage falling to knees,
cloak draping on ground,
cyan glow fading from staff,
soul particles ascending,
dark purple and gray color scheme,
pixel art style, game sprite, transparent background"

尺寸建议: 256x256
文件名建议: player_death_01.png
```

---

## 3. 角色2 - 喧嚣者托尔

### 3.1 完整立绘

```
═══════════════════════════════════════════════════════════════
【第二角色 - 喧嚣者托尔 - 完整立绘】
═══════════════════════════════════════════════════════════════

Prompt:
"Full body character art of a muscular中年 male warrior in dark fantasy style,
wearing heavy leather battle armor with metal edges,
large war drum strapped to back with ancient runes glowing,
holding drumsticks ready to strike,
fierce battle expression, short neat beard,
wild energy emanating from body, flame-like aura,
color palette: #2E1A1A (armor), #EEFF00 (fire/energy), #FF6B35 (flames),
dark atmospheric background,
game character design, detailed, high quality,
concept art style, fantasy RPG character"

Negative Prompt:
"hooded, thin, slim, delicate, cartoonish, bright colors, anime style"

尺寸建议: 1024x1536
用途: 角色选择界面、商店展示
```

### 3.2 角色头像

```
═══════════════════════════════════════════════════════════════
【第二角色头像 - 喧嚣者托尔】
═══════════════════════════════════════════════════════════════

Prompt:
"Character portrait close-up of a fierce warrior male in dark fantasy style,
muscular build, battle-worn armor,
war drum visible in background,
flame-colored energy around shoulders,
determined battle expression,
color palette: #EEFF00, #FF6B35, #2E1A1A,
game UI portrait style, detailed face, high quality,
concept art, clean dark background"

尺寸建议: 256x256
用途: HUD头像、技能图标
```

### 3.3 角色动作

```
═══════════════════════════════════════════════════════════════
【第二角色动作序列 - 喧嚣者托尔】
═══════════════════════════════════════════════════════════════

【待机动作】

Prompt:
"Character idle animation frame of a muscular warrior with war drum,
slight bounce to the rhythm, drumsticks tapping,
flame particles around body,
dark fantasy game style, warm orange and dark colors,
pixel art compatible, game sprite, transparent background"

尺寸建议: 256x256

---

【攻击动作 - 战鼓连击】

Prompt:
"Character attack animation frame of warrior drumming powerfully,
both arms raised with drumsticks,
shockwave emanating from drum,
dynamic pose, motion blur,
flame-colored energy explosion,
dark fantasy game style, #EEFF00 and #FF6B35,
pixel art style, game sprite, transparent background"

尺寸建议: 256x256

---

【战吼动作】

Prompt:
"Character skill animation frame of warrior letting out war cry,
mouth open in roar, drum raised high,
expanding sound wave rings in gold/yellow,
battle fury expression,
dark fantasy style, dramatic lighting,
pixel art compatible, game sprite, transparent background"

尺寸建议: 256x256
```

---

## 4. 角色3 - 沉默者涟

### 4.1 完整立绘

```
═══════════════════════════════════════════════════════════════
【第三角色 - 沉默者涟 - 完整立绘】
═══════════════════════════════════════════════════════════════

Prompt:
"Full body character art of a slender female assassin in dark fantasy style,
sleek black combat suit, light flowing cloak,
holding twin daggers in ready stance,
half-face mask revealing sharp eyes glowing purple,
silver-white long hair,
stealth pose, shadowy vapor around body,
color palette: #0D0D1A (black), #7B2CBF (purple glow), #FFFFFF (highlights),
dark atmospheric background,
game character design, detailed, high quality,
concept art style, fantasy RPG character"

Negative Prompt:
"bright colors, cheerful, heavy armor, bulky, cartoonish, anime style"

尺寸建议: 1024x1536
用途: 角色选择界面
```

### 4.2 角色头像

```
═══════════════════════════════════════════════════════════════
【第三角色头像 - 沉默者涟】
═══════════════════════════════════════════════════════════════

Prompt:
"Character portrait close-up of mysterious female assassin in dark fantasy style,
half-face mask, sharp glowing purple eyes,
silver hair flowing,
shadowy effect around edges,
color palette: #0D0D1A, #7B2CBF, #252240,
game UI portrait style, detailed face, high quality,
dark mysterious atmosphere, clean background"

尺寸建议: 256x256
用途: HUD头像
```

### 4.3 角色动作

```
═══════════════════════════════════════════════════════════════
【第三角色动作序列 - 沉默者涟】
═══════════════════════════════════════════════════════════════

【隐身姿态】

Prompt:
"Character skill animation frame of female assassin becoming invisible,
body dissolving into shadow particles,
only glowing purple eyes visible,
daggers fading last,
stealth effect, dark fantasy style,
color: #0D0D1A, #7B2CBF,
pixel art compatible, game sprite, transparent background"

尺寸建议: 256x256

---

【瞬移动作】

Prompt:
"Character dash/teleport animation frame of female assassin,
motion trail showing movement path,
starting position fading,
ending position appearing,
purple particle effects along path,
swift blur effect,
dark fantasy style, #7B2CBF, #0D0D1A,
pixel art style, game sprite, transparent background"

尺寸建议: 256x256

---

【背刺动作】

Prompt:
"Character attack animation frame of assassin striking from behind,
dagger extended forward,
victim silhouette behind,
purple energy on blade,
assassin crouching low,
dark fantasy game style,
color: #7B2CBF, #0D0D1A, #FF2E63 (damage),
pixel art compatible, game sprite, transparent background"

尺寸建议: 256x256
```

---

## 5. NPC - 大聆听者艾琳娜

### 5.1 完整立绘

```
═══════════════════════════════════════════════════════════════
【NPC - 大聆听者艾琳娜】
═══════════════════════════════════════════════════════════════

Prompt:
"Full body character art of a mature female leader in dark fantasy style,
elegant purple and gold flowing robe with sound wave embroidery,
holding ornate staff with large glowing crystal,
gray long hair, wise commanding presence,
golden Listener's Eye necklace glowing,
aura of authority and mystery,
color palette: #7B2CBF (robes), #EEFF00 (gold), #08D9D6 (crystal),
dark atmospheric background with ethereal particles,
game character design, detailed, high quality,
concept art style, fantasy RPG NPC"

尺寸建议: 1024x1536
用途: 过场动画、NPC对话
```

### 5.2 回忆场景

```
═══════════════════════════════════════════════════════════════
【NPC场景 - 艾琳娜的回忆】
═══════════════════════════════════════════════════════════════

Prompt:
"Emotional scene of female mentor figure in dark fantasy style,
reaching out to young student with gentle hand,
soft golden light between them,
nostalgic atmosphere, bittersweet mood,
ruined grand hall background,
fallen banners with sound wave patterns,
color palette: #EEFF00 (light), #7B2CBF (robes), #0D0D1A (ruins),
cinematic composition, concept art, high quality,
narrative scene, fantasy game cutscene"

尺寸建议: 1024x1024
用途: 过场动画帧
```

---

## 6. 特殊道具 - 聆听者之眼

```
═══════════════════════════════════════════════════════════════
【关键道具 - 聆听者之眼】
═══════════════════════════════════════════════════════════════

Prompt:
"Magical artifact design of a mystical eye-shaped device in dark fantasy style,
deep purple metal frame with ancient runes,
flowing cyan energy as the 'eye' lens,
glowing sound wave patterns on surface,
ethereal floating effect,
color palette: #1A1A2E (frame), #08D9D6 (energy), #7B2CBF (runes),
game item design, detailed, high quality,
concept art, clean dark background,
transparent background"

尺寸建议: 256x256
用途: 物品图标、关键道具展示

---

【装备效果预览】

Prompt:
"Item equip preview in dark fantasy style,
mystical eye mask being worn by shadowy figure,
cyan glow spreading from eyes,
character silhouette with mask glowing,
dark atmosphere, magical particles,
color palette: #08D9D6, #0D0D1A, #7B2CBF,
game UI concept, transparent background,
detailed, high quality"

尺寸建议: 512x512
用途: 装备穿戴预览
```

---

## 7. 角色动作序列

### 7.1 精灵图制作指南

```
═══════════════════════════════════════════════════════════════
【精灵图（Sprite Sheet）制作指南】
═══════════════════════════════════════════════════════════════

精灵图是游戏中用于动画的连续帧图片。
每个角色需要生成以下精灵图：

【聆听者艾文 - 需要的精灵图】
1. idle_spritesheet.png (4帧)
2. walk_spritesheet.png (6帧)
3. attack_spritesheet.png (4帧)
4. skill_q_spritesheet.png (4帧)
5. skill_w_spritesheet.png (4帧)
6. skill_e_spritesheet.png (4帧)
7. skill_r_spritesheet.png (6帧)
8. hurt_spritesheet.png (2帧)
9. dodge_spritesheet.png (3帧)
10. death_spritesheet.png (4帧)

每个精灵图尺寸：64x64 像素/帧
总尺寸建议：按帧数横向排列，如 walk: 384x64 (6帧)
```

### 7.2 批量生成提示词模板

```
═══════════════════════════════════════════════════════════════
【精灵图批量生成提示词】
═══════════════════════════════════════════════════════════════

【模板1：待机精灵图】

Prompt:
"Pixel art sprite sheet for game character idle animation,
hooded mage figure standing with calm pose,
4 frames showing subtle breathing motion,
dark purple cloak, glowing cyan staff orb,
dark fantasy RPG style,
transparent background, clean sprites,
consistent size, game ready,
color palette: #1A1A2E, #08D9D6"

文件名: player_idle_sheet.png

---

【模板2：行走精灵图】

Prompt:
"Pixel art sprite sheet for game character walk animation,
hooded mage walking forward,
6 frames walk cycle (left foot, center, right foot, repeat),
flowing cloak, glowing staff,
dark fantasy RPG style,
transparent background, clean sprites,
consistent animation timing,
color palette: #1A1A2E, #08D9D6"

文件名: player_walk_sheet.png

---

【模板3：攻击精灵图】

Prompt:
"Pixel art sprite sheet for game character attack animation,
hooded mage thrusting staff forward,
4 frames showing attack motion (wind up, strike, impact, recovery),
expanding sound wave effect,
dark fantasy RPG style,
transparent background, clean sprites,
action frames, game ready,
color palette: #1A1A2E, #08D9D6, #EEFF00"

文件名: player_attack_sheet.png

---

【模板4：技能精灵图 - 回响护盾】

Prompt:
"Pixel art sprite sheet for game character shield skill animation,
hooded mage casting defensive shield,
4 frames (casting, shield forming, active, fading),
glowing cyan sphere around character,
dark fantasy RPG style,
transparent background, clean sprites,
magic effect, game ready,
color palette: #08D9D6, #1A1A2E"

文件名: player_skill_shield_sheet.png

---

【模板5：技能精灵图 - 聆听领域】

Prompt:
"Pixel art sprite sheet for game character area heal skill animation,
hooded mage creating healing circle,
4 frames (plant staff, expand healing ring, active, contract),
glowing green-cyan healing aura spreading,
dark fantasy RPG style,
transparent background, clean sprites,
healing effect, game ready,
color palette: #00FF88, #08D9D6, #1A1A2E"

文件名: player_skill_heal_sheet.png
```

---

## 8. 批量生成清单

### 8.1 角色素材清单

```
═══════════════════════════════════════════════════════════════
【完整角色素材清单】
═══════════════════════════════════════════════════════════════

┌─────────────────────────────────────────────────────────────┐
│ 聆听者艾文（主角）                                          │
├─────────────────────────────────────────────────────────────┤
│ ☐ evan_portrait.png         - 头像 (256x256)              │
│ ☐ evan_fullbody.png         - 完整立绘 (1024x1536)         │
│ ☐ evan_idle_sheet.png       - 待机精灵 (64x64 x 4帧)       │
│ ☐ evan_walk_sheet.png       - 行走精灵 (64x64 x 6帧)       │
│ ☐ evan_attack_sheet.png     - 攻击精灵 (64x64 x 4帧)       │
│ ☐ evan_skill_q_sheet.png    - 技能Q精灵 (64x64 x 4帧)      │
│ ☐ evan_skill_w_sheet.png    - 技能W精灵 (64x64 x 4帧)      │
│ ☐ evan_skill_e_sheet.png    - 技能E精灵 (64x64 x 4帧)      │
│ ☐ evan_skill_r_sheet.png    - 终极技能精灵 (64x64 x 6帧)   │
│ ☐ evan_hurt_sheet.png       - 受伤精灵 (64x64 x 2帧)       │
│ ☐ evan_dodge_sheet.png      - 闪避精灵 (64x64 x 3帧)       │
│ ☐ evan_death_sheet.png      - 死亡精灵 (64x64 x 4帧)       │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ 喧嚣者托尔（第二角色）                                       │
├─────────────────────────────────────────────────────────────┤
│ ☐ thor_portrait.png         - 头像 (256x256)               │
│ ☐ thor_fullbody.png         - 完整立绘 (1024x1536)         │
│ ☐ thor_idle_sheet.png       - 待机精灵 (64x64 x 4帧)       │
│ ☐ thor_walk_sheet.png       - 行走精灵 (64x64 x 6帧)      │
│ ☐ thor_attack_sheet.png     - 攻击精灵 (64x64 x 4帧)       │
│ ☐ thor_skill_sheet.png      - 技能精灵 (64x64 x 4帧)       │
│ ☐ thor_roar_sheet.png       - 战吼精灵 (64x64 x 4帧)      │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ 沉默者涟（第三角色）                                        │
├─────────────────────────────────────────────────────────────┤
│ ☐ ripple_portrait.png       - 头像 (256x256)               │
│ ☐ ripple_fullbody.png       - 完整立绘 (1024x1536)         │
│ ☐ ripple_idle_sheet.png     - 待机精灵 (64x64 x 4帧)       │
│ ☐ ripple_walk_sheet.png     - 行走精灵 (64x64 x 6帧)      │
│ ☐ ripple_attack_sheet.png   - 攻击精灵 (64x64 x 4帧)       │
│ ☐ ripple_stealth_sheet.png  - 隐身精灵 (64x64 x 4帧)      │
│ ☐ ripple_teleport_sheet.png - 瞬移精灵 (64x64 x 4帧)      │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ NPC角色                                                     │
├─────────────────────────────────────────────────────────────┤
│ ☐ aerina_portrait.png       - 艾琳娜头像 (256x256)         │
│ ☐ aerina_fullbody.png       - 艾琳娜立绘 (1024x1536)       │
│ ☐ echo_heart_portrait.png  - 深渊之心头像 (256x256)       │
│ ☐ echo_heart_fullbody.png  - 深渊之心概念图 (1024x1024)   │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ 道具                                                         │
├─────────────────────────────────────────────────────────────┤
│ ☐ listerner_eye.png         - 聆听者之眼 (256x256)         │
│ ☐ war_drum.png             - 战鼓 (256x256)              │
│ ☐ shadow_daggers.png       - 暗影匕首 (256x256)           │
└─────────────────────────────────────────────────────────────┘
```

### 8.2 生成优先级

```
═══════════════════════════════════════════════════════════════
【角色素材生成优先级】
═══════════════════════════════════════════════════════════════

【第一优先级 - 核心内容】
必须生成，否则游戏无法运行：

1. 聆听者艾文
   - 头像 × 1
   - 完整立绘 × 1
   - 待机精灵 × 1套
   - 行走精灵 × 1套
   - 攻击精灵 × 1套
   - 受伤精灵 × 1套

2. 关键道具
   - 聆听者之眼 × 1

【第二优先级 - 完整游戏】
建议生成，提供完整游戏体验：

1. 聆听者艾文
   - 所有技能精灵
   - 闪避和死亡精灵

2. NPC
   - 艾琳娜头像和立绘
   - 深渊之心概念图

【第三优先级 - 额外内容】
可选生成，提升游戏品质：

1. 其他角色（托尔、涟）
2. 完整精灵图系列
3. 回忆场景插画
```

---

**文档版本：1.0**
**最后更新：2025年**

**下一步：查看 `06_enemy_prompts.md` 生成敌人素材提示词**
