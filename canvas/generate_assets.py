#!/usr/bin/env python3
"""
回响深渊 - Echo Abyss
游戏视觉素材生成器
"""

from PIL import Image, ImageDraw, ImageFilter, ImageFont
import math
import random
import os

OUTPUT_DIR = "/workspace/assets/images"

def create_gradient(width, height, color1, color2, vertical=True):
    """创建渐变背景"""
    img = Image.new('RGBA', (width, height))
    for i in range(height if vertical else width):
        ratio = i / (height - 1 if vertical else width - 1)
        r = int(color1[0] * (1 - ratio) + color2[0] * ratio)
        g = int(color1[1] * (1 - ratio) + color2[1] * ratio)
        b = int(color1[2] * (1 - ratio) + color2[2] * ratio)
        if vertical:
            for j in range(width):
                img.putpixel((j, i), (r, g, b, 255))
        else:
            for j in range(height):
                img.putpixel((i, j), (r, g, b, 255))
    return img

def draw_concentric_circles(draw, center, max_radius, colors, line_width=2):
    """绘制同心圆（声波效果）"""
    for i, radius in enumerate(range(20, max_radius, 30)):
        color = colors[i % len(colors)]
        alpha = 255 - int(255 * radius / max_radius)
        draw.ellipse(
            [center[0] - radius, center[1] - radius,
             center[0] + radius, center[1] + radius],
            outline=(*color[:3], max(50, alpha)),
            width=line_width
        )

def draw_sound_wave(draw, center, amplitude, frequency, length, color, thickness=2):
    """绘制正弦波"""
    points = []
    for x in range(int(length)):
        y = center[1] + amplitude * math.sin(2 * math.pi * frequency * x / length)
        points.append((center[0] - length//2 + x, y))
    for i in range(len(points) - 1):
        draw.line([points[i], points[i+1]], fill=color, width=thickness)

def create_glow_effect(img, center, radius, color, intensity=0.5):
    """创建发光效果"""
    overlay = Image.new('RGBA', img.size, (0, 0, 0, 0))
    draw = ImageDraw.Draw(overlay)
    for r in range(radius, 0, -5):
        alpha = int(50 * intensity * (1 - r/radius))
        draw.ellipse(
            [center[0] - r, center[1] - r, center[0] + r, center[1] + r],
            fill=(*color, alpha)
        )
    return Image.alpha_composite(img, overlay)

def generate_title_art():
    """生成标题画面"""
    width, height = 1280, 720

    # 深色渐变背景
    img = create_gradient(width, height, (5, 2, 15), (10, 5, 30))

    draw = ImageDraw.Draw(img)

    # 绘制同心圆声波
    center = (width // 2, height // 2)
    colors = [(0, 200, 255), (100, 50, 200), (0, 150, 200)]

    for layer in range(5):
        scale = 1 + layer * 0.3
        draw_concentric_circles(
            draw,
            center,
            int(400 * scale),
            colors,
            line_width=3
        )

    # 中心发光点
    img = create_glow_effect(img, center, 150, (0, 180, 255), 0.8)

    # 标题文字
    try:
        title_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", 80)
        subtitle_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf", 30)
    except:
        title_font = ImageFont.load_default()
        subtitle_font = ImageFont.load_default()

    # 绘制文字阴影
    shadow_offset = 3
    draw.text((width//2 + shadow_offset, 150 + shadow_offset),
               "回 响 深 渊", font=title_font, fill=(0, 50, 80))
    draw.text((width//2, 150), "回 响 深 渊", font=title_font, fill=(0, 200, 255))

    draw.text((width//2 + shadow_offset, 240 + shadow_offset),
               "ECHO ABYSS", font=subtitle_font, fill=(80, 80, 100))
    draw.text((width//2, 240), "ECHO ABYSS", font=subtitle_font, fill=(180, 180, 220))

    # 底部装饰线
    for i in range(20):
        x = width//2 - 300 + i * 30
        alpha = 100 + int(100 * math.sin(i * 0.3))
        draw.line([(x, 350), (x + 15, 350)], fill=(0, 150, 200, alpha), width=2)

    os.makedirs(f"{OUTPUT_DIR}/title", exist_ok=True)
    img.save(f"{OUTPUT_DIR}/title/title_art.png")
    print("Generated: title/title_art.png")

def generate_character_designs():
    """生成角色设计图"""
    characters = {
        "listener": {
            "name": "聆听者",
            "colors": [(0, 150, 200), (20, 100, 180), (10, 10, 30)],
            "features": "眼罩、耳机、纤细身形"
        },
        "roarer": {
            "name": "喧嚣者",
            "colors": [(200, 80, 50), (180, 60, 30), (30, 15, 10)],
            "features": "肌肉体型、战吼姿态、角"
        },
        "silent": {
            "name": "沉默者",
            "colors": [(80, 50, 120), (60, 30, 100), (15, 10, 25)],
            "features": "斗篷、匕首、幽灵形态"
        }
    }

    for char_id, char_data in characters.items():
        width, height = 512, 512
        img = create_gradient(width, height, char_data["colors"][2], char_data["colors"][1])

        draw = ImageDraw.Draw(img)

        # 绘制角色轮廓
        cx, cy = width // 2, height // 2

        # 身体
        draw.ellipse([cx - 80, cy - 120, cx + 80, cy + 180],
                     fill=char_data["colors"][0])
        draw.ellipse([cx - 60, cy - 100, cx + 60, cy + 160],
                     fill=char_data["colors"][1])

        # 发光效果
        img = create_glow_effect(img, (cx, cy - 50), 100, char_data["colors"][0], 0.6)

        # 声波装饰
        colors = [(255, 255, 255), char_data["colors"][0]]
        for i in range(3):
            offset = 200 + i * 40
            draw_concentric_circles(draw, (cx, cy - 50), offset, colors, line_width=1)

        # 名称
        try:
            name_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", 36)
            desc_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf", 18)
        except:
            name_font = ImageFont.load_default()
            desc_font = ImageFont.load_default()

        draw.text((cx - 50, height - 80), char_data["name"],
                 font=name_font, fill=(255, 255, 255))
        draw.text((cx - 60, height - 45), char_data["features"],
                 font=desc_font, fill=(200, 200, 200))

        os.makedirs(f"{OUTPUT_DIR}/characters/{char_id}", exist_ok=True)
        img.save(f"{OUTPUT_DIR}/characters/{char_id}/character_design.png")
        print(f"Generated: characters/{char_id}/character_design.png")

def generate_enemy_designs():
    """生成敌人设计图"""
    enemies = {
        "bat": {
            "name": "回响蝙蝠",
            "colors": [(180, 60, 60), (150, 40, 40), (30, 10, 10)],
            "shape": "wing"
        },
        "crawler": {
            "name": "阴影爬行者",
            "colors": [(80, 60, 100), (60, 40, 80), (20, 15, 25)],
            "shape": "spider"
        },
        "specter": {
            "name": "旋律幽灵",
            "colors": [(150, 100, 200), (120, 80, 180), (30, 20, 50)],
            "shape": "ghost"
        },
        "colossus": {
            "name": "回响巨人",
            "colors": [(150, 30, 30), (120, 20, 20), (40, 10, 5)],
            "shape": "large"
        }
    }

    for enemy_id, enemy_data in enemies.items():
        width, height = 512, 512
        img = create_gradient(width, height, enemy_data["colors"][2], enemy_data["colors"][1])

        draw = ImageDraw.Draw(img)
        cx, cy = width // 2, height // 2

        # 绘制敌人形状
        size = 150 if enemy_data["shape"] == "large" else 100

        draw.ellipse([cx - size, cy - size, cx + size, cy + size],
                     fill=enemy_data["colors"][0])

        # 眼睛
        eye_size = size // 4
        draw.ellipse([cx - 60, cy - 40, cx - 20, cy],
                     fill=(255, 100, 100))
        draw.ellipse([cx + 20, cy - 40, cx + 60, cy],
                     fill=(255, 100, 100))

        # 发光效果
        img = create_glow_effect(img, (cx, cy), size, enemy_data["colors"][0], 0.4)

        # 名称
        try:
            name_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", 32)
        except:
            name_font = ImageFont.load_default()

        draw.text((cx - 60, height - 60), enemy_data["name"],
                 font=name_font, fill=(255, 200, 200))

        os.makedirs(f"{OUTPUT_DIR}/enemies/{enemy_id}", exist_ok=True)
        img.save(f"{OUTPUT_DIR}/enemies/{enemy_id}/enemy_design.png")
        print(f"Generated: enemies/{enemy_id}/enemy_design.png")

def generate_boss_designs():
    """生成BOSS设计图"""
    bosses = {
        "warden": {
            "name": "回响守卒",
            "subtitle": "森林守护者",
            "colors": [(120, 20, 20), (80, 10, 10), (20, 5, 5)],
            "size": 200
        },
        "soundwave": {
            "name": "颤音魔女",
            "subtitle": "熔岩回响之主",
            "colors": [(200, 50, 200), (180, 30, 180), (50, 10, 50)],
            "size": 180
        },
        "void": {
            "name": "深渊之心",
            "subtitle": "终极BOSS",
            "colors": [(30, 10, 50), (20, 5, 40), (10, 0, 20)],
            "size": 220
        }
    }

    for boss_id, boss_data in bosses.items():
        width, height = 1024, 768
        img = create_gradient(width, height, boss_data["colors"][2], boss_data["colors"][1])

        draw = ImageDraw.Draw(img)
        cx, cy = width // 2, height // 2 - 50

        # BOSS主体 - 多层圆
        for i in range(5):
            offset = boss_data["size"] + i * 20
            alpha = 200 - i * 30
            draw.ellipse([cx - offset, cy - offset, cx + offset, cy + offset],
                         fill=(*boss_data["colors"][0], alpha))

        # 中心核心
        img = create_glow_effect(img, (cx, cy), boss_data["size"], boss_data["colors"][0], 1.0)

        # 声波装饰
        for i in range(8):
            angle = i * math.pi / 4
            r = boss_data["size"] + 50
            x = cx + int(r * math.cos(angle))
            y = cy + int(r * math.sin(angle))
            draw.ellipse([x - 15, y - 15, x + 15, y + 15],
                        fill=boss_data["colors"][0])

        # BOSS名称
        try:
            name_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", 56)
            sub_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf", 28)
        except:
            name_font = ImageFont.load_default()
            sub_font = ImageFont.load_default()

        draw.text((cx - 120, height - 150), boss_data["name"],
                 font=name_font, fill=(255, 255, 255))
        draw.text((cx - 80, height - 90), boss_data["subtitle"],
                 font=sub_font, fill=(200, 180, 180))

        os.makedirs(f"{OUTPUT_DIR}/bosses/{boss_id}", exist_ok=True)
        img.save(f"{OUTPUT_DIR}/bosses/{boss_id}/boss_design.png")
        print(f"Generated: bosses/{boss_id}/boss_design.png")

def generate_zone_backgrounds():
    """生成关卡背景"""
    zones = {
        "forest": {
            "name": "回响森林",
            "colors": [(15, 30, 15), (10, 20, 10), (5, 10, 5)],
            "features": "发光的蘑菇、枯树、声波藤蔓"
        },
        "lava": {
            "name": "熔岩回响",
            "colors": [(50, 15, 5), (40, 10, 2), (20, 5, 0)],
            "features": "流动的岩浆、火焰、烟尘"
        },
        "deepsea": {
            "name": "深海低语",
            "colors": [(5, 15, 40), (2, 10, 30), (0, 5, 20)],
            "features": "发光水母、声波水波、珊瑚"
        },
        "bone": {
            "name": "骸骨圣殿",
            "colors": [(40, 40, 30), (30, 30, 20), (20, 20, 15)],
            "features": "骨头装饰、幽灵、墓碑"
        },
        "abyss": {
            "name": "深渊核心",
            "colors": [(5, 0, 15), (3, 0, 10), (0, 0, 5)],
            "features": "虚空能量、星光、混沌"
        }
    }

    for zone_id, zone_data in zones.items():
        width, height = 1280, 720

        # 多层渐变
        img = Image.new('RGBA', (width, height))
        for y in range(height):
            ratio = y / height
            r = int(zone_data["colors"][0][0] * (1 - ratio) + zone_data["colors"][1][0] * ratio)
            g = int(zone_data["colors"][0][1] * (1 - ratio) + zone_data["colors"][1][1] * ratio)
            b = int(zone_data["colors"][0][2] * (1 - ratio) + zone_data["colors"][1][2] * ratio)
            for x in range(width):
                img.putpixel((x, y), (r, g, b, 255))

        draw = ImageDraw.Draw(img)

        # 绘制背景装饰元素
        for i in range(30):
            x = random.randint(0, width)
            y = random.randint(0, height)
            size = random.randint(5, 20)
            alpha = random.randint(20, 80)
            draw.ellipse([x, y, x + size, y + size],
                        fill=(255, 255, 255, alpha))

        # 声波效果线条
        for i in range(5):
            cx = width // 2 + (i - 2) * 200
            draw_concentric_circles(
                draw,
                (cx, height // 2),
                100,
                [(255, 255, 255)],
                line_width=1
            )

        # 区域名称
        try:
            name_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", 48)
            desc_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf", 20)
        except:
            name_font = ImageFont.load_default()
            desc_font = ImageFont.load_default()

        draw.text((width - 350, 50), zone_data["name"],
                 font=name_font, fill=(255, 255, 255))
        draw.text((width - 300, 110), zone_data["features"],
                 font=desc_font, fill=(180, 180, 180))

        os.makedirs(f"{OUTPUT_DIR}/environments/{zone_id}", exist_ok=True)
        img.save(f"{OUTPUT_DIR}/environments/{zone_id}/zone_bg.png")
        print(f"Generated: environments/{zone_id}/zone_bg.png")

def generate_ui_elements():
    """生成UI元素"""
    # 生命条
    width, height = 200, 30
    img = Image.new('RGBA', (width, height))

    draw = ImageDraw.Draw(img)

    # 背景
    draw.rectangle([0, 0, width - 1, height - 1], fill=(50, 50, 50))

    # 填充
    draw.rectangle([2, 2, int((width - 4) * 0.8), height - 3], fill=(200, 50, 50))

    # 边框
    draw.rectangle([0, 0, width - 1, height - 1], outline=(100, 100, 100), width=2)

    os.makedirs(f"{OUTPUT_DIR}/ui/bars", exist_ok=True)
    img.save(f"{OUTPUT_DIR}/ui/bars/health_bar.png")
    print("Generated: ui/bars/health_bar.png")

    # 能量条
    draw.rectangle([0, 0, width - 1, height - 1], fill=(50, 50, 50))
    draw.rectangle([2, 2, int((width - 4) * 0.6), height - 3], fill=(50, 150, 255))
    draw.rectangle([0, 0, width - 1, height - 1], outline=(100, 100, 100), width=2)

    img.save(f"{OUTPUT_DIR}/ui/bars/energy_bar.png")
    print("Generated: ui/bars/energy_bar.png")

    # 技能图标背景
    size = 64
    img = Image.new('RGBA', (size, size))

    draw = ImageDraw.Draw(img)

    # 圆形背景
    draw.ellipse([0, 0, size - 1, size - 1], fill=(30, 30, 50))
    draw.ellipse([0, 0, size - 1, size - 1], outline=(80, 80, 120), width=2)

    # 中心圆点
    draw.ellipse([size//4, size//4, size*3//4, size*3//4], fill=(0, 150, 255))

    img.save(f"{OUTPUT_DIR}/ui/icons/skill_bg.png")
    print("Generated: ui/icons/skill_bg.png")

    # 按钮背景
    width, height = 200, 60
    img = Image.new('RGBA', (width, height))

    draw = ImageDraw.Draw(img)

    # 圆角矩形
    draw.rectangle([5, 0, width - 6, height - 1], fill=(60, 60, 80))
    draw.rectangle([0, 5, width - 1, height - 6], fill=(60, 60, 80))

    # 边框
    draw.rectangle([0, 0, width - 1, height - 1], outline=(100, 100, 140), width=2)

    # 文字提示
    try:
        btn_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf", 20)
    except:
        btn_font = ImageFont.load_default()

    draw.text((width//2 - 40, height//2 - 10), "开始游戏",
             font=btn_font, fill=(255, 255, 255))

    os.makedirs(f"{OUTPUT_DIR}/ui/buttons", exist_ok=True)
    img.save(f"{OUTPUT_DIR}/ui/buttons/button_default.png")
    print("Generated: ui/buttons/button_default.png")

def main():
    print("开始生成回响深渊游戏素材...")

    os.makedirs(OUTPUT_DIR, exist_ok=True)

    generate_title_art()
    generate_character_designs()
    generate_enemy_designs()
    generate_boss_designs()
    generate_zone_backgrounds()
    generate_ui_elements()

    print("\n所有素材生成完成！")

if __name__ == "__main__":
    main()
