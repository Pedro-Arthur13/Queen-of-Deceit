// Posição inicial do texto
audio_stop_all()
// Posição inicial do texto
y_offset = room_height;

// Velocidade de rolagem
scroll_speed = 0.8;

// Lista dos créditos
creditos = [
    ["Queen of Deceit", "grande"],
    "",
    ["Desenvolvido por:", "normal"],
    "Pedro Arthur",
    "Emanuel",
    "",
    ["Design de Som:", "normal"],
    "Tarcísio",
    "",
    ["Arte:", "normal"],
    "Eduardo",
    "Miguel",
    "",
    ["Agradecimento Especial:", "pequeno"],
    "Professor Afonso Serafim",
    "Por tornar este projeto possível.",
    "",
    ["Assets Utilizados:", "menor"],
    ["Fantasy RPG Soundtrack Music por alkakrab", "menor"],
    ["Free Effect and Bullet 16x16 por BDragon1727", "menor"],
    ["Fantasy RPG Chests 32x32 px for RPG Maker por Francisco Téllez", "menor"],
    ["Free City Trader Character Pixel Sprites por Free Game Assets", "menor"],
    ["Elemental Staffs/Wands - Sprite - Pixel por Arydian.G7", "menor"],
    ["Five Free Pixel Explosions por unTied Games", "menor"],
    "",
    ["Obrigado por jogar!", "normal"]
];

// Fonte personalizada (exemplo)
font_grande = font_add("Arial", 48, false, false, 32, 128);
font_normal = font_add("Arial", 24, false, false, 32, 128);
font_pequeno = font_add("Arial", 20, false, false, 32, 128);
font_menor = font_add("Arial", 10, false, false, 32, 128);

audio_play_sound(Saloon, 1, true);
