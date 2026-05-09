extends Node

const GAME_TITLE := "回响深渊"
const GAME_VERSION := "0.1.0"
const GAME_VERSION_CODE := 1

const DEFAULT_RESOLUTION := Vector2i(1280, 720)

const ZONE_NAMES: Array[String] = [
    "forest",
    "lava",
    "deepsea",
    "bone",
    "abyss",
]

const ZONE_DISPLAY_NAMES: Dictionary = {
    "forest": "回响森林",
    "lava": "熔岩回响",
    "deepsea": "深海低语",
    "bone": "骸骨圣殿",
    "abyss": "深渊核心",
}

const ENEMY_TYPES: Array[String] = [
    "bat",
    "crawler",
    "specter",
]

const BOSS_TYPES: Dictionary = {
    "forest": "boss_warden",
    "lava": "boss_soundwave",
    "deepsea": "boss_shadow",
    "bone": "boss_void",
    "abyss": "boss_void",
}

const SAVE_SLOT_COUNT := 3

const MAX_INVENTORY_SLOTS := 20

const DEFAULT_PLAYER_STATS: Dictionary = {
    "max_health": 100,
    "max_energy": 100.0,
    "speed": 200.0,
    "attack": 10,
    "defense": 5,
    "crit_chance": 0.05,
    "crit_multiplier": 1.5,
}

const COMBAT_CONSTANTS: Dictionary = {
    "base_damage_variance": 0.1,
    "defense_reduction_cap": 0.8,
    "crit_damage_multiplier": 1.5,
    "status_effect_tick_rate": 1.0,
}
