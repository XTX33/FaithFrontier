# Daily Verse Sanctuary - Visual Design Guide

## 🎨 Design Elements Reference

### Color Palette

```css
--sanctuary-gold:           #b8860b  /* Dark goldenrod - borders, accents */
--sanctuary-gold-light:     #daa520  /* Goldenrod - highlights */
--sanctuary-gold-dark:      #8b6914  /* Darker gold - text, bullets */
--sanctuary-burgundy:       #800020  /* Deep burgundy - headings */
--sanctuary-burgundy-light: #a0203c  /* Lighter burgundy - hover states */
--sanctuary-stone:          #e8e4d9  /* Stone gray - backgrounds */
--sanctuary-parchment:      #f5f1e3  /* Cream parchment - base */
--sanctuary-ink:            #2c1810  /* Deep brown - body text */
--sanctuary-emerald:        #10563a  /* Deep emerald - links, refs */
--sanctuary-emerald-light:  #106d4a  /* Lighter emerald - hover */
```

### Typography

**Primary Font Family**: `'Georgia', 'Garamond', serif`
- Headings: Bold 700-900 weight
- Body: Regular with italic for emphasis
- Scripture quotes: 1.25rem, italic, serif

**Letter Spacing**:
- Titles: 0.02-0.03em (slightly open)
- Labels: 0.05-0.12em (uppercase tracking)

### Sacred Symbols Used

| Symbol | Unicode | Usage |
|--------|---------|-------|
| ✠ | U+2720 | Maltese Cross - scripture watermark |
| ✞ | U+271E | Latin Cross - featured card decoration |
| ◆ | U+25C6 | Black Diamond - list bullets |
| ❦ | U+2766 | Floral Heart - card corner ornament |
| " " | U+201C/D | Curly quotes - blockquotes |

### Border Styles

**Double Border** (Featured elements):
```css
border: 3px double var(--sanctuary-gold);
```

**Single Border** (Standard elements):
```css
border: 2px solid var(--sanctuary-gold);
```

**Decorative Underline** (Section dividers):
```css
border-bottom: 2px solid var(--sanctuary-gold-light);
```

### Shadow Layers

**Card Elevation**:
```css
box-shadow: 
  0 4px 12px rgba(139, 105, 20, 0.15),    /* Outer shadow - depth */
  inset 0 1px 2px rgba(255, 255, 255, 0.9); /* Inner glow - dimension */
```

**Hover State**:
```css
box-shadow: 
  0 8px 24px rgba(139, 105, 20, 0.25),    /* Deeper shadow */
  inset 0 1px 2px rgba(255, 255, 255, 0.9);
```

### Decorative Patterns

**Corner Flourishes** (Radial gradients):
```css
background-image: 
  radial-gradient(circle, transparent 30%, gold 30%, gold 32%, transparent 32%),
  radial-gradient(circle, transparent 45%, gold 45%, gold 47%, transparent 47%),
  repeating-conic-gradient(from 0deg, 
    transparent 0deg, transparent 15deg,
    gold 15deg, gold 30deg);
```

**Parchment Texture** (Subtle lines):
```css
background-image: 
  repeating-linear-gradient(
    0deg,
    transparent,
    transparent 2px,
    rgba(184, 134, 11, 0.02) 2px,
    rgba(184, 134, 11, 0.02) 4px
  );
```

### Icon System

Using **Feather Icons** (MIT License):
- Book icon for scripture chamber header
- Layers icon for translations
- Crosshair icon for ancient manuscripts
- Users icon for church fathers
- Type icon for original languages
- Plus in circle for Christological witnesses

### Layout Grid

**Desktop** (2-3 columns):
```css
grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
gap: 1.5rem;
```

**Mobile** (1 column):
```css
grid-template-columns: 1fr;
gap: 1rem;
```

**Featured Card** (Full width):
```css
grid-column: 1 / -1;  /* Span all columns */
```

### Interactive States

**Link Hover** (Version links):
```css
/* Default */
color: var(--sanctuary-emerald);
border-bottom: 1px dotted var(--sanctuary-emerald-light);

/* Hover */
background: var(--sanctuary-emerald);
color: white;
border-radius: 3px;
```

**Card Hover**:
```css
transform: translateY(-4px);  /* Lift effect */
box-shadow: 0 8px 24px rgba(139, 105, 20, 0.25);
```

### Spacing System

**Padding**:
- Container: 2.5rem
- Cards: 1.5-2rem
- Inline elements: 0.5-0.75rem

**Margins**:
- Section gaps: 2-2.5rem
- Paragraph spacing: 1rem
- List items: 0.65rem

**Gaps**:
- Grid: 1.5rem (desktop), 1rem (mobile)
- Flex: 0.75rem

### Responsive Breakpoints

```css
@media (max-width: 768px) {
  /* Tablet and mobile */
  - Reduce padding
  - Single column grid
  - Smaller typography
}
```

### Accessibility Features

**Reduced Motion**:
```css
@media (prefers-reduced-motion: reduce) {
  transition: none;
  transform: none;
}
```

**High Contrast**:
```css
@media (prefers-contrast: high) {
  border: 3px solid currentColor;
}
```

**Focus States**:
```css
:focus-visible {
  outline: 3px solid var(--sanctuary-emerald);
  outline-offset: 2px;
}
```

### Animation Timings

**Transitions**:
- Links: `0.2s ease`
- Cards: `0.3s ease`
- Opacity: `250ms ease`

**Transform Origin**:
- Hover lifts: `center bottom`

---

## 📐 Layout Structure

```
daily-verse-sanctuary (main container)
├── sanctuary-inner (content wrapper)
│   ├── scripture-chamber (daily verse block)
│   │   ├── chamber-header
│   │   │   ├── chamber-icon
│   │   │   └── chamber-title
│   │   └── scripture-content
│   │       ├── blockquote (dv-text)
│   │       ├── cite (dv-ref) + version links
│   │       └── p (dv-note)
│   └── biblical-resources
│       ├── resources-title + intro
│       ├── resources-grid
│       │   ├── resource-card (Primary Translations)
│       │   ├── resource-card (Deuterocanonical)
│       │   ├── resource-card (Ancient Manuscripts)
│       │   ├── resource-card--featured (Christological)
│       │   ├── resource-card (Church Fathers)
│       │   └── resource-card (Original Languages)
│       └── resources-footer (disclaimer)
```

---

## 🎭 Visual Hierarchy

1. **Primary Focus**: Daily Scripture text (largest, centered, quoted)
2. **Secondary**: Bible version links (prominent, interactive)
3. **Tertiary**: Resource categories (clear headings with icons)
4. **Supporting**: Individual resource links (clean list format)
5. **Context**: Disclaimer footer (smaller, centered)

---

## 🦁 Heraldic & Symbolic References

**Lions** (implied in gold/burgundy royal palette):
- Symbol of Judah, Christ the Lion of Judah
- Royal authority and divine kingship

**Cross** (✠ ✞):
- Central to Christian faith
- Watermark and decorative element

**Flowers** (❦):
- Medieval manuscript illumination tradition
- Beauty and divine creation

**Geometry**:
- Radial patterns = divine perfection
- Grid systems = order and harmony
- Golden ratio considerations in spacing

**Masonry**:
- Stone/parchment textures
- Layered borders = cathedral walls
- Inset shadows = carved inscriptions

---

## 🖼️ Design Inspirations

1. **Book of Kells** - Celtic illuminated Gospel manuscript
2. **Gutenberg Bible** - First printed Bible, Gothic typeface
3. **Notre-Dame Rose Windows** - Radial sacred geometry
4. **Westminster Abbey** - Gothic architectural details
5. **Dead Sea Scrolls** - Ancient parchment aesthetic
6. **Medieval Bestiaries** - Illuminated animal symbols
7. **Lindisfarne Gospels** - Insular Christian art

---

## 📱 Platform Support

**Browsers**:
✅ Chrome/Edge (Chromium)
✅ Firefox
✅ Safari (iOS/macOS)
✅ Mobile browsers (responsive grid)

**Devices**:
✅ Desktop (1920px+)
✅ Laptop (1366-1920px)
✅ Tablet (768-1366px)
✅ Mobile (320-768px)

**Print**:
✅ Clean borders
✅ No decorative elements
✅ Underlined links

---

## 🔧 Customization Options

To adjust colors:
```css
:root {
  --sanctuary-gold: #your-color;
  /* etc. */
}
```

To change fonts:
```css
.chamber-title,
.resources-title,
.scripture-content blockquote {
  font-family: 'Your Font', serif;
}
```

To modify spacing:
```css
.sanctuary-inner {
  padding: 3rem; /* Increase spacing */
}
```

---

## 🙏 Theological Design Intent

Every design choice reflects **reverence for Scripture**:

- **Gold** = Divine glory and kingship
- **Burgundy** = Christ's blood, sacrifice
- **Emerald** = Eternal life, hope
- **Parchment** = Ancient, enduring Word
- **Serif fonts** = Classical, scholarly tradition
- **Ornate borders** = Sacred space, set apart
- **Symbols** = Visual theology, non-verbal witness

The design communicates:
> "This is not merely information—this is **Holy Scripture**, the very Word of God, worthy of beauty, care, and reverence."

---

*Visual Design Guide - Faith Frontier Ecclesiastical Trust*  
*Last Updated: 2025-12-28*
