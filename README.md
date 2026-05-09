# 回响深渊 (Echo Abyss)

一款基于 Godot 4.x 开发的暗黑奇幻风格 Roguelike 动作游戏。

## 游戏简介

**回响深渊**是一款俯视角 Roguelike 动作游戏。玩家将扮演"聆听者"，深入由无数声音凝结而成的深渊，寻找真相与归宿。

### 核心特色

- 🎮 **Roguelike 结构**：永久死亡，但保留回响币和解锁内容
- 🎨 **声音可视化**：独特的视觉风格，所有声音都是可见的存在
- ⚔️ **三职业系统**：聆听者、喧嚣者、沉默者，三种完全不同玩法
- 🌌 **五个区域**：回响森林、熔岩回响、深海低语、骸骨圣殿、深渊核心
- 🎭 **分支结局**：封印或觉醒，你的选择决定世界的命运

## 项目结构

```
echo-abyss/
├── docs/                    # 游戏设计文档
│   ├── 01_world_lore.md    # 世界观与背景设定
│   ├── 02_characters.md    # 角色与NPC详细设计
│   ├── 03_zones.md         # 区域与地点设计
│   ├── 04_skills.md        # 职业技能系统设计
│   └── 05_enemies.md       # 敌人与BOSS设计
│
├── prompts/                # AI素材生成提示词
│   ├── 05_character_prompts.md   # 角色与NPC素材提示词
│   ├── 06_enemy_prompts.md      # 敌人设计提示词
│   ├── 07_environment_prompts.md # 环境与场景提示词
│   └── 08_ui_effects_prompts.md  # UI与特效提示词
│
├── assets/                 # 游戏资源（生成后）
│   ├── images/            # 图片素材
│   │   ├── characters/    # 角色图片
│   │   ├── enemies/       # 敌人图片
│   │   ├── environments/  # 环境素材
│   │   ├── ui/           # UI元素
│   │   └── effects/       # 特效
│   ├── audio/            # 音频资源
│   │   ├── music/        # 背景音乐
│   │   ├── sfx/          # 音效
│   │   └── ambient/       # 环境音
│   └── fonts/             # 字体资源
│
├── scenes/                 # Godot 场景文件
│   ├── levels/           # 关卡场景
│   ├── ui/              # UI场景
│   ├── characters/       # 角色场景
│   └── enemies/          # 敌人场景
│
├── scripts/               # GDScript 脚本
│   ├── autoload/        # 自动加载脚本
│   ├── characters/       # 角色脚本
│   ├── enemies/         # 敌人脚本
│   ├── ui/              # UI脚本
│   ├── levels/          # 关卡脚本
│   └── systems/          # 系统脚本
│
├── resources/             # Godot 资源文件
│   ├── items/           # 物品定义
│   ├── enemies/         # 敌人定义
│   ├── skills/          # 技能定义
│   └── dialogues/       # 对话资源
│
├── project.godot          # Godot 项目配置
└── export_presets.cfg    # 导出配置
```

## 开发环境

- **引擎**：Godot 4.x
- **语言**：GDScript
- **目标平台**：Windows / macOS / Linux / HTML5

## 开始开发

### 1. 克隆项目

```bash
git clone <repository-url>
cd echo-abyss
```

### 2. 打开项目

用 Godot 4.x 打开项目目录即可开始开发。

### 3. 资源准备

使用 `/prompts/` 目录下的提示词，通过 AI 工具生成游戏素材。

## 设计文档

详细的设计文档请查看 `/docs/` 目录：

- [世界观与背景设定](docs/01_world_lore.md)
- [角色与NPC设计](docs/02_characters.md)
- [区域与地点设计](docs/03_zones.md)
- [职业技能系统](docs/04_skills.md)
- [敌人与BOSS设计](docs/05_enemies.md)

## 团队

- **开发者**：Solo + AI
- **状态**：设计完成，准备开发

## 许可证

待定
