#!/usr/bin/env python3
"""
回响深渊 - Echo Abyss
高质量视觉艺术作品生成
遵循 Resonant Void 设计哲学
"""

from PIL import Image, ImageDraw, ImageFont, ImageFilter
import math
import os

OUTPUT_DIR = "/workspace/canvas/artwork"

def hex_to_rgb(hex_color):
    """将十六进制颜色转换为RGB"""
    hex_color = hex_color.lstrip('#')
    return tuple(int(hex_color[i:i+2], 16) for i in (0, 2, 4))

def create_glowing_circle(draw, center, radius, color, glow_radius=50):
    """创建发光圆形效果"""
    for r in range(glow_radius, 0, -3):
        alpha = int(80 * (1 - r/glow_radius))
        draw.ellipse(
            [center[0] - r, center[1] - r, center[0] + r, center[1] + r],
            fill=(*color[:3], alpha)
        )
    draw.ellipse(
        [center[0] - radius, center[1] - radius, center[0] + radius, center[1] + radius],
        fill=color
    )

def draw_sound_waves(draw, center, max_rings=8, ring_spacing=40, color=(0, 200, 255)):
    """绘制声波效果"""
    for i in range(max_rings):
        radius = 30 + i * ring_spacing
        alpha = max(30, 200 - i * 25)
        draw.ellipse(
            [center[0] - radius, center[1] - radius, center[1] + radius, center[1] + radius],
            outline=(*color[:3], alpha),
            width=2
        )

def generate_main_poster():
    """生成主海报"""
    width, height = 2160, 3840

    # 深空背景
    img = Image.new('RGBA', (width, height), (5, 2, 15, 255))
    draw = ImageDraw.Draw(img)

    # 绘制背景星星
    import random
    random.seed(42)
    for _ in range(200):
        x = random.randint(0, width)
        y = random.randint(0, height)
        size = random.randint(1, 4)
        alpha = random.randint(50, 200)
        draw.ellipse([x, y, x + size, y + size], fill=(255, 255, 255, alpha))

    center_x, center_y = width // 2, height // 2 - 200

    # 绘制多层声波
    for layer in range(12):
        scale = 1 + layer * 0.15
        base_radius = 150 * scale

        for i in range(5):
            radius = base_radius + i * 25
            alpha = 180 - layer * 12 - i * 20
            alpha = max(20, alpha)

            draw.ellipse(
                [center_x - radius, center_y - radius,
                 center_x + radius, center_y + radius],
                outline=(0, 200 - layer * 10, 255 - layer * 15, alpha),
                width=2
            )

    # 中心能量核心
    for r in range(100, 0, -5):
        alpha = int(150 * (1 - r/100))
        draw.ellipse(
            [center_x - r, center_y - r, center_x + r, center_y + r],
            fill=(0, 180, 255, alpha)
        )
    draw.ellipse(
        [center_x - 40, center_y - 40, center_x + 40, center_y + 40],
        fill=(150, 230, 255)
    )

    # 标题文字
    try:
        title_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", 120)
        subtitle_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf", 48)
        tagline_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf", 28)
    except:
        title_font = ImageFont.load_default()
        subtitle_font = tagline_font = title_font

    # 阴影效果
    draw.text((center_x + 4, 800 + 4), "回 响 深 渊",
             font=title_font, fill=(0, 50, 100))
    draw.text((center_x, 800), "回 响 深 渊",
             font=title_font, fill=(0, 200, 255))

    draw.text((center_x + 3, 940 + 3), "ECHO ABYSS",
             font=subtitle_font, fill=(80, 80, 120))
    draw.text((center_x, 940), "ECHO ABYSS",
             font=subtitle_font, fill=(200, 200, 255))

    # 底部标语
    draw.text((center_x - 150, height - 300), "RESONANCE IS VISIBLE",
             font=tagline_font, fill=(150, 150, 200))
    draw.text((center_x - 120, height - 250), "VOID HAS MEMORY",
             font=tagline_font, fill=(150, 150, 200))

    # 版本信息
    draw.text((100, height - 100), "v0.1.0",
             font=tagline_font, fill=(100, 100, 140))

    os.makedirs(OUTPUT_DIR, exist_ok=True)
    img.save(f"{OUTPUT_DIR}/main_poster.png")
    print(f"Generated: {OUTPUT_DIR}/main_poster.png")

    return f"{OUTPUT_DIR}/main_poster.png"

def generate_character_showcase():
    """生成角色展示图"""
    width, height = 3240, 2160
    img = Image.new('RGBA', (width, height), (10, 5, 25, 255))
    draw = ImageDraw.Draw(img)

    characters = [
        {
            "name": "聆听者",
            "subtitle": "THE LISTENER",
            "desc": "聆听深渊之声",
            "x": 540,
            "color": (0, 150, 220),
            "bg_color": (20, 60, 100)
        },
        {
            "name": "喧嚣者",
            "subtitle": "THE ROARER",
            "desc": "释放原始怒吼",
            "x": 1620,
            "color": (220, 80, 50),
            "bg_color": (80, 30, 20)
        },
        {
            "name": "沉默者",
            "subtitle": "THE SILENT",
            "desc": "隐匿于暗影",
            "x": 2700,
            "color": (100, 60, 150),
            "bg_color": (40, 20, 60)
        }
    ]

    try:
        name_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", 72)
        sub_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf", 36)
        desc_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf", 24)
    except:
        name_font = sub_font = desc_font = ImageFont.load_default()

    for char in characters:
        cx, cy = char["x"], 900

        # 背景光晕
        for r in range(300, 0, -10):
            alpha = int(30 * (1 - r/300))
            draw.ellipse(
                [cx - r, cy - r, cx + r, cy + r],
                fill=(*char["bg_color"][:3], alpha)
            )

        # 角色轮廓
        for i in range(5):
            offset = 150 + i * 10
            alpha = 150 - i * 25
            draw.ellipse(
                [cx - offset, cy - offset * 1.5, cx + offset, cy + offset * 1.5],
                outline=(*char["color"][:3], alpha),
                width=3
            )

        # 声波效果
        for i in range(8):
            angle = i * 0.8
            r = 200 + i * 15
            x = cx + int(r * math.cos(angle - 1.5))
            y = cy + int(r * math.sin(angle - 1.5) * 0.6)
            draw.ellipse([x - 8, y - 8, x + 8, y + 8],
                        fill=(*char["color"][:3], 150 - i * 15))

        # 角色名称
        draw.text((cx - 100 + 3, 1300 + 3), char["name"],
                 font=name_font, fill=(0, 30, 60))
        draw.text((cx - 100, 1300), char["name"],
                 font=name_font, fill=char["color"])

        draw.text((cx - 100 + 2, 1400 + 2), char["subtitle"],
                 font=sub_font, fill=(60, 60, 80))
        draw.text((cx - 100, 1400), char["subtitle"],
                 font=sub_font, fill=(200, 200, 220))

        draw.text((cx - 80, 1500), char["desc"],
                 font=desc_font, fill=(150, 150, 170))

    img.save(f"{OUTPUT_DIR}/character_showcase.png")
    print(f"Generated: {OUTPUT_DIR}/character_showcase.png")

def generate_zone_gallery():
    """生成关卡画廊"""
    zones = [
        {"name": "回响森林", "subtitle": "FOREST", "color": (40, 100, 40), "bg": (10, 25, 10)},
        {"name": "熔岩回响", "subtitle": "LAVA", "color": (200, 80, 30), "bg": (50, 15, 5)},
        {"name": "深海低语", "subtitle": "DEEPSEA", "color": (30, 80, 180), "bg": (5, 15, 45)},
        {"name": "骸骨圣殿", "subtitle": "BONE", "color": (180, 170, 140), "bg": (45, 45, 35)},
        {"name": "深渊核心", "subtitle": "ABYSS", "color": (100, 50, 150), "bg": (15, 5, 30)},
    ]

    width, height = 5400, 2160
    img = Image.new('RGBA', (width, height), (10, 5, 25, 255))
    draw = ImageDraw.Draw(img)

    card_width, card_height = 1000, 1800
    padding = 60

    try:
        title_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", 48)
        sub_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf", 24)
    except:
        title_font = sub_font = ImageFont.load_default()

    for i, zone in enumerate(zones):
        x = padding + i * (card_width + padding)
        y = padding

        # 卡片背景
        for r in range(20, 0, -2):
            alpha = int(20 * (1 - r/20))
            draw.rectangle(
                [x - r, y - r, x + card_width + r, y + card_height + r],
                outline=(*zone["color"][:3], alpha)
            )

        # 主背景
        for py in range(card_height):
            ratio = py / card_height
            r = int(zone["bg"][0] * (1 - ratio * 0.5))
            g = int(zone["bg"][1] * (1 - ratio * 0.5))
            b = int(zone["bg"][2] * (1 - ratio * 0.5))
            for px in range(card_width):
                img.putpixel((x + px, y + py), (r, g, b, 255))

        # 声波圆环
        center_x = x + card_width // 2
        center_y = y + card_height // 3

        for ring in range(6):
            radius = 100 + ring * 50
            alpha = 150 - ring * 20
            draw.ellipse(
                [center_x - radius, center_y - radius,
                 center_x + radius, center_y + radius],
                outline=(*zone["color"][:3], alpha),
                width=2
            )

        # 中心点
        draw.ellipse(
            [center_x - 20, center_y - 20, center_x + 20, center_y + 20],
            fill=zone["color"]
        )

        # 区域名称
        draw.text((center_x - 120 + 2, y + card_height - 250 + 2),
                 zone["name"], font=title_font, fill=(0, 20, 40))
        draw.text((center_x - 120, y + card_height - 250),
                 zone["name"], font=title_font, fill=zone["color"])

        draw.text((center_x - 80 + 1, y + card_height - 180 + 1),
                 zone["subtitle"], font=sub_font, fill=(40, 40, 50))
        draw.text((center_x - 80, y + card_height - 180),
                 zone["subtitle"], font=sub_font, fill=(180, 180, 200))

    img.save(f"{OUTPUT_DIR}/zone_gallery.png")
    print(f"Generated: {OUTPUT_DIR}/zone_gallery.png")

def generate_pixel_art_tileset():
    """生成像素风格瓦片集"""
    tile_size = 32
    tiles_x, tiles_y = 8, 6
    width, height = tile_size * tiles_x, tile_size * tiles_y

    img = Image.new('RGBA', (width, height), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)

    colors = {
        'void': (15, 10, 25),
        'dark': (30, 25, 50),
        'accent': (0, 150, 200),
        'glow': (100, 200, 255),
        'dark_accent': (80, 50, 120),
    }

    # 生成不同类型的瓦片
    tile_types = [
        ('floor1', colors['void'], 'floor2', colors['dark']),
        ('floor3', colors['dark'], 'wall1', colors['dark_accent']),
        ('wall2', colors['dark_accent'], 'deco1', colors['accent']),
        ('deco2', colors['glow'], 'corner', colors['accent']),
    ]

    for ty in range(tiles_y):
        for tx in range(tiles_x):
            idx = ty * tiles_x + tx
            tile_type = tile_types[idx % len(tile_types)]
            x = tx * tile_size
            y = ty * tile_size

            # 基础填充
            draw.rectangle([x, y, x + tile_size, y + tile_size],
                          fill=tile_type[1] if idx % 2 == 0 else tile_type[3])

            # 边框效果
            if idx % 3 == 0:
                draw.rectangle([x, y, x + tile_size - 1, y + 2],
                             fill=colors['accent'])
                draw.rectangle([x, y, x + 2, y + tile_size - 1],
                             fill=colors['glow'])

            # 角落效果
            if idx % 5 == 0:
                draw.ellipse([x + 8, y + 8, x + 24, y + 24],
                           fill=colors['accent'])

    os.makedirs(f"{OUTPUT_DIR}/pixel_art", exist_ok=True)
    img.save(f"{OUTPUT_DIR}/pixel_art/tileset_base.png")
    print(f"Generated: {OUTPUT_DIR}/pixel_art/tileset_base.png")

def main():
    print("正在生成回响深渊艺术作品...")

    os.makedirs(OUTPUT_DIR, exist_ok=True)

    generate_main_poster()
    generate_character_showcase()
    generate_zone_gallery()
    generate_pixel_art_tileset()

    print("\n所有艺术作品生成完成！")
    print(f"输出目录: {OUTPUT_DIR}")

if __name__ == "__main__":
    main()
