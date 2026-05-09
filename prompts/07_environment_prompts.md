# 《回响深渊》AI素材提示词 - 环境与场景

> **ECHO ABYSS - AI Prompts for Environment & Scenes**
> **文档版本：1.0**
>
> **使用方法：将提示词直接粘贴到 GPT-Image 或其他AI绘图工具中使用**

---

## 目录

1. [环境素材规范](#1-环境素材规范)
2. [回响森林场景](#2-回响森林场景)
3. [熔岩回响场景](#3-熔岩回响场景)
4. [深海低语场景](#4-深海低语场景)
5. [骸骨圣殿场景](#5-骸骨圣殿场景)
6. [深渊核心场景](#6-深渊核心场景)
7. [Tileset（瓦片地图）](#7-tileset瓦片地图)
8. [背景与氛围](#8-背景与氛围)
9. [批量生成清单](#9-批量生成清单)

---

## 1. 环境素材规范

### 1.1 场景素材分类

```
【场景素材类型】

1. 地形瓦片（Tiles）
   - 可拼接的地面纹理
   - 每个区域3-5种基础瓦片
   - 边缘和角落变体

2. 墙壁/障碍物
   - 区域边界
   - 阻挡移动的元素
   - 可破坏和不可破坏

3. 装饰物
   - 环境细节
   - 不影响游戏性
   - 增加视觉丰富度

4. 交互元素
   - 门、开关、机关
   - 危险区域标记
   - 特殊地形效果

5. 背景层
   - 视差滚动背景
   - 氛围营造
   - 不参与碰撞
```

### 1.2 区域视觉特征

```
【回响森林 - 暗绿色调】
主色：#1A2E1A (深绿)
强调：#00FF88 (发光苔藓)
危险：#FF2E63 (扭曲)
光效：#08D9D6 (回响)

场景元素：
- 枯萎的古树
- 发光苔藓
- 扭曲藤蔓
- 回响光点

---

【熔岩回响 - 暗红色调】
主色：#2E1A1A (暗红)
强调：#FF6B35 (熔岩)
危险：#FF0000 (火焰)
光效：#EEFF00 (能量)

场景元素：
- 凝固熔岩
- 火焰喷射口
- 燃烧岩石
- 岩浆河流

---

【深海低语 - 深蓝色调】
主色：#1A1A2E (深蓝)
强调：#00BFFF (生物光)
危险：#4B0082 (水压)
光效：#08D9D6 (回响)

场景元素：
- 巨大珊瑚
- 发光水母
- 海藻森林
- 气泡上升

---

【骸骨圣殿 - 灰白色调】
主色：#2E2E2E (灰色)
强调：#FFFFFF (骨头)
危险：#7B2CBF (深渊紫)
光效：#00BFFF (幽灵)

场景元素：
- 骸骨建筑
- 幽灵符文
- 骨塔墓碑
- 灵魂漩涡

---

【深渊核心 - 混合色调】
主色：#0D0D1A (深渊黑)
强调：所有颜色混合
危险：#FF2E63 (混乱)
光效：#08D9D6 (纯白)

场景元素：
- 扭曲空间
- 声音碎片
- 无形边界
- 混沌能量
```

### 1.3 素材尺寸规范

```
【Tileset尺寸】

基础瓦片：64x64 像素
- 地面：64x64
- 墙壁：64x128 或 64x64
- 装饰：32x32 或 64x64

可拼接瓦片：
- 需要确保边缘无缝拼接
- 生成时使用"tileable texture"关键词

【精灵图尺寸】

大型装饰物：128x128 或 256x256
中型装饰物：64x64 或 96x96
小型装饰物：32x32 或 48x48

【背景尺寸】

视差背景：
- 近景层：1920x1080 或更大
- 中景层：1920x1080 或更大
- 远景层：1920x1080 或更大

环境概念图：1920x1080 或 2560x1440
```

---

## 2. 回响森林场景

### 2.1 地形瓦片

```
═══════════════════════════════════════════════════════════════
【回响森林 - 地面瓦片】
═══════════════════════════════════════════════════════════════

【基础地面】

Prompt:
"Tileable dark fantasy forest floor texture,
dead leaves and moss on dark earth,
glowing cyan echo particles scattered,
corrupted twisted forest floor,
seamless repeating pattern,
game environment asset,
pixel art style, 64x64"

尺寸: 256x256 (4x4瓦片)
文件名: forest_floor_tile.png

---

【草地/苔藓地面】

Prompt:
"Tileable dark fantasy forest ground texture,
glowing green moss on dark earth,
small mushrooms and dead plants,
echo particles floating above,
seamless repeating pattern,
game environment asset,
pixel art style, 64x64"

尺寸: 256x256 (4x4瓦片)
文件名: forest_moss_tile.png

---

【落叶地面】

Prompt:
"Tileable dark fantasy forest floor covered in dead leaves,
twisted leaves with sound wave patterns,
dark purple and green colors,
seamless repeating pattern,
game environment asset,
pixel art style, 64x64"

尺寸: 256x256 (4x4瓦片)
文件名: forest_leaves_tile.png

---

【树根地面】

Prompt:
"Tileable dark fantasy ground with twisted tree roots,
glowing echo moss on roots,
corrupted forest floor detail,
seamless repeating pattern,
game environment asset,
pixel art style, 64x64"

尺寸: 256x256 (4x4瓦片)
文件名: forest_roots_tile.png
```

### 2.2 墙壁与障碍

```
═══════════════════════════════════════════════════════════════
【回响森林 - 墙壁瓦片】
═══════════════════════════════════════════════════════════════

【树木墙壁】

Prompt:
"Tileable dark fantasy dead tree trunk texture,
twisted ancient tree bark,
glowing cracks with echo energy,
corrupted forest element,
seamless repeating pattern,
game environment asset,
pixel art style, 64x128"

尺寸: 256x512 (4x4瓦片)
文件名: forest_tree_wall.png

---

【灌木墙壁】

Prompt:
"Tileable dark fantasy thorny bush wall,
twisted thorny vines,
glowing red berries or flowers,
corrupted forest barrier,
seamless repeating pattern,
game environment asset,
pixel art style, 64x64"

尺寸: 256x256 (4x4瓦片)
文件名: forest_bush_wall.png

---

【藤蔓装饰】

Prompt:
"Tileable dark fantasy vine texture,
twisted corrupted vines hanging,
small glowing echo particles,
forest canopy element,
seamless repeating pattern,
game environment asset,
pixel art style, 64x64"

尺寸: 256x256 (4x4瓦片)
文件名: forest_vines.png
```

### 2.3 装饰物

```
═══════════════════════════════════════════════════════════════
【回响森林 - 装饰物】
═══════════════════════════════════════════════════════════════

【枯萎古树】

Prompt:
"Dark fantasy dead ancient tree sprite,
massive twisted tree trunk,
glowing echo moss and cracks,
purple and green atmosphere,
transparent background,
game environment decoration,
pixel art style, 256x256"

文件名: forest_dead_tree.png

---

【发光蘑菇】

Prompt:
"Dark fantasy glowing mushroom decoration,
bioluminescent mushrooms cluster,
cyan and green glow,
small forest detail element,
transparent background,
game environment decoration,
pixel art style, 64x64"

文件名: forest_mushroom.png

---

【回响光球】

Prompt:
"Dark fantasy echo orb decoration,
floating glowing cyan spheres,
sound wave patterns around orbs,
ambient forest lighting element,
transparent background,
game environment decoration,
pixel art style, 64x64"

文件名: forest_echo_orb.png

---

【扭曲树根】

Prompt:
"Dark fantasy twisted tree roots decoration,
ancient roots twisted together,
glowing moss on roots,
forest floor detail element,
transparent background,
game environment decoration,
pixel art style, 128x128"

文件名: forest_twisted_roots.png

---

【精灵废墟】

Prompt:
"Dark fantasy elven ruins decoration,
fallen stone pillars with music notes,
overgrown with vines,
ghostly glow,
forest ruins element,
transparent background,
game environment decoration,
pixel art style, 256x256"

文件名: forest_elf_ruins.png
```

### 2.4 森林完整场景

```
═══════════════════════════════════════════════════════════════
【回响森林 - 完整场景概念图】
═══════════════════════════════════════════════════════════════

Prompt:
"Dark fantasy forest level concept art,
twisted dead trees with glowing moss,
purple and green atmosphere,
echo particles floating everywhere,
mysterious corrupted forest,
detailed environment design,
game level art, cinematic composition,
1920x1080, high quality"

尺寸: 1920x1080
文件名: forest_level_concept.png

---

【森林房间场景】

Prompt:
"Dark fantasy forest game room scene,
enclosed area with twisted trees as walls,
glowing echo particles floating,
moss-covered ground,
mysterious atmosphere,
game level design reference,
pixel art style, 1920x1080"

尺寸: 1920x1080
文件名: forest_room_scene.png

---

【森林BOSS房间】

Prompt:
"Dark fantasy forest boss arena concept art,
massive hollow tree as arena,
glowing echo core in center,
ancient runes on walls,
green and purple lighting,
dramatic boss battle setting,
game level art, cinematic, 1920x1080"

尺寸: 1920x1080
文件名: forest_boss_arena.png
```

---

## 3. 熔岩回响场景

### 3.1 地形瓦片

```
═══════════════════════════════════════════════════════════════
【熔岩回响 - 地面瓦片】
═══════════════════════════════════════════════════════════════

【熔岩凝固地面】

Prompt:
"Tileable dark fantasy lava ground texture,
cooling dark red lava with cracks,
glowing orange cracks in rock,
volcanic stone floor,
seamless repeating pattern,
game environment asset,
pixel art style, 64x64"

尺寸: 256x256 (4x4瓦片)
文件名: lava_ground_tile.png

---

【岩浆边缘】

Prompt:
"Tileable dark fantasy lava bank texture,
edge of flowing lava river,
cooling dark rock next to bright lava,
steam rising,
seamless repeating pattern,
game environment asset,
pixel art style, 64x64"

尺寸: 256x256 (4x4瓦片)
文件名: lava_bank_tile.png

---

【岩石地面】

Prompt:
"Tileable dark fantasy volcanic rock floor,
dark red stone with cracks,
minimal lava glow,
volcanic cave floor,
seamless repeating pattern,
game environment asset,
pixel art style, 64x64"

尺寸: 256x256 (4x4瓦片)
文件名: lava_rock_tile.png

---

【安全平台】

Prompt:
"Tileable dark fantasy safe platform texture,
elevated rock platform,
cool enough to stand on,
orange ambient glow,
seamless repeating pattern,
game environment asset,
pixel art style, 64x64"

尺寸: 256x256 (4x4瓦片)
文件名: lava_platform_tile.png
```

### 3.2 墙壁与障碍

```
═══════════════════════════════════════════════════════════════
【熔岩回响 - 墙壁瓦片】
═══════════════════════════════════════════════════════════════

【熔岩石墙】

Prompt:
"Tileable dark fantasy lava cavern wall texture,
dark volcanic rock with cracks,
orange lava veins glowing,
hot steam effects,
seamless repeating pattern,
game environment asset,
pixel art style, 64x128"

尺寸: 256x512 (4x4瓦片)
文件名: lava_wall.png

---

【岩浆河流边界】

Prompt:
"Tileable dark fantasy lava river bank,
dark rock edge of flowing lava,
cracks with bright orange glow,
heat distortion effect,
seamless repeating pattern,
game environment asset,
pixel art style, 64x64"

尺寸: 256x256 (4x4瓦片)
文件名: lava_river_edge.png
```

### 3.3 装饰物

```
═══════════════════════════════════════════════════════════════
【熔岩回响 - 装饰物】
═══════════════════════════════════════════════════════════════

【火焰喷射口】

Prompt:
"Dark fantasy flame vent decoration,
rock formation with fire shooting out,
bright orange flames,
volcanic geothermal feature,
transparent background,
game environment decoration,
pixel art style, 128x128"

文件名: lava_flame_vent.png

---

【凝固熔岩块】

Prompt:
"Dark fantasy cooled lava boulder decoration,
large dark red rock formation,
cracks with orange glow inside,
volcanic obstacle element,
transparent background,
game environment decoration,
pixel art style, 128x128"

文件名: lava_boulder.png

---

【战鼓祭坛】

Prompt:
"Dark fantasy drum altar decoration,
ancient stone altar with glowing runes,
war drum floating above,
orange and gold energy,
warrior memorial element,
transparent background,
game environment decoration,
pixel art style, 256x256"

文件名: lava_drum_altar.png

---

【岩浆气泡】

Prompt:
"Dark fantasy lava bubble decoration,
bubbling lava pool surface,
orange and yellow glow,
steam particles rising,
volcanic detail element,
transparent background,
game environment decoration,
pixel art style, 64x64"

文件名: lava_bubbles.png

---

【警告标记】

Prompt:
"Dark fantasy danger zone marker,
lava crack warning sign,
glowing orange cracks in ground,
heat distortion,
environmental hazard indicator,
transparent background,
game environment decoration,
pixel art style, 64x64"

文件名: lava_danger_zone.png
```

### 3.4 熔岩完整场景

```
═══════════════════════════════════════════════════════════════
【熔岩回响 - 完整场景概念图】
═══════════════════════════════════════════════════════════════

Prompt:
"Dark fantasy lava cavern level concept art,
massive underground volcanic chamber,
flowing lava rivers,
rocky platforms over lava,
fire geysers shooting flames,
dramatic orange lighting,
game level art, cinematic composition,
1920x1080, high quality"

尺寸: 1920x1080
文件名: lava_level_concept.png

---

【熔岩房间场景】

Prompt:
"Dark fantasy lava chamber room scene,
enclosed volcanic area with lava pools,
rocky platforms for combat,
floating embers,
fiery atmosphere,
game level design reference,
pixel art style, 1920x1080"

尺寸: 1920x1080
文件名: lava_room_scene.png

---

【熔岩BOSS房间】

Prompt:
"Dark fantasy lava boss arena concept art,
massive volcanic crater arena,
central platform over lava,
fiery environment,
dramatic boss battle setting,
orange and red lighting,
game level art, cinematic, 1920x1080"

尺寸: 1920x1080
文件名: lava_boss_arena.png
```

---

## 4. 深海低语场景

### 4.1 地形瓦片

```
═══════════════════════════════════════════════════════════════
【深海低语 - 地面瓦片】
═══════════════════════════════════════════════════════════════

【深海地面】

Prompt:
"Tileable dark fantasy deep sea floor texture,
dark sand with bioluminescent particles,
underwater cave floor,
blue and purple atmosphere,
seamless repeating pattern,
game environment asset,
pixel art style, 64x64"

尺寸: 256x256 (4x4瓦片)
文件名: deepsea_floor_tile.png

---

【珊瑚地面】

Prompt:
"Tileable dark fantasy coral floor texture,
small coral formations on seabed,
glowing bioluminescent patches,
underwater cave floor detail,
seamless repeating pattern,
game environment asset,
pixel art style, 64x64"

尺寸: 256x256 (4x4瓦片)
文件名: deepsea_coral_tile.png

---

【海藻地面】

Prompt:
"Tileable dark fantasy seaweed floor texture,
seaweed covering seabed,
bioluminescent glow from plants,
underwater environment,
seamless repeating pattern,
game environment asset,
pixel art style, 64x64"

尺寸: 256x256 (4x4瓦片)
文件名: deepsea_seaweed_tile.png

---

【岩石地面】

Prompt:
"Tileable dark fantasy underwater rock floor,
smooth water-worn stones,
bioluminescent moss,
deep sea cave floor,
seamless repeating pattern,
game environment asset,
pixel art style, 64x64"

尺寸: 256x256 (4x4瓦片)
文件名: deepsea_rock_tile.png
```

### 4.2 墙壁与障碍

```
═══════════════════════════════════════════════════════════════
【深海低语 - 墙壁瓦片】
═══════════════════════════════════════════════════════════════

【珊瑚墙壁】

Prompt:
"Tileable dark fantasy coral reef wall texture,
large coral formations,
bioluminescent glow,
underwater cave wall,
seamless repeating pattern,
game environment asset,
pixel art style, 64x128"

尺寸: 256x512 (4x4瓦片)
文件名: deepsea_coral_wall.png

---

【海藻帘幕】

Prompt:
"Tileable dark fantasy seaweed curtain texture,
hanging seaweed from ceiling,
bioluminescent glow,
underwater atmosphere,
seamless repeating pattern,
game environment asset,
pixel art style, 64x128"

尺寸: 256x512 (4x4瓦片)
文件名: deepsea_seaweed_curtain.png
```

### 4.3 装饰物

```
═══════════════════════════════════════════════════════════════
【深海低语 - 装饰物】
═══════════════════════════════════════════════════════════════

【发光水母群】

Prompt:
"Dark fantasy jellyfish cluster decoration,
bioluminescent jellyfish floating,
multiple jellyfish in group,
blue and purple glow,
underwater ambient decoration,
transparent background,
game environment decoration,
pixel art style, 128x128"

文件名: deepsea_jellyfish.png

---

【巨型珊瑚】

Prompt:
"Dark fantasy giant coral decoration,
large branching coral formation,
bioluminescent tips,
underwater landmark element,
transparent background,
game environment decoration,
pixel art style, 256x256"

文件名: deepsea_giant_coral.png

---

【海底废墟】

Prompt:
"Dark fantasy underwater ruins decoration,
ancient stone structure covered in coral,
bioluminescent plants growing,
mysterious deep sea ruins,
transparent background,
game environment decoration,
pixel art style, 256x256"

文件名: deepsea_ruins.png

---

【气泡柱】

Prompt:
"Dark fantasy bubble column decoration,
rising bubble stream,
bioluminescent glow around bubbles,
underwater vent effect,
transparent background,
game environment decoration,
pixel art style, 64x128"

文件名: deepsea_bubble_column.png

---

【深海祭坛】

Prompt:
"Dark fantasy underwater altar decoration,
ancient shrine with glowing runes,
bioluminescent energy,
underwater sacred space,
transparent background,
game environment decoration,
pixel art style, 256x256"

文件名: deepsea_altar.png
```

### 4.4 深海完整场景

```
═══════════════════════════════════════════════════════════════
【深海低语 - 完整场景概念图】
═══════════════════════════════════════════════════════════════

Prompt:
"Dark fantasy deep sea cavern level concept art,
massive underwater cave system,
bioluminescent coral everywhere,
jellyfish floating,
dark blue and purple atmosphere,
mysterious underwater world,
game level art, cinematic composition,
1920x1080, high quality"

尺寸: 1920x1080
文件名: deepsea_level_concept.png

---

【深海房间场景】

Prompt:
"Dark fantasy deep sea chamber room scene,
enclosed underwater area,
giant coral formations,
bioluminescent lighting,
floating particles,
game level design reference,
pixel art style, 1920x1080"

尺寸: 1920x1080
文件名: deepsea_room_scene.png

---

【深海BOSS房间】

Prompt:
"Dark fantasy deep sea boss arena concept art,
massive underwater cathedral,
bioluminescent everywhere,
mysterious ancient structures,
dramatic boss battle setting,
blue and purple lighting,
game level art, cinematic, 1920x1080"

尺寸: 1920x1080
文件名: deepsea_boss_arena.png
```

---

## 5. 骸骨圣殿场景

### 5.1 地形瓦片

```
═══════════════════════════════════════════════════════════════
【骸骨圣殿 - 地面瓦片】
═══════════════════════════════════════════════════════════════

【骨头地面】

Prompt:
"Tileable dark fantasy bone floor texture,
skulls and bones embedded in stone floor,
glowing blue runes,
ghostly mist,
seamless repeating pattern,
game environment asset,
pixel art style, 64x64"

尺寸: 256x256 (4x4瓦片)
文件名: bone_floor_tile.png

---

【石板地面】

Prompt:
"Tileable dark fantasy stone slab floor texture,
ancient carved stone tiles,
ghostly blue glow from cracks,
spectral atmosphere,
seamless repeating pattern,
game environment asset,
pixel art style, 64x64"

尺寸: 256x256 (4x4瓦片)
文件名: bone_stone_tile.png

---

【骨灰地面】

Prompt:
"Tileable dark fantasy ash and bone floor,
bone dust and fragments,
blue ghostly glow,
cathedral floor,
seamless repeating pattern,
game environment asset,
pixel art style, 64x64"

尺寸: 256x256 (4x4瓦片)
文件名: bone_ash_tile.png
```

### 5.2 墙壁与障碍

```
═══════════════════════════════════════════════════════════════
【骸骨圣殿 - 墙壁瓦片】
═══════════════════════════════════════════════════════════════

【骸骨墙壁】

Prompt:
"Tileable dark fantasy bone wall texture,
skulls and bones forming wall,
glowing blue runes between bones,
ghostly cathedral wall,
seamless repeating pattern,
game environment asset,
pixel art style, 64x128"

尺寸: 256x512 (4x4瓦片)
文件名: bone_wall.png

---

【石柱墙壁】

Prompt:
"Tileable dark fantasy stone pillar wall texture,
ancient carved pillars with bone motifs,
glowing runes,
cathedral architecture,
seamless repeating pattern,
game environment asset,
pixel art style, 64x128"

尺寸: 256x512 (4x4瓦片)
文件名: bone_pillar_wall.png
```

### 5.3 装饰物

```
═══════════════════════════════════════════════════════════════
【骸骨圣殿 - 装饰物】
═══════════════════════════════════════════════════════════════

【骨头拱门】

Prompt:
"Dark fantasy bone archway decoration,
arch made of skulls and bones,
glowing blue runes,
entrance to cathedral,
ghostly atmosphere,
transparent background,
game environment decoration,
pixel art style, 256x256"

文件名: bone_archway.png

---

【骨头王座】

Prompt:
"Dark fantasy bone throne decoration,
throne made of skeletal remains,
glowing blue energy,
ghostly ruler seat,
transparent background,
game environment decoration,
pixel art style, 256x256"

文件名: bone_throne.png

---

【骨塔】

Prompt:
"Dark fantasy bone spire decoration,
tower made of stacked bones,
glowing runes,
cathedral spire element,
transparent background,
game environment decoration,
pixel art style, 256x256"

文件名: bone_spire.png

---

【灵魂漩涡】

Prompt:
"Dark fantasy soul vortex decoration,
swirling ghostly energy,
blue and white glow,
spectral portal effect,
transparent background,
game environment decoration,
pixel art style, 128x128"

文件名: bone_soul_vortex.png

---

【聆听者合唱团】

Prompt:
"Dark fantasy ghostly choir decoration,
multiple translucent figures,
singing together,
musical notes floating,
spectral atmosphere,
transparent background,
game environment decoration,
pixel art style, 256x256"

文件名: bone_choir.png

---

【骨头祭坛】

Prompt:
"Dark fantasy bone altar decoration,
ancient altar with skull centerpiece,
glowing blue runes,
spectral candles,
sacred space element,
transparent background,
game environment decoration,
pixel art style, 256x256"

文件名: bone_altar.png
```

### 5.4 骸骨完整场景

```
═══════════════════════════════════════════════════════════════
【骸骨圣殿 - 完整场景概念图】
═══════════════════════════════════════════════════════════════

Prompt:
"Dark fantasy bone cathedral level concept art,
massive underground cathedral made of bones,
glowing blue runes everywhere,
ghostly choir singing,
ethereal blue atmosphere,
spectral and haunting world,
game level art, cinematic composition,
1920x1080, high quality"

尺寸: 1920x1080
文件名: bone_level_concept.png

---

【骸骨房间场景】

Prompt:
"Dark fantasy bone chamber room scene,
enclosed cathedral area,
bone pillars and walls,
glowing rune light,
ghostly atmosphere,
game level design reference,
pixel art style, 1920x1080"

尺寸: 1920x1080
文件名: bone_room_scene.png

---

【骸骨BOSS房间】

Prompt:
"Dark fantasy bone boss arena concept art,
massive bone cathedral interior,
central altar platform,
ghostly choir surrounding,
dramatic blue lighting,
boss battle setting,
game level art, cinematic, 1920x1080"

尺寸: 1920x1080
文件名: bone_boss_arena.png
```

---

## 6. 深渊核心场景

### 6.1 地形瓦片

```
═══════════════════════════════════════════════════════════════
【深渊核心 - 地面瓦片】
═══════════════════════════════════════════════════════════════

【深渊地面】

Prompt:
"Tileable dark fantasy abyss floor texture,
void-like dark surface,
swirling echo particles,
reality bending effect,
seamless repeating pattern,
game environment asset,
pixel art style, 64x64"

尺寸: 256x256 (4x4瓦片)
文件名: abyss_floor_tile.png

---

【声音碎片地面】

Prompt:
"Tileable dark fantasy sound fragment floor,
floating sound wave pieces on ground,
all colors mixed,
chaotic void surface,
seamless repeating pattern,
game environment asset,
pixel art style, 64x64"

尺寸: 256x256 (4x4瓦片)
文件名: abyss_fragment_tile.png

---

【虚空地面】

Prompt:
"Tileable dark fantasy void surface floor,
pure dark with subtle color shifts,
reality distortion,
deepest abyss,
seamless repeating pattern,
game environment asset,
pixel art style, 64x64"

尺寸: 256x256 (4x4瓦片)
文件名: abyss_void_tile.png
```

### 6.2 墙壁与障碍

```
═══════════════════════════════════════════════════════════════
【深渊核心 - 墙壁瓦片】
═══════════════════════════════════════════════════════════════

【虚空墙壁】

Prompt:
"Tileable dark fantasy void wall texture,
swirling void energy,
all colors bleeding together,
reality bending wall,
seamless repeating pattern,
game environment asset,
pixel art style, 64x128"

尺寸: 256x512 (4x4瓦片)
文件名: abyss_wall.png

---

【声音墙】

Prompt:
"Tileable dark fantasy sound wave wall,
solidified sound waves,
mixed colors,
chaotic energy barrier,
seamless repeating pattern,
game environment asset,
pixel art style, 64x128"

尺寸: 256x512 (4x4瓦片)
文件名: abyss_sound_wall.png
```

### 6.3 装饰物

```
═══════════════════════════════════════════════════════════════
【深渊核心 - 装饰物】
═══════════════════════════════════════════════════════════════

【深渊之心祭坛】

Prompt:
"Dark fantasy void heart altar decoration,
massive floating heart made of void energy,
surrounded by swirling sounds,
all colors mixed,
central boss element,
transparent background,
game environment decoration,
pixel art style, 512x512"

文件名: abyss_heart_altar.png

---

【声音碎片】

Prompt:
"Dark fantasy sound fragment decoration,
floating sound wave pieces,
all colors,
chaotic energy,
ambient decoration,
transparent background,
game environment decoration,
pixel art style, 128x128"

文件名: abyss_sound_fragment.png

---

【虚空之桥】

Prompt:
"Dark fantasy bridge of void decoration,
path made of solidified sounds,
floating over abyss,
reality distortion,
path element,
transparent background,
game environment decoration,
pixel art style, 256x256"

文件名: abyss_bridge.png

---

【虚空漩涡】

Prompt:
"Dark fantasy void vortex decoration,
swirling portal of nothing,
all colors spiraling,
reality tear effect,
portal decoration,
transparent background,
game environment decoration,
pixel art style, 256x256"

文件名: abyss_vortex.png

---

【创世回响】

Prompt:
"Dark fantasy creation echo decoration,
pure concentrated light and sound,
first sound visualization,
origin of everything,
sacred decoration,
transparent background,
game environment decoration,
pixel art style, 256x256"

文件名: abyss_creation_echo.png
```

### 6.4 深渊完整场景

```
═══════════════════════════════════════════════════════════════
【深渊核心 - 完整场景概念图】
═══════════════════════════════════════════════════════════════

Prompt:
"Dark fantasy abyss core level concept art,
ultimate void chamber,
reality bending environment,
all colors swirling,
chaos incarnate,
vast cosmic space,
game level art, cinematic composition,
1920x1080, high quality"

尺寸: 1920x1080
文件名: abyss_level_concept.png

---

【深渊房间场景】

Prompt:
"Dark fantasy void chamber room scene,
enclosed space of pure void,
swirling sound waves,
reality distortion,
cosmic horror atmosphere,
game level design reference,
pixel art style, 1920x1080"

尺寸: 1920x1080
文件名: abyss_room_scene.png

---

【深渊最终战场】

Prompt:
"Dark fantasy final boss arena concept art,
massive void arena with heart in center,
reality bending walls,
all colors represented,
ultimate confrontation,
dramatic cosmic lighting,
game level art, cinematic, 1920x1080"

尺寸: 1920x1080
文件名: abyss_final_arena.png
```

---

## 7. Tileset（瓦片地图）

### 7.1 完整Tileset模板

```
═══════════════════════════════════════════════════════════════
【Tileset生成指南】
═══════════════════════════════════════════════════════════════

Tileset是用于构建游戏关卡的瓦片集合。
每个Tileset应包含以下元素：

【基础Tileset结构】

┌────────────────────────────────────────────────────────────┐
│ ██ ██ ██ ██ │ ← 地砖 (4种变化)                             │
│ ██ ██ ██ ██ │                                               │
├──────────────┼───────────────┬──────────────────────────────┤
│    ████     │    ████      │        ████                  │
│    ████     │    ████      │        ████                  │
├──────────────┴───────────────┴──────────────────────────────┤
│   左上角    │    顶部边缘    │    右上角                  │
│             │    ████        │                           │
├──────────────┬───────────────┬──────────────────────────────┤
│   左侧边缘   │              │    右侧边缘                  │
│    ████     │   内部填充    │    ████                    │
│    ████     │    ████       │    ████                    │
├──────────────┴───────────────┴──────────────────────────────┤
│   左下角    │    底部边缘    │    右下角                  │
│             │    ████        │                           │
└────────────────────────────────────────────────────────────┘
```

### 7.2 区域Tileset生成提示词

```
═══════════════════════════════════════════════════════════════
【回响森林Tileset】
═══════════════════════════════════════════════════════════════

Prompt:
"Dark fantasy forest tileset for game level design,
64x64 pixel tiles, seamless connections,
4 variations of forest floor,
corner and edge pieces for walls,
dark green and purple atmosphere,
glowing echo moss details,
tree trunk walls, bush walls,
pixel art style, clean sprites,
transparent background"

尺寸建议: 512x512 或 768x768
文件名: tileset_forest.png

---

═══════════════════════════════════════════════════════════════
【熔岩回响Tileset】
═══════════════════════════════════════════════════════════════

Prompt:
"Dark fantasy lava tileset for game level design,
64x64 pixel tiles, seamless connections,
4 variations of volcanic floor,
lava pool edges, rock platforms,
dark red and orange atmosphere,
glowing lava crack details,
stone walls, barrier walls,
pixel art style, clean sprites,
transparent background"

尺寸建议: 512x512 或 768x768
文件名: tileset_lava.png

---

═══════════════════════════════════════════════════════════════
【深海低语Tileset】
═══════════════════════════════════════════════════════════════

Prompt:
"Dark fantasy deep sea tileset for game level design,
64x64 pixel tiles, seamless connections,
4 variations of seabed floor,
coral formations, rock formations,
dark blue and purple atmosphere,
bioluminescent glow details,
coral walls, seaweed curtains,
pixel art style, clean sprites,
transparent background"

尺寸建议: 512x512 或 768x768
文件名: tileset_deepsea.png

---

═══════════════════════════════════════════════════════════════
【骸骨圣殿Tileset】
═══════════════════════════════════════════════════════════════

Prompt:
"Dark fantasy bone cathedral tileset for game level design,
64x64 pixel tiles, seamless connections,
4 variations of bone floor,
skull embedded surfaces,
gray and white atmosphere with blue glow,
glowing rune details,
bone walls, pillar walls,
pixel art style, clean sprites,
transparent background"

尺寸建议: 512x512 或 768x768
文件名: tileset_bone.png

---

═══════════════════════════════════════════════════════════════
【深渊核心Tileset】
═══════════════════════════════════════════════════════════════

Prompt:
"Dark fantasy abyss core tileset for game level design,
64x64 pixel tiles, seamless connections,
4 variations of void floor,
sound fragment surfaces,
mixed colors swirling,
reality distortion effects,
void walls, sound walls,
pixel art style, clean sprites,
transparent background"

尺寸建议: 512x512 或 768x768
文件名: tileset_abyss.png
```

---

## 8. 背景与氛围

### 8.1 视差背景层

```
═══════════════════════════════════════════════════════════════
【视差背景生成】
═══════════════════════════════════════════════════════════════

【回响森林 - 远景层】

Prompt:
"Dark fantasy forest parallax background layer,
far distance dead trees silhouettes,
purple and green mist,
glowing echo particles in distance,
atmospheric depth,
game background, 1920x1080"

尺寸: 1920x1080
文件名: forest_bg_far.png

---

【回响森林 - 中景层】

Prompt:
"Dark fantasy forest parallax background layer,
medium distance twisted trees,
glowing moss details,
more defined atmosphere,
game background, 1920x1080"

尺寸: 1920x1080
文件名: forest_bg_mid.png

---

【回响森林 - 近景层】

Prompt:
"Dark fantasy forest parallax background layer,
close foreground branches and vines,
detailed dead leaves,
frame composition,
game background, 1920x1080"

尺寸: 1920x1080
文件名: forest_bg_near.png

---

【熔岩回响 - 远景层】

Prompt:
"Dark fantasy lava cavern parallax background layer,
far distance lava rivers flowing,
volcanic mountains,
orange red atmosphere,
heat distortion,
game background, 1920x1080"

尺寸: 1920x1080
文件名: lava_bg_far.png

---

【深海低语 - 远景层】

Prompt:
"Dark fantasy deep sea parallax background layer,
far distance giant creatures,
bioluminescent lights,
dark blue void,
mysterious depth,
game background, 1920x1080"

尺寸: 1920x1080
文件名: deepsea_bg_far.png

---

【骸骨圣殿 - 远景层】

Prompt:
"Dark fantasy bone cathedral parallax background layer,
far distance massive bone structures,
glowing runes,
ethereal blue atmosphere,
ghostly forms,
game background, 1920x1080"

尺寸: 1920x1080
文件名: bone_bg_far.png

---

【深渊核心 - 远景层】

Prompt:
"Dark fantasy void abyss parallax background layer,
cosmic void with all colors,
reality bending distant walls,
incomprehensible scale,
cosmic horror,
game background, 1920x1080"

尺寸: 1920x1080
文件名: abyss_bg_far.png
```

### 8.2 氛围特效

```
═══════════════════════════════════════════════════════════════
【氛围特效装饰】
═══════════════════════════════════════════════════════════════

【回响森林 - 萤火虫/光点】

Prompt:
"Dark fantasy forest ambient particles,
floating echo orbs and fireflies,
glowing green and cyan,
gentle floating motion,
atmospheric particle effect,
transparent background,
game ambient decoration,
pixel art style, 64x64"

文件名: forest_particles.png

---

【熔岩回响 - 火星/灰烬】

Prompt:
"Dark fantasy lava ambient particles,
floating embers and ash,
orange and red,
rising motion,
volcanic atmosphere,
transparent background,
game ambient decoration,
pixel art style, 64x64"

文件名: lava_particles.png

---

【深海低语 - 气泡】

Prompt:
"Dark fantasy deep sea ambient particles,
rising bubbles,
bioluminescent glow,
various sizes,
underwater atmosphere,
transparent background,
game ambient decoration,
pixel art style, 64x64"

文件名: deepsea_particles.png

---

【骸骨圣殿 - 灵魂】

Prompt:
"Dark fantasy bone cathedral ambient particles,
floating soul wisps,
blue ghostly glow,
dancing motion,
spectral atmosphere,
transparent background,
game ambient decoration,
pixel art style, 64x64"

文件名: bone_particles.png

---

【深渊核心 - 混沌】

Prompt:
"Dark fantasy void ambient particles,
chaotic floating sound fragments,
all colors mixed,
reality distortion,
cosmic particles,
transparent background,
game ambient decoration,
pixel art style, 64x64"

文件名: abyss_particles.png
```

---

## 9. 批量生成清单

### 9.1 完整环境素材清单

```
═══════════════════════════════════════════════════════════════
【环境素材完整清单】
═══════════════════════════════════════════════════════════════

┌─────────────────────────────────────────────────────────────┐
│ 回响森林                                                      │
├─────────────────────────────────────────────────────────────┤
│ 瓦片 (Tiles):                                                 │
│ ☐ forest_floor_tile.png      - 基础地面 (256x256)            │
│ ☐ forest_moss_tile.png       - 苔藓地面 (256x256)            │
│ ☐ forest_leaves_tile.png     - 落叶地面 (256x256)            │
│ ☐ forest_roots_tile.png      - 树根地面 (256x256)            │
│ ☐ forest_tree_wall.png       - 树木墙壁 (256x512)            │
│ ☐ forest_bush_wall.png       - 灌木墙壁 (256x256)            │
│ ☐ forest_vines.png           - 藤蔓 (256x256)                │
│                                                              │
│ 装饰物:                                                       │
│ ☐ forest_dead_tree.png       - 枯萎古树 (256x256)            │
│ ☐ forest_mushroom.png       - 发光蘑菇 (64x64)              │
│ ☐ forest_echo_orb.png       - 回响光球 (64x64)              │
│ ☐ forest_twisted_roots.png   - 扭曲树根 (128x128)            │
│ ☐ forest_elf_ruins.png      - 精灵废墟 (256x256)            │
│ ☐ forest_particles.png       - 光点粒子 (64x64)              │
│                                                              │
│ 概念图:                                                       │
│ ☐ forest_level_concept.png   - 关卡概念 (1920x1080)         │
│ ☐ forest_room_scene.png      - 房间场景 (1920x1080)         │
│ ☐ forest_boss_arena.png      - BOSS房间 (1920x1080)         │
│                                                              │
│ 背景层:                                                       │
│ ☐ forest_bg_far.png         - 远景 (1920x1080)             │
│ ☐ forest_bg_mid.png         - 中景 (1920x1080)             │
│ ☐ forest_bg_near.png        - 近景 (1920x1080)             │
│                                                              │
│ Tileset:                                                     │
│ ☐ tileset_forest.png        - 完整瓦片集 (768x768)         │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ 熔岩回响                                                      │
├─────────────────────────────────────────────────────────────┤
│ 瓦片 (Tiles):                                                 │
│ ☐ lava_ground_tile.png      - 熔岩地面 (256x256)            │
│ ☐ lava_bank_tile.png        - 岩浆边缘 (256x256)            │
│ ☐ lava_rock_tile.png       - 岩石地面 (256x256)            │
│ ☐ lava_platform_tile.png    - 安全平台 (256x256)            │
│ ☐ lava_wall.png            - 熔岩石墙 (256x512)            │
│ ☐ lava_river_edge.png      - 岩浆边界 (256x256)            │
│                                                              │
│ 装饰物:                                                       │
│ ☐ lava_flame_vent.png       - 火焰喷射口 (128x128)          │
│ ☐ lava_boulder.png         - 凝固熔岩 (128x128)            │
│ ☐ lava_drum_altar.png      - 战鼓祭坛 (256x256)            │
│ ☐ lava_bubbles.png         - 岩浆气泡 (64x64)              │
│ ☐ lava_danger_zone.png     - 危险区域 (64x64)             │
│ ☐ lava_particles.png       - 火星灰烬 (64x64)             │
│                                                              │
│ 概念图:                                                       │
│ ☐ lava_level_concept.png   - 关卡概念 (1920x1080)         │
│ ☐ lava_room_scene.png      - 房间场景 (1920x1080)         │
│ ☐ lava_boss_arena.png      - BOSS房间 (1920x1080)         │
│                                                              │
│ 背景层:                                                       │
│ ☐ lava_bg_far.png          - 远景 (1920x1080)             │
│                                                              │
│ Tileset:                                                     │
│ ☐ tileset_lava.png         - 完整瓦片集 (768x768)          │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ 深海低语                                                      │
├─────────────────────────────────────────────────────────────┤
│ 瓦片 (Tiles):                                                 │
│ ☐ deepsea_floor_tile.png    - 深海地面 (256x256)            │
│ ☐ deepsea_coral_tile.png    - 珊瑚地面 (256x256)            │
│ ☐ deepsea_seaweed_tile.png - 海藻地面 (256x256)            │
│ ☐ deepsea_rock_tile.png     - 岩石地面 (256x256)            │
│ ☐ deepsea_coral_wall.png    - 珊瑚墙壁 (256x512)            │
│ ☐ deepsea_seaweed_curtain.png - 海藻帘幕 (256x512)         │
│                                                              │
│ 装饰物:                                                       │
│ ☐ deepsea_jellyfish.png    - 发光水母群 (128x128)          │
│ ☐ deepsea_giant_coral.png  - 巨型珊瑚 (256x256)            │
│ ☐ deepsea_ruins.png        - 海底废墟 (256x256)            │
│ ☐ deepsea_bubble_column.png - 气泡柱 (64x128)              │
│ ☐ deepsea_altar.png        - 深海祭坛 (256x256)            │
│ ☐ deepsea_particles.png    - 气泡粒子 (64x64)             │
│                                                              │
│ 概念图:                                                       │
│ ☐ deepsea_level_concept.png - 关卡概念 (1920x1080)         │
│ ☐ deepsea_room_scene.png   - 房间场景 (1920x1080)         │
│ ☐ deepsea_boss_arena.png   - BOSS房间 (1920x1080)         │
│                                                              │
│ 背景层:                                                       │
│ ☐ deepsea_bg_far.png       - 远景 (1920x1080)             │
│                                                              │
│ Tileset:                                                     │
│ ☐ tileset_deepsea.png      - 完整瓦片集 (768x768)          │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ 骸骨圣殿                                                      │
├─────────────────────────────────────────────────────────────┤
│ 瓦片 (Tiles):                                                 │
│ ☐ bone_floor_tile.png      - 骨头地面 (256x256)            │
│ ☐ bone_stone_tile.png     - 石板地面 (256x256)            │
│ ☐ bone_ash_tile.png        - 骨灰地面 (256x256)            │
│ ☐ bone_wall.png           - 骸骨墙壁 (256x512)            │
│ ☐ bone_pillar_wall.png     - 石柱墙壁 (256x512)            │
│                                                              │
│ 装饰物:                                                       │
│ ☐ bone_archway.png         - 骨头拱门 (256x256)            │
│ ☐ bone_throne.png         - 骨头王座 (256x256)            │
│ ☐ bone_spire.png          - 骨塔 (256x256)                │
│ ☐ bone_soul_vortex.png    - 灵魂漩涡 (128x128)            │
│ ☐ bone_choir.png          - 合唱团 (256x256)              │
│ ☐ bone_altar.png          - 骨头祭坛 (256x256)            │
│ ☐ bone_particles.png      - 灵魂粒子 (64x64)             │
│                                                              │
│ 概念图:                                                       │
│ ☐ bone_level_concept.png   - 关卡概念 (1920x1080)         │
│ ☐ bone_room_scene.png      - 房间场景 (1920x1080)         │
│ ☐ bone_boss_arena.png      - BOSS房间 (1920x1080)         │
│                                                              │
│ 背景层:                                                       │
│ ☐ bone_bg_far.png         - 远景 (1920x1080)             │
│                                                              │
│ Tileset:                                                     │
│ ☐ tileset_bone.png        - 完整瓦片集 (768x768)          │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ 深渊核心                                                      │
├─────────────────────────────────────────────────────────────┤
│ 瓦片 (Tiles):                                                 │
│ ☐ abyss_floor_tile.png     - 深渊地面 (256x256)            │
│ ☐ abyss_fragment_tile.png   - 碎片地面 (256x256)            │
│ ☐ abyss_void_tile.png      - 虚空地面 (256x256)            │
│ ☐ abyss_wall.png          - 虚空墙壁 (256x512)            │
│ ☐ abyss_sound_wall.png    - 声音墙壁 (256x512)            │
│                                                              │
│ 装饰物:                                                       │
│ ☐ abyss_heart_altar.png   - 深渊祭坛 (512x512)            │
│ ☐ abyss_sound_fragment.png - 声音碎片 (128x128)            │
│ ☐ abyss_bridge.png        - 虚空之桥 (256x256)            │
│ ☐ abyss_vortex.png        - 虚空漩涡 (256x256)            │
│ ☐ abyss_creation_echo.png - 创世回响 (256x256)            │
│ ☐ abyss_particles.png     - 混沌粒子 (64x64)             │
│                                                              │
│ 概念图:                                                       │
│ ☐ abyss_level_concept.png  - 关卡概念 (1920x1080)         │
│ ☐ abyss_room_scene.png     - 房间场景 (1920x1080)         │
│ ☐ abyss_final_arena.png    - 最终战场 (1920x1080)         │
│                                                              │
│ 背景层:                                                       │
│ ☐ abyss_bg_far.png         - 远景 (1920x1080)              │
│                                                              │
│ Tileset:                                                     │
│ ☐ tileset_abyss.png       - 完整瓦片集 (768x768)          │
└─────────────────────────────────────────────────────────────┘
```

### 9.2 生成优先级

```
═══════════════════════════════════════════════════════════════
【环境素材生成优先级】
═══════════════════════════════════════════════════════════════

【第一优先级 - 必须生成】

每个区域需要：
1. 基础地面瓦片 × 2-3种
2. 墙壁瓦片 × 1-2种
3. 主要装饰物 × 3-5个
4. 概念图 × 1-2张

总计每个区域：至少10个素材

【第二优先级 - 完整体验】

每个区域添加：
1. 所有地面瓦片变体
2. 边缘和角落瓦片
3. 次要装饰物
4. 粒子特效
5. 背景层

总计每个区域：至少20个素材

【第三优先级 - 完美呈现】

每个区域添加：
1. 完整Tileset
2. 所有角度的装饰物
3. 动态效果暗示
4. 特殊交互元素
5. 更多背景层

总计每个区域：至少30个素材
```

---

**文档版本：1.0**
**最后更新：2025年**

**下一步：查看 `08_ui_effects_prompts.md` 生成UI与特效素材提示词**
