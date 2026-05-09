# 《回响深渊》技术设计方案

> **ECHO ABYSS - Technical Design Document**
> **文档版本：1.0**
> **最后更新：2025年5月**

---

## 目录

1. [技术栈概述](#1-技术栈概述)
2. [项目架构](#2-项目架构)
3. [代码规范](#3-代码规范)
4. [命名规范](#4-命名规范)
5. [场景管理](#5-场景管理)
6. [资源管理](#6-资源管理)
7. [核心系统设计](#7-核心系统设计)
8. [版本控制规范](#8-版本控制规范)
9. [开发工作流](#9-开发工作流)

---

## 1. 技术栈概述

### 1.1 核心技术选型

```
┌─────────────────────────────────────────────────────────────┐
│                    技术栈选择                              │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  游戏引擎      │  Godot 4.x                    │  ⭐⭐⭐⭐⭐   │
│  脚本语言      │  GDScript                     │  ⭐⭐⭐⭐     │
│  着色器        │  Godot Shader Language        │  ⭐⭐⭐⭐     │
│  版本控制      │  Git + GitHub                 │  ⭐⭐⭐⭐⭐   │
│  项目管理      │  GitHub Projects              │  ⭐⭐⭐       │
│                                                             │
│  目标平台                                                      │
│  ├─ Windows (.exe)                                         │
│  ├─ macOS (.app)                                           │
│  ├─ Linux (.x86_64)                                        │
│  └─ HTML5 (Web)                                            │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 1.2 选择 Godot 4.x 的理由

```
【优势】

1. 开源免费
   - 无授权费用
   - 源码可定制
   - 社区活跃

2. 轻量高效
   - 安装包小（约100MB）
   - 启动快速
   - 资源占用低

3. GDScript 友好
   - Python-like 语法
   - 学习曲线平缓
   - AI 生成代码兼容性好

4. 2D 支持优秀
   - 原生 2D 引擎
   - 像素完美支持
   - Tilemap 强大

5. 跨平台导出
   - 一键导出多平台
   - Web 导出成熟
   - 移动端支持完善

【注意事项】

1. 与 Unity 差异
   - 节点系统 vs 组件系统
   - 信号系统 vs 事件系统
   - 场景即预制体

2. 性能考量
   - 复杂 3D 场景需优化
   - 2D 性能优秀

3. 第三方库
   - 资源相对 Unity 较少
   - 需要自行实现部分功能
```

### 1.3 依赖版本

```
【推荐版本】

Godot Engine    │ 4.2.x 或更高
GDScript        │ 内置（与引擎版本绑定）
.NET SDK        │ 8.0+（如使用 C#）

【运行环境】

Windows          │ Windows 10+
macOS            │ macOS 10.15+
Linux            │ Ubuntu 20.04+
Web              │ 现代浏览器（Chrome, Firefox, Edge）
```

---

## 2. 项目架构

### 2.1 目录结构

```
echo-abyss/
│
├── project.godot              # Godot 项目配置文件
├── export_presets.cfg          # 导出配置
│
├── docs/                      # 文档目录
│   ├── SPEC.md                # 游戏设计文档
│   ├── TECHNICAL.md           # 本文档
│   └── api/                   # API 文档（如有）
│
├── assets/                    # 静态资源
│   ├── images/               # 图片素材
│   │   ├── characters/       # 角色图片
│   │   │   ├── player/       # 玩家角色
│   │   │   ├── npc/          # NPC
│   │   │   └── enemies/      # 敌人
│   │   ├── environments/     # 环境素材
│   │   │   ├── tilesets/     # 瓦片集
│   │   │   ├── backgrounds/  # 背景图
│   │   │   └── decorations/  # 装饰物
│   │   ├── ui/              # UI 素材
│   │   │   ├── icons/        # 图标
│   │   │   ├── buttons/      # 按钮
│   │   │   └── panels/       # 面板
│   │   └── effects/          # 特效素材
│   │
│   ├── audio/                # 音频资源
│   │   ├── music/            # 背景音乐
│   │   ├── sfx/             # 音效
│   │   │   ├── ui/          # UI 音效
│   │   │   ├── combat/       # 战斗音效
│   │   │   └── ambient/      # 环境音效
│   │   └── voice/            # 语音（预留）
│   │
│   └── fonts/                # 字体资源
│       ├── ui/               # UI 字体
│       └── titles/           # 标题字体
│
├── scenes/                    # 场景文件 (.tscn)
│   ├── core/                 # 核心场景
│   │   ├── main.tscn         # 主场景入口
│   │   └── game.tscn         # 游戏主场景
│   │
│   ├── ui/                   # UI 场景
│   │   ├── menus/            # 菜单
│   │   │   ├── main_menu.tscn
│   │   │   ├── pause_menu.tscn
│   │   │   └── settings_menu.tscn
│   │   ├── hud/              # 游戏 HUD
│   │   │   ├── game_hud.tscn
│   │   │   ├── health_bar.tscn
│   │   │   └── skill_bar.tscn
│   │   ├── dialogs/          # 对话框
│   │   └── popups/           # 弹出窗口
│   │
│   ├── characters/            # 角色场景
│   │   ├── player/           # 玩家角色
│   │   │   ├── player.tscn   # 玩家主场景
│   │   │   └── states/       # 状态节点
│   │   └── npc/              # NPC
│   │
│   ├── enemies/              # 敌人场景
│   │   ├── common/           # 通用敌人
│   │   ├── elites/           # 精英敌人
│   │   └── bosses/           # BOSS
│   │
│   ├── levels/               # 关卡场景
│   │   ├── zones/            # 区域
│   │   │   ├── forest/       # 回响森林
│   │   │   ├── lava/         # 熔岩回响
│   │   │   ├── deepsea/      # 深海低语
│   │   │   ├── bone/         # 骸骨圣殿
│   │   │   └── abyss/        # 深渊核心
│   │   ├── rooms/            # 房间预制体
│   │   │   ├── combat_room.tscn
│   │   │   ├── boss_room.tscn
│   │   │   ├── shop_room.tscn
│   │   │   └── event_room.tscn
│   │   └── levels.gd        # 关卡生成脚本
│   │
│   └── effects/               # 特效场景
│       ├── particles/         # 粒子效果
│       └── animations/        # 动画场景
│
├── scripts/                   # GDScript 脚本
│   ├── autoload/             # 自动加载（单例）
│   │   ├── game_manager.gd   # 游戏管理器
│   │   ├── audio_manager.gd  # 音频管理器
│   │   ├── save_manager.gd   # 存档管理器
│   │   ├── input_manager.gd  # 输入管理器
│   │   └── debug_manager.gd  # 调试管理器
│   │
│   ├── core/                  # 核心脚本
│   │   ├── game.gd           # 游戏主逻辑
│   │   └── level_loader.gd   # 关卡加载器
│   │
│   ├── characters/            # 角色脚本
│   │   ├── player/
│   │   │   ├── player.gd     # 玩家主脚本
│   │   │   ├── player_states.gd  # 状态枚举
│   │   │   ├── state_machine.gd  # 状态机
│   │   │   └── skills/
│   │   │       ├── skill.gd      # 技能基类
│   │   │       ├── skill_listener.gd
│   │   │       ├── skill_roarer.gd
│   │   │       └── skill_silent.gd
│   │   │
│   │   └── npc/
│   │       └── npc.gd        # NPC 基类
│   │
│   ├── enemies/               # 敌人脚本
│   │   ├── base_enemy.gd     # 敌人基类
│   │   ├── enemy_ai.gd       # 敌人 AI
│   │   ├── enemy_bat.gd       # 回响蝙蝠
│   │   ├── enemy_crawler.gd   # 阴影爬行者
│   │   └── bosses/
│   │       ├── boss.gd       # BOSS 基类
│   │       ├── boss_warden.gd # 回响守卒
│   │       ├── boss_soundwave.gd # 颤音魔女
│   │       └── boss_void.gd   # 深渊之心
│   │
│   ├── combat/                # 战斗系统
│   │   ├── combat_manager.gd # 战斗管理器
│   │   ├── damage_number.gd   # 伤害数字
│   │   ├── hit_effect.gd      # 命中特效
│   │   └── status_effect.gd   # 状态效果
│   │
│   ├── ui/                   # UI 脚本
│   │   ├── menus/
│   │   │   ├── main_menu.gd
│   │   │   └── pause_menu.gd
│   │   ├── hud/
│   │   │   ├── game_hud.gd
│   │   │   └── health_bar.gd
│   │   └── dialogs/
│   │       └── dialog_system.gd
│   │
│   ├── levels/                # 关卡脚本
│   │   ├── zone.gd           # 区域基类
│   │   ├── room.gd           # 房间基类
│   │   ├── room_generator.gd # 房间生成器
│   │   └── level_manager.gd   # 关卡管理器
│   │
│   ├── systems/               # 系统脚本
│   │   ├── inventory.gd       # 背包系统
│   │   ├── equipment.gd       # 装备系统
│   │   ├── skill_tree.gd      # 技能树
│   │   ├── progression.gd      # 进度系统
│   │   └── currency.gd        # 货币系统
│   │
│   └── utils/                 # 工具脚本
│       ├── constants.gd       # 常量定义
│       ├── extensions.gd      # 扩展方法
│       ├── signals.gd         # 信号定义
│       └── helpers.gd        # 辅助函数
│
├── resources/                 # Godot 资源文件
│   ├── items/                 # 物品资源
│   │   └── *.tres
│   ├── enemies/               # 敌人配置
│   │   └── *.tres
│   ├── skills/                # 技能配置
│   │   └── *.tres
│   ├── dialogues/             # 对话配置
│   │   └── *.tres
│   └── characters/            # 角色配置
│       └── *.tres
│
├── localization/              # 本地化文件
│   ├── en.po                 # 英文
│   └── zh.po                 # 中文
│
├── tests/                    # 测试文件（预留）
│
├── .gitignore
├── README.md
└── LICENSE
```

### 2.2 核心类图

```
┌─────────────────────────────────────────────────────────────┐
│                      核心类架构                             │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  [Autoload - 全局单例]                                      │
│  ┌─────────────────┐                                        │
│  │  GameManager    │  ← 游戏主状态管理                       │
│  ├─────────────────┤                                        │
│  │  AudioManager   │  ← 音频播放管理                         │
│  ├─────────────────┤                                        │
│  │  SaveManager    │  ← 存档/读档                           │
│  ├─────────────────┤                                        │
│  │  InputManager   │  ← 输入处理                             │
│  └─────────────────┘                                        │
│                                                             │
│  [Character - 角色]                                          │
│  ┌───────────┐    ┌───────────┐    ┌───────────┐           │
│  │  Player   │←───│  State    │←───│  Skill    │           │
│  │           │    │  Machine  │    │  System   │           │
│  └───────────┘    └───────────┘    └───────────┘           │
│       ↑                                                       │
│  ┌───────────┐    ┌───────────┐                             │
│  │  Stats    │───→│  Skills   │                             │
│  │           │    │  (Q/W/E/R)│                            │
│  └───────────┘    └───────────┘                             │
│                                                             │
│  [Enemy - 敌人]                                              │
│  ┌───────────┐    ┌───────────┐                             │
│  │BaseEnemy  │←───│  EnemyAI  │                             │
│  │           │    │           │                             │
│  └───────────┘    └───────────┘                             │
│       ↑                                                       │
│  ┌───────────┐    ┌───────────┐                             │
│  │   Boss    │←───│  BossAI  │                             │
│  │           │    │           │                             │
│  └───────────┘    └───────────┘                             │
│                                                             │
│  [Combat - 战斗]                                             │
│  ┌───────────┐    ┌───────────┐    ┌───────────┐            │
│  │  Combat   │───→│  Damage   │───→│  Status  │            │
│  │  Manager  │    │  System   │    │  Effects │            │
│  └───────────┘    └───────────┘    └───────────┘            │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 2.3 场景继承结构

```
[场景继承树]

Node (Godot 基础)
├── CanvasItem
│   ├── Control (UI 控件)
│   │   ├── Panel
│   │   │   ├── GameHUD
│   │   │   ├── MenuPanel
│   │   │   └── DialogBox
│   │   │
│   │   └── Button
│   │       ├── MenuButton
│   │       └── SkillButton
│   │
│   └── Node2D
│       ├── Sprite2D
│       ├── AnimatedSprite2D
│       └── TileMap
│
├── Area2D
│   ├── HitboxArea (攻击判定)
│   └── HurtboxArea (受击判定)
│
└── KinematicBody2D / CharacterBody2D
    ├── Player
    │   ├── Listener
    │   ├── Roarer
    │   └── Silent
    │
    └── Enemy
        ├── Scout (小型)
        ├── Soldier (中型)
        ├── Elite (精英)
        └── Boss
```

---

## 3. 代码规范

### 3.1 GDScript 编码规范

```
【基本格式】

1. 缩进
   - 使用 4 个空格（不是 Tab）
   - Godot 默认使用 Tab，需配置为空格

2. 行长度
   - 建议每行不超过 120 字符
   - 长语句需换行对齐

3. 空行
   - 类定义之间空 2 行
   - 方法之间空 1 行
   - 逻辑段落之间空 1 行

4. 注释
   - 使用 # 开头
   - 注释在代码上方，而非同行
   - 保持注释与代码同步更新
```

```gdscript
# ✅ 正确示例

extends CharacterBody2D

class_name Player

signal health_changed(new_value)
signal died

@export var speed: float = 200.0
@export var max_health: int = 100

var current_health: int = max_health
var is_invincible: bool = false


func _ready() -> void:
    add_to_group("player")
    health_changed.connect(_on_health_changed)


func take_damage(amount: int) -> void:
    if is_invincible:
        return

    current_health = max(0, current_health - amount)
    health_changed.emit(current_health)

    if current_health <= 0:
        die()


func _on_health_changed(new_health: int) -> void:
    # 更新 UI
    pass
```

```gdscript
# ❌ 错误示例

extends CharacterBody2D # 注释放同行
var speed=200.0 # 没有类型
func _ready():# 没有空格
    add_to_group("player")# 没有对齐
```

### 3.2 类与命名

```
【类命名】

规则：
- 使用 PascalCase
- 清晰表达类功能
- 使用有意义的名称

示例：
✅ Player, Enemy, SkillSystem, GameHUD
❌ Pl, En, SS, GH
```

### 3.3 方法命名

```
【方法命名】

规则：
- 使用 snake_case
- 动词 + 名词模式
- 私有方法以 _ 开头

规则动词：
- get_xxx()      获取数据
- set_xxx()      设置数据
- is_xxx()       返回布尔值
- has_xxx()       检查是否拥有
- on_xxx()       事件回调
- _xxx()         私有方法
- _ready()       Godot 生命周期
- _process()     Godot 生命周期
- _physics_process() Godot 生命周期

示例：
✅ get_health(), set_velocity(), is_alive()
✅ on_skill_used(), _calculate_damage()
❌ health(), vel(), alive(), CalculateDamage()
```

### 3.4 变量命名

```
【变量命名】

规则：
- 使用 snake_case
- 类型前缀（可选，用于模糊变量）

类型前缀（可选）：
- b_  : bool
- i_  : int
- f_  : float
- s_  : String
- a_  : Array
- d_  : Dictionary
- n_  : Node
- t_  : Timer

示例：
✅ health, max_speed, is_running
✅ b_is_alive, i_player_level, f_damage_multiplier
❌ healthAmount, MaxSpeed, mSpeed
```

### 3.5 常量与枚举

```
【常量】

规则：
- 使用 UPPER_SNAKE_CASE
- 定义在类顶部或 constants.gd

示例：
const MAX_HEALTH := 100
const SPEED := 200.0
const DAMAGE_MULTIPLIER := 1.5


【枚举】

规则：
- 使用 PascalCase 名称
- 成员使用 UPPER_SNAKE_CASE

示例：
enum PlayerState {
    IDLE,
    WALKING,
    RUNNING,
    ATTACKING,
    SKILL_CASTING,
    HURT,
    DEAD,
}

enum SkillType {
    PASSIVE,
    ACTIVE_Q,
    ACTIVE_W,
    ACTIVE_E,
    ULTIMATE,
}
```

### 3.6 信号定义

```
【信号命名】

规则：
- 使用 snake_case
- 使用过去式或完成时态
- 动词 + 名词模式

常用模式：
- xxx_changed (值变化)
- xxx_started (开始)
- xxx_finished (结束)
- xxx_updated (更新)
- xxx_received (接收)
- xxx_sent (发送)

示例：
signal health_changed(new_health: int)
signal skill_used(skill_name: String)
signal enemy_killed(enemy: Enemy)
signal level_completed(level_id: int)
```

### 3.7 注释规范

```
【文件头注释】

## 文件：player.gd
## 描述：玩家角色控制脚本
## 作者：AI Developer
## 日期：2025-05-09
## 更新：
##   - 2025-05-09: 初始版本


【类注释】

## Player
## 玩家角色控制器
## 处理移动、攻击、技能等玩家交互


【方法注释】

## get_damage_multiplier()
## 获取伤害倍率
## 返回：float 当前伤害倍率


【代码注释】

# 确保生命值不会超过最大值
current_health = min(current_health, max_health)

# 检查是否有足够的能量释放技能
if current_energy >= skill_cost:
    cast_skill()
```

---

## 4. 命名规范

### 4.1 资源命名

```
【文件命名规范】

格式：[类型]_[名称]_[变体/状态].[扩展名]

组成：
- 类型前缀：角色类型、资源类型
- 名称：资源描述性名称
- 变体/状态：可选，状态或变体标识

示例：
┌─────────────────────────────────────────────────────────────┐
│ 角色精灵图                                                 │
├─────────────────────────────────────────────────────────────┤
│ player_listener_idle_00.png    # 聆听者待机帧0              │
│ player_listener_walk_00.png    # 聆听者行走帧0             │
│ player_listener_attack_00.png   # 聆听者攻击帧0             │
│ player_roarer_idle_00.png      # 喧嚣者待机帧0             │
│ player_silent_idle_00.png      # 沉默者待机帧0             │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ 敌人精灵图                                                 │
├─────────────────────────────────────────────────────────────┤
│ enemy_bat_idle_00.png          # 回响蝙蝠待机             │
│ enemy_crawler_walk_00.png      # 阴影爬行者行走           │
│ enemy_colossus_attack_00.png   # 回响巨人攻击             │
│ boss_warden_idle_00.png        # 回响守卒待机             │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ 环境资源                                                    │
├─────────────────────────────────────────────────────────────┤
│ tileset_forest_00.png           # 森林瓦片00               │
│ tile_floor_forest_00.png        # 森林地面瓦片00           │
│ bg_forest_layer1.png           # 森林背景层1               │
│ deco_tree_dead_00.png          # 枯树装饰00               │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ UI 资源                                                     │
├─────────────────────────────────────────────────────────────┤
│ icon_health_bar.png             # 生命条图标                │
│ icon_energy_bar.png            # 能量条图标                │
│ icon_skill_q.png               # 技能Q图标                 │
│ btn_play_normal.png            # 按钮-开始-正常            │
│ btn_play_hover.png             # 按钮-开始-悬停            │
│ panel_dialog_bg.png            # 对话框背景                │
└─────────────────────────────────────────────────────────────┘
```

### 4.2 场景命名

```
【场景文件命名】

格式：[类型]_[名称].tscn

示例：
┌─────────────────────────────────────────────────────────────┐
│ 核心场景                                                    │
├─────────────────────────────────────────────────────────────┤
│ core_main.tscn                     # 主场景                │
│ core_game.tscn                      # 游戏场景              │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ UI 场景                                                     │
├─────────────────────────────────────────────────────────────┤
│ ui_main_menu.tscn                  # 主菜单                 │
│ ui_pause_menu.tscn                # 暂停菜单               │
│ ui_settings_menu.tscn             # 设置菜单               │
│ ui_game_hud.tscn                  # 游戏HUD                │
│ ui_health_bar.tscn                # 生命条                 │
│ ui_skill_bar.tscn                 # 技能栏                 │
│ ui_dialog_box.tscn                 # 对话框                 │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ 角色场景                                                    │
├─────────────────────────────────────────────────────────────┤
│ char_player.tscn                   # 玩家角色               │
│ char_listener.tscn                 # 聆听者                 │
│ char_roarer.tscn                  # 喧嚣者                 │
│ char_silent.tscn                  # 沉默者                 │
│ char_npc_elina.tscn               # NPC艾琳娜              │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ 敌人场景                                                    │
├─────────────────────────────────────────────────────────────┤
│ enemy_bat.tscn                    # 回响蝙蝠               │
│ enemy_crawler.tscn               # 阴影爬行者             │
│ enemy_specter.tscn               # 旋律幽灵               │
│ enemy_colossus.tscn              # 回响巨人               │
│ enemy_boss_warden.tscn           # 回响守卒BOSS           │
│ enemy_boss_soundwave.tscn        # 颤音魔女BOSS           │
│ enemy_boss_void.tscn             # 深渊之心BOSS          │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ 关卡场景                                                    │
├─────────────────────────────────────────────────────────────┤
│ level_zone_forest.tscn             # 森林区域               │
│ level_zone_lava.tscn              # 熔岩区域               │
│ level_zone_deepsea.tscn           # 深海区域               │
│ level_zone_bone.tscn             # 骸骨区域              │
│ level_zone_abyss.tscn            # 深渊核心              │
│ level_room_combat_01.tscn        # 战斗房间01            │
│ level_room_boss.tscn             # BOSS房间              │
│ level_room_shop.tscn              # 商店房间              │
└─────────────────────────────────────────────────────────────┘
```

### 4.3 节点命名

```
【节点命名规范】

规则：
- 使用 PascalCase
- 以节点类型结尾
- 清晰表达用途

示例：
┌─────────────────────────────────────────────────────────────┐
│ 玩家节点树                                                  │
├─────────────────────────────────────────────────────────────┤
│ Player                              # 根节点                │
│ ├── Sprite                          # 精灵图                │
│ ├── AnimationPlayer                  # 动画播放器            │
│ ├── CollisionShape                   # 碰撞形状              │
│ ├── HitboxArea                      # 攻击判定区域          │
│ ├── HurtboxArea                     # 受击判定区域          │
│ ├── StateMachine                    # 状态机                │
│ │   ├── IdleState                   # 待机状态              │
│ │   ├── WalkState                   # 行走状态              │
│ │   ├── AttackState                 # 攻击状态              │
│ │   └── SkillState                  # 技能状态              │
│ └── Effects                         # 特效节点              │
│     ├── DamageNumberSpawner         # 伤害数字生成器        │
│     └── Particles                   # 粒子效果              │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ UI节点树                                                    │
├─────────────────────────────────────────────────────────────┤
│ GameHUD                             # 游戏HUD根节点         │
│ ├── HealthBar                       # 生命条                │
│ │   ├── Background                  # 背景                 │
│ │   ├── Fill                         # 填充                 │
│ │   └── Label                        # 数值标签              │
│ ├── EnergyBar                       # 能量条                │
│ ├── SkillBar                        # 技能栏                │
│ │   ├── SkillQ                       # 技能Q                │
│ │   ├── SkillW                       # 技能W                │
│ │   ├── SkillE                       # 技能E                │
│ │   └── SkillR                       # 技能R                │
│ ├── MiniMap                        # 小地图                │
│ ├── ZoneLabel                      # 区域标签              │
│ └── CurrencyDisplay                # 货币显示              │
└─────────────────────────────────────────────────────────────┘
```

---

## 5. 场景管理

### 5.1 场景加载策略

```
【加载策略】

1. 即时加载（游戏开始）
   - 主场景 (main.tscn)
   - UI 场景 (menus)
   - 玩家角色
   - 常驻资源

2. 延迟加载（按需）
   - 关卡场景
   - 敌人场景
   - 大型资源

3. 预加载（性能关键）
   - 敌人精灵图
   - 技能特效
   - 常用 UI
```

```gdscript
# 场景加载示例

# 方法1：直接加载（简单但阻塞）
var scene = load("res://scenes/enemies/enemy_bat.tscn")

# 方法2：预加载（启动时加载）
const ENEMY_BAT_SCENE = preload("res://scenes/enemies/enemy_bat.tscn")

# 方法3：异步加载（大型场景）
func load_level_async(path: String) -> void:
    var loader = ResourceLoader.load_threaded_request(path)
    # 显示加载画面
    while ResourceLoader.load_threaded_get_status(path) == ResourceLoader.THREAD_LOAD_LOADING:
        var progress = ResourceLoader.load_threaded_get_progress(path)
        update_loading_screen(progress)
        await get_tree().process_frame

    var scene = ResourceLoader.load_threaded_get(path)
    get_tree().change_scene_to_packed(scene)
```

### 5.2 场景切换

```
【场景切换流程】

┌─────────────────────────────────────────────────────────────┐
│                      场景切换                               │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. 暂停当前场景                                            │
│     ↓                                                       │
│  2. 播放退出动画（可选）                                    │
│     ↓                                                       │
│  3. 保存必要状态                                            │
│     ↓                                                       │
│  4. 加载新场景                                             │
│     ↓                                                       │
│  5. 恢复游戏状态                                           │
│     ↓                                                       │
│  6. 播放进入动画（可选）                                    │
│     ↓                                                       │
│  7. 恢复游戏                                                │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

```gdscript
# 场景切换示例

func switch_to_game() -> void:
    # 1. 保存状态
    SaveManager.save_game_state()

    # 2. 切换场景
    get_tree().change_scene_to_file("res://scenes/core/game.tscn")

    # 3. 连接信号
    var game = get_tree().current_scene
    if game.has_signal("game_started"):
        game.game_started.connect(_on_game_started)
```

### 5.3 持久化场景

```
【持久化对象】

某些节点需要在场景切换时保留：
- AudioManager（持续播放音乐）
- GameHUD（显示当前状态）
- 玩家角色（如果在场景间移动）

实现方式：
1. 将节点加入 autoload
2. 使用 `get_tree().root` 作为父节点
3. 标记为 process_always
```

---

## 6. 资源管理

### 6.1 资源导入设置

```
【图片资源】

推荐设置：
- 压缩模式：等效纹理（有损）
- HDR：关闭（除非需要高动态范围）
- Filter：Mipmaps（用于 3D）、Nearest（用于像素风 2D）
- Repeat：Disabled（UI）、Enabled（环境）
- Process：保持不变

像素艺术特殊设置：
- Filter：Nearest
- Generate Mipmaps：关闭
- Importer：Texture Import
```

```
【音频资源】

背景音乐 (BGM)：
- 格式：OGG Vorbis
- Loop：启用
- 压缩：有损

音效 (SFX)：
- 格式：OGG Vorbis 或 WAV
- Loop：关闭
- 压缩：有损
- 预加载：关键音效
```

```
【字体资源】

- 格式：TTF 或 OTF
- 准备多种字重
- 考虑中文字体支持
```

### 6.2 资源路径规范

```
【绝对路径】使用 res://

res://scenes/characters/player/player.tscn
res://assets/images/enemies/enemy_bat_idle_00.png
res://scripts/systems/inventory.gd

【不推荐】使用 user://（用户数据）

user://saves/save_01.sav  # 仅用于用户生成的数据
```

### 6.3 资源加载最佳实践

```
【推荐做法】

1. 预加载常量资源
   const TEXTURE = preload("res://path/to/texture.png")

2. 延迟加载大型资源
   var texture = load("res://path/to/large_texture.png")

3. 使用资源组管理
   - 将敌人、道具等加入组
   - 批量操作

4. 释放不需要的资源
   if resource:
       resource.unreference()
```

---

## 7. 核心系统设计

### 7.1 状态机系统

```
【状态机架构】

┌─────────────────────────────────────────────────────────────┐
│                    StateMachine                            │
├─────────────────────────────────────────────────────────────┤
│ - current_state: State                                      │
│ - states: Dictionary                                        │
│                                                             │
│ + add_state(name: String, state: State)                   │
│ + set_state(name: String)                                  │
│ + _physics_process(delta: float)                           │
└─────────────────────────────────────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────────┐
│                       State (基类)                          │
├─────────────────────────────────────────────────────────────┤
│ - state_machine: StateMachine                               │
│ - character: Node2D                                         │
│                                                             │
│ + enter()          # 进入状态                             │
│ + exit()           # 退出状态                             │
│ + process(delta)    # 每帧处理                            │
│ + physics_process(delta)  # 物理处理                     │
└─────────────────────────────────────────────────────────────┘
        ▲
        │
┌───────┴───────┬───────────────┐
▼               ▼               ▼
IdleState    WalkState     AttackState
```

```gdscript
# 状态机示例

class_name StateMachine
extends Node

signal state_changed(old_state, new_state)

@export var initial_state: State

var current_state: State
var states: Dictionary = {}


func _ready() -> void:
    for child in get_children():
        if child is State:
            states[child.name.to_lower()] = child
            child.state_machine = self

    if initial_state:
        current_state = initial_state
        current_state.enter()


func _physics_process(delta: float) -> void:
    if current_state:
        current_state.physics_process(delta)


func _process(delta: float) -> void:
    if current_state:
        current_state.process(delta)


func _unhandled_input(event: InputEvent) -> void:
    if current_state:
        current_state.handle_input(event)


func set_state(state_name: String) -> void:
    var new_state = states.get(state_name.to_lower())
    if new_state == null or new_state == current_state:
        return

    var old_state = current_state
    current_state.exit()
    current_state = new_state
    current_state.enter()
    state_changed.emit(old_state.name, new_state.name)
```

### 7.2 技能系统

```
【技能系统架构】

┌─────────────────────────────────────────────────────────────┐
│                      SkillSystem                            │
├─────────────────────────────────────────────────────────────┤
│ - skills: Array[Skill]                                     │
│ - cooldowns: Dictionary                                     │
│ - current_energy: float                                     │
│                                                             │
│ + add_skill(skill: Skill)                                   │
│ + remove_skill(skill_id: String)                           │
│ + use_skill(skill_id: String) -> bool                      │
│ + _update_cooldowns(delta)                                 │
│ + can_use_skill(skill_id: String) -> bool                  │
└─────────────────────────────────────────────────────────────┘
```

```gdscript
# 技能基类

class_name Skill
extends Node

signal skill_used
signal skill_ready
signal skill_cooldown_started
signal skill_cooldown_finished

@export var skill_name: String = "Skill"
@export var skill_icon: Texture2D
@export var description: String = ""

@export var energy_cost: float = 20.0
@export var cooldown: float = 3.0
@export var key: String = "Q"  # Q, W, E, R

var current_cooldown: float = 0.0
var is_ready: bool = true


func _ready() -> void:
    current_cooldown = 0.0
    is_ready = true


func _process(delta: float) -> void:
    if current_cooldown > 0:
        current_cooldown -= delta
        if current_cooldown <= 0:
            current_cooldown = 0.0
            is_ready = true
            skill_ready.emit()


func can_use(energy: float) -> bool:
    return is_ready and energy >= energy_cost


func use(caster: Node) -> bool:
    if not can_use(caster.energy):
        return false

    caster.energy -= energy_cost
    current_cooldown = cooldown
    is_ready = false
    skill_used.emit()
    skill_cooldown_started.emit(cooldown)

    _execute_skill(caster)
    return true


func _execute_skill(caster: Node) -> void:
    # 子类重写
    pass


func get_cooldown_percent() -> float:
    if cooldown <= 0:
        return 1.0
    return 1.0 - (current_cooldown / cooldown)
```

### 7.3 战斗系统

```
【战斗系统流程】

┌─────────────────────────────────────────────────────────────┐
│                      战斗流程                               │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  攻击方                      防守方                         │
│  ┌─────────┐                ┌─────────┐                   │
│  │ 技能/攻击│────伤害计算───→│ 受伤判定 │                   │
│  └─────────┘                └────┬────┘                   │
│                                  │                         │
│                         ┌────────▼────────┐              │
│                         │ 是否命中/闪避    │              │
│                         └────────┬────────┘              │
│                    命中 ←─────────┴─────────→ 闪避        │
│                    ↓                              ↓        │
│            ┌───────────────┐                  ┌──────────┐ │
│            │  伤害计算     │                  │ 触发闪避  │ │
│            │  状态效果     │                  │ 动画/特效 │ │
│            └───────────────┘                  └──────────┘ │
│                    ↓                                       │
│            ┌───────────────┐                               │
│            │ 更新血量      │                               │
│            │ 死亡判定      │                               │
│            └───────────────┘                               │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

```gdscript
# 伤害计算

class_name CombatSystem

static func calculate_damage(
    attacker: Node,
    defender: Node,
    base_damage: int,
    damage_type: int = DamageType.PHYSICAL
) -> Dictionary:

    var final_damage := base_damage

    # 1. 计算攻击加成
    var attack_power := attacker.get_attack()
    final_damage += attack_power

    # 2. 计算防御减免
    var defense := defender.get_defense()
    final_damage = max(1, final_damage - defense)

    # 3. 计算类型克制
    var type_modifier := _get_type_modifier(damage_type, defender.damage_resistance)
    final_damage = int(final_damage * type_modifier)

    # 4. 计算暴击
    var is_crit := _roll_crit(attacker.get_crit_chance())
    if is_crit:
        final_damage = int(final_damage * attacker.get_crit_multiplier())

    # 5. 随机波动 (±10%)
    var variance := randf_range(0.9, 1.1)
    final_damage = int(final_damage * variance)

    return {
        "damage": final_damage,
        "is_critical": is_crit,
        "type": damage_type,
    }


static func _get_type_modifier(damage_type: int, resistance: Dictionary) -> float:
    var resist := resistance.get(damage_type, 1.0)
    return resist


static func _roll_crit(crit_chance: float) -> bool:
    return randf() < crit_chance
```

### 7.4 存档系统

```
【存档数据结构】

{
    "version": "1.0.0",
    "timestamp": "2025-05-09T12:00:00Z",

    "player": {
        "name": "艾文",
        "class": "listener",
        "level": 5,
        "experience": 1250,
        "stats": {
            "health": 85,
            "max_health": 100,
            "energy": 60,
            "max_energy": 100,
        },
        "skills": ["q_1", "w_2", "e_1", "r_0"],
        "equipment": {
            "weapon": "staff_01",
            "armor": "robe_01",
            "accessory_1": null,
            "accessory_2": null,
        },
        "inventory": [
            {"id": "potion_health", "count": 3},
            {"id": "key_01", "count": 1},
        ],
    },

    "progression": {
        "current_zone": "forest",
        "current_room": 3,
        "rooms_cleared": ["forest_1", "forest_2"],
        "bosses_defeated": [],
        "achievements": ["first_kill", "first_zone"],
    },

    "permanent": {
        "echo_coins": 500,
        "unlocked_zones": ["forest"],
        "unlocked_characters": ["listener"],
        "permanent_buffs": ["health_10"],
    }
}
```

```gdscript
# 存档管理器

class_name SaveManager
extends Node

const SAVE_PATH := "user://saves/"
const SAVE_FILE := "save_%02d.json"
const CURRENT_VERSION := "1.0.0"

var current_save_slot: int = 1


func _ready() -> void:
    DirAccess.make_dir_recursive_absolute(SAVE_PATH)


func save_game(slot: int = current_save_slot) -> bool:
    var save_data := _collect_save_data()
    var file_path := SAVE_PATH + SAVE_FILE % slot

    var json_str := JSON.stringify(save_data, "\t")
    var file := FileAccess.open(file_path, FileAccess.WRITE)

    if file == null:
        push_error("Failed to save: %s" % FileAccess.get_open_error())
        return false

    file.store_string(json_str)
    file.close()
    return true


func load_game(slot: int = current_save_slot) -> Dictionary:
    var file_path := SAVE_PATH + SAVE_FILE % slot

    if not FileAccess.file_exists(file_path):
        return {}

    var file := FileAccess.open(file_path, FileAccess.READ)

    if file == null:
        push_error("Failed to load: %s" % FileAccess.get_open_error())
        return {}

    var json_str := file.get_as_text()
    file.close()

    var json := JSON.new()
    var parse_result := json.parse(json_str)

    if parse_result != OK:
        push_error("JSON parse error: %s" % json.get_error_message())
        return {}

    return json.data


func _collect_save_data() -> Dictionary:
    var game := get_tree().current_scene as Game
    if not game:
        return {}

    return {
        "version": CURRENT_VERSION,
        "timestamp": Time.get_datetime_string_from_system(),
        "player": game.player.get_save_data(),
        "progression": game.progression.get_save_data(),
        "permanent": PersistentData.get_save_data(),
    }


func has_save(slot: int) -> bool:
    return FileAccess.file_exists(SAVE_PATH + SAVE_FILE % slot)
```

---

## 8. 版本控制规范

### 8.1 分支策略

```
【分支模型】

┌─────────────────────────────────────────────────────────────┐
│                      分支策略                                │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  main ───────────────────────────────────────────────────→  │
│    ↑                        ↑                               │
│    │ merge                  │ merge                         │
│    │                        │                               │
│  develop ────────────────→ │                               │
│    ↑                        │                               │
│    │ feature/xxx            │ release/xxx                  │
│    │                        │                               │
│  feature/player_controller ──────────────────────────────→ │
│                                                             │
│  feature/combat_system ────────────────────────────────→   │
│                                                             │
│  feature/enemy_ai ────────────────────────────────────→     │
│                                                             │
└─────────────────────────────────────────────────────────────┘

【分支类型】

main:
  - 生产环境代码
  - 只接受 release 分支合并
  - 保护分支

develop:
  - 开发主分支
  - 所有 feature 分支合并到这里
  - 开发完成的功能

feature/*:
  - 功能开发分支
  - 从 develop 分出
  - 完成后合并回 develop
  - 命名：feature/功能名称

release/*:
  - 发布准备分支
  - 从 develop 分出
  - 修复版本问题
  - 合并到 main 和 develop

hotfix/*:
  - 紧急修复分支
  - 从 main 分出
  - 修复完成后合并回 main 和 develop
```

### 8.2 提交规范

```
【提交信息格式】

<type>(<scope>): <subject>

<body>

<footer>

【Type 类型】

feat:     新功能
fix:      修复bug
docs:     文档更新
style:    代码格式（不影响功能）
refactor: 重构（非新功能）
perf:     性能优化
test:     测试相关
chore:    构建/工具相关
ci:       CI 配置
revert:   回退

【示例】

feat(player): 添加玩家移动系统

- 实现 WASD 移动控制
- 添加转向跟随鼠标
- 添加冲刺功能

Closes #12

---

fix(combat): 修复伤害计算错误

- 防御力减免计算错误
- 暴击伤害未正确应用

Fixes #25

---

refactor(skills): 重构技能系统

- 提取技能基类
- 统一技能冷却管理
- 改善技能扩展性
```

### 8.3 Git Ignore

```
# Godot
.godot/
*.import
export/
export_presets.cfg

# 操作系统
.DS_Store
Thumbs.db

# IDE
.vscode/
.idea/
*.swp
*.swo

# 构建产物
build/
*.apk
*.exe
*.app
*.dmg

# 日志
*.log

# 临时文件
*.tmp
*.bak
*~

# 翻译文件（自动生成）
*.po~
*.pot
```

---

## 9. 开发工作流

### 9.1 开发流程

```
【功能开发流程】

1. 创建功能分支
   git checkout -b feature/新功能

2. 开发功能
   - 编写代码
   - 添加资源
   - 编写测试

3. 提交代码
   git add .
   git commit -m "feat(scope): 描述"

4. 推送到远程
   git push origin feature/新功能

5. 创建 Pull Request
   - 描述功能
   - 关联 Issues
   - 请求审查

6. 合并到 develop
   - 审查代码
   - 解决冲突
   - 合并分支

7. 删除功能分支
   git branch -d feature/新功能
```

### 9.2 代码审查

```
【审查清单】

功能正确性
□ 功能按预期工作
□ 边界条件处理正确
□ 错误处理完善

代码质量
□ 遵循编码规范
□ 命名清晰有意义
□ 注释充分（关键逻辑）
□ 无重复代码

性能
□ 无明显性能问题
□ 资源正确加载/卸载
□ 无内存泄漏

兼容性
□ 在目标平台正常运行
□ 输入设备正常工作

测试
□ 新功能有测试
□ 现有功能未破坏
```

### 9.3 发布流程

```
【发布检查清单】

发布前
□ 所有已知问题已记录
□ 功能完成度检查
□ 性能基准测试
□ 内存使用检查

发布
□ 创建 release 分支
□ 修复最后问题
□ 更新版本号
□ 合并到 main

发布后
□ 创建 GitHub Release
□ 更新下载链接
□ 通知用户
□ 监控反馈
```

---

## 附录

### A. 常用快捷命令

```bash
# 克隆仓库
git clone https://github.com/zzz1m/echo-abyss.git

# 创建功能分支
git checkout -b feature/新功能

# 切换分支
git checkout develop

# 查看状态
git status

# 提交
git add .
git commit -m "feat(scope): 描述"

# 推送
git push origin feature/新功能

# 合并（先切换到目标分支）
git checkout develop
git merge feature/新功能
```

### B. Godot 常用快捷键

```
编辑器
- Ctrl + S: 保存
- Ctrl + Shift + S: 另存为
- F5: 运行项目
- F6: 运行当前场景
- Ctrl + P: 快速打开文件

编辑
- Ctrl + C/V/X: 复制/粘贴/剪切
- Ctrl + D: 复制行
- Ctrl + Z: 撤销
- Ctrl + Shift + Z: 重做
- Ctrl + /: 注释/取消注释

搜索
- Ctrl + F: 查找
- Ctrl + Shift + F: 全局查找
- Ctrl + K: 查找选中词下一个

节点
- Ctrl + A: 添加节点
- Ctrl + R: 重命名
- Delete: 删除
```

### C. 参考资料

```
Godot 文档
- https://docs.godotengine.org/

GDScript 风格指南
- https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html

Git 最佳实践
- https://nvie.com/posts/a-successful-git-branching-model/
```

---

**文档版本：1.0**
**最后更新：2025年5月**
