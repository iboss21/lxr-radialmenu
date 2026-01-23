# 🐺 The Land of Wolves - UI Design Documentation

```
████████╗██╗     ██╗    ██╗     █████╗ ███╗   ██╗██╗███╗   ███╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
╚══██╔══╝██║     ██║    ██║    ██╔══██╗████╗  ██║██║████╗ ████║██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
   ██║   ██║     ██║ █╗ ██║    ███████║██╔██╗ ██║██║██╔████╔██║███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
   ██║   ██║     ██║███╗██║    ██╔══██║██║╚██╗██║██║██║╚██╔╝██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
   ██║   ███████╗╚███╔███╔╝    ██║  ██║██║ ╚████║██║██║ ╚═╝ ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
   ╚═╝   ╚══════╝ ╚══╝╚══╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
```

## 1899 Western-Themed UI Design

### Design Philosophy

The UI is designed to feel like **authentic 1899 equipment**, not modern software:
- Physical materials (leather, parchment, brass)
- Period-appropriate craftsmanship
- Weathered, aged textures
- No modern design language
- Cinematic Red Dead Redemption 2 inspired

---

## Color Palette

### Primary Colors (1899 Western)
```css
--parchment-bg: #F5E6D3        /* Aged paper background */
--parchment-dark: #E8D4B8      /* Darker parchment edges */
--leather-brown: #3E2723        /* Rich leather panels */
--leather-dark: #2C1810         /* Deep leather shadow */
--brass-gold: #B8860B           /* Brass trim & accents */
--brass-shine: #DAA520          /* Shining brass highlights */
--copper: #8B4513               /* Copper details */
--aged-ink: #2C1810             /* Written text color */
--warm-glow: #FAEBD7            /* Candlelight warmth */
```

### Theme Variations

#### 🐺 Wolves Theme (Default)
- Background: Dark with subtle texture
- Primary: Saddle Brown (#8B4513)
- Hover: Peru / Golden Hour (#CD853F)
- Text: Wheat (#F5DEB3)
- Icon: Burlywood (#DEB887)

#### 🥃 Saloon Theme
- Background: Warm wooden tones
- Primary: Sienna / Saloon Wood (#A0522D)
- Hover: Goldenrod / Whiskey (#DAA520)
- Text: Antique White (#FAEBD7)
- Icon: Chocolate (#D2691E)

#### 🌵 Frontier Theme
- Background: Olive with desert tones
- Primary: Dark Olive Green (#556B2F)
- Hover: Olive Drab (#6B8E23)
- Text: Khaki (#F0E68C)
- Icon: Dark Khaki (#BDB76B)

---

## Typography

### Fonts
- **Titles**: 'Cinzel' (serif) - Elegant, engraved feel
- **Body**: 'Crimson Text' (serif) - Readable, period-appropriate
- **Letter Spacing**: Wide for titles (2-3px), normal for body
- **Text Shadow**: Subtle for depth, no harsh shadows

---

## UI Components

### 1. Settings Container
- **Material**: Aged parchment with leather border
- **Border**: 8px leather + 3px brass trim
- **Shadow**: Multi-layered (depth + ambient)
- **Texture**: Subtle paper grain overlay
- **Size**: 90vw x 85vh (responsive)

### 2. Header Section
- **Background**: Gradient leather (dark to brown)
- **Border Bottom**: 4px brass with shine effect
- **Elements**:
  - Left: Title badge (parchment with brass frame)
  - Right: Character badge (circular portrait + info)

### 3. Character Profile Badge
- **Shape**: Rounded pill (circular portrait + text)
- **Portrait Frame**: 60px circle with brass border
- **Frame Style**: Like an old locket or cameo
- **Ornament**: Small brass badge on frame
- **Info**: Character name + ID number

### 4. Sidebar Navigation
- **Width**: 200px
- **Background**: Leather gradient
- **Tabs**: Parchment panels with:
  - Brass rivets (8px circles)
  - Left copper accent border (6px)
  - Hover: Slides right, shadow grows
  - Active: Golden brass background, larger shadow

### 5. Main Panel
- **Background**: Parchment with subtle gradient
- **Scrollbar**: Brass slider on leather track
- **Content**: Cards with brass borders

### 6. Setting Rows
- **Background**: Semi-transparent white overlay
- **Border**: 3px brass with leather outline
- **Hover**: Brighter, larger shadow
- **Layout**: Label left, control right

### 7. Form Controls

#### Select Dropdown (Western)
- **Background**: Warm parchment gradient
- **Border**: 3px brass
- **Arrow**: Custom SVG (brass colored)
- **Focus**: Glowing brass border

#### Toggle Switch
- **Track**: Leather background with brass border
- **Knob**: Brass sphere (20px)
- **Active**: Slides right, golden track
- **Shadow**: Inset for track, outer for knob

#### Radio Buttons
- **Outer**: 20px brass circle
- **Inner**: 10px brass dot (when checked)
- **Glow**: Subtle golden glow when active

### 8. Commands List (Customize Tab)
- **Item Style**: Parchment strips with brass border
- **Left Border**: 5px copper accent
- **Drag Handle**: Rope knot icon (⋮⋮)
- **Delete Button**: Circular brass button with X
- **Hover**: Slides right, shadow grows

### 9. Live Preview Panel
- **Background**: Leather gradient
- **Border Left**: 4px brass separator
- **Header**: Brass text with glow effect
- **Content**: Centered radial preview

### 10. Radial Preview
- **Center**: 80px brass-bordered circle
- **Badge Icon**: Rotating star (⭐)
- **Items**: 60px circles around center
- **Layout**: Compass/badge wheel arrangement
- **Animation**: Staggered appear effect

### 11. Close Button
- **Position**: Top-right corner
- **Shape**: 40px circular brass button
- **Icon**: X symbol in warm color
- **Hover**: Rotates 90°, scales up, red tint

---

## Visual Effects

### 1. Dust Particles
- Floating overlay with subtle animation
- Opacity: 0.3-0.5
- Movement: Gentle up/down float
- Color: Golden/brass tint

### 2. Film Grain
- Fixed overlay at 5% opacity
- Creates vintage photograph feel
- Non-intrusive texture

### 3. Paper Texture
- Repeating subtle line pattern
- 2px grid for aged paper look
- 30% opacity

### 4. Shadows
- **Component Shadows**: Multi-layered for depth
- **Text Shadows**: Light for readability
- **Inset Shadows**: For depth in inputs

### 5. Animations
```css
/* Fade in */
@keyframes fadeIn {
    from: opacity 0, translateY(10px)
    to: opacity 1, translateY(0)
}

/* Badge rotation */
@keyframes rotateBadge {
    from: rotate(0deg)
    to: rotate(360deg)
}

/* Dust float */
@keyframes dustFloat {
    0%, 100%: translateY(0)
    50%: translateY(-10px)
}
```

---

## Period-Accurate Labels (1899 Conversion)

| Modern Term | 1899 Western Term | Icon |
|-------------|-------------------|------|
| Settings | Ledger | 📜 |
| Phone | Telegraph / Letters | 📨 |
| Inventory | Saddlebags | 🎒 |
| Clothes | Wardrobe | 🤠 |
| Emotes | Gestures | 🎭 |
| Wallet | Money Pouch | 💰 |
| Job | Trade | ⚒️ |
| Vehicle | Horse / Wagon | 🐴 |

---

## Interaction Design

### Hover States
- Scale: 1.05-1.15
- Translation: 5-8px (depth effect)
- Shadow: Grows larger
- Background: Lightens or changes color
- Transition: 0.3s ease

### Active States
- Brass golden background
- Larger shadow
- Pushed-in appearance (for buttons)
- Color shift to indicate selection

### Disabled States
- Reduced opacity (0.5)
- Grayscale filter
- No hover effects
- Cursor: not-allowed

---

## Responsive Design

### Breakpoints
```css
@media (max-width: 1200px) {
    Container: 95vw x 90vh
    Preview Panel: 300px width
}
```

### Mobile Considerations
- Touch-friendly hit areas (min 44px)
- Larger text for readability
- Simplified animations
- Stack layout for small screens

---

## Accessibility

- **Contrast**: High contrast between text and background
- **Focus States**: Clear visual indicators
- **Keyboard Navigation**: Tab through all interactive elements
- **Screen Reader**: Semantic HTML with ARIA labels
- **Color Blindness**: Not relying solely on color

---

## Performance

- **CSS Animations**: Hardware accelerated (transform, opacity)
- **Image Optimization**: SVG for icons
- **Font Loading**: Preload critical fonts
- **Lazy Loading**: Images load as needed
- **Minimal JS**: Most effects in CSS

---

## Branding Integration

### Location Placement
1. **Header**: Main title with wolf emoji
2. **Footer**: "iBoss | www.wolves.land"
3. **Character Badge**: Subtle integration
4. **Code Comments**: ASCII art branding

### Consistency
- All files use TLW ANIMATIONS ASCII format
- Website (www.wolves.land) visible in multiple places
- iBoss credited as author
- Western theme maintained throughout

---

## Design Inspirations

- **Red Dead Redemption 2**: Menu aesthetics
- **1899 Western Era**: Authentic materials
- **Vintage Photographs**: Sepia tones, grain
- **Western Wanted Posters**: Typography style
- **Old West Saloons**: Wood and brass details
- **Leather-Bound Journals**: Navigation tabs
- **Compass & Sheriff Badges**: Radial layout

---

## Future Enhancements

1. **Sound Design**: Period-appropriate audio
2. **More Themes**: Season-specific variants
3. **Animated Transitions**: Page transitions
4. **Custom Icons**: Hand-drawn western icons
5. **Weather Effects**: Dynamic backgrounds
6. **Time of Day**: Lighting changes

---

© 2026 iBoss | The Land of Wolves | www.wolves.land
