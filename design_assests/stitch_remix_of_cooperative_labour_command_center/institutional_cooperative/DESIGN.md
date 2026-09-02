---
name: Institutional Cooperative
colors:
  surface: '#f8f9ff'
  surface-dim: '#cbdbf5'
  surface-bright: '#f8f9ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#eff4ff'
  surface-container: '#e5eeff'
  surface-container-high: '#dce9ff'
  surface-container-highest: '#d3e4fe'
  on-surface: '#0b1c30'
  on-surface-variant: '#44474e'
  inverse-surface: '#213145'
  inverse-on-surface: '#eaf1ff'
  outline: '#75777f'
  outline-variant: '#c5c6cf'
  surface-tint: '#4e5e81'
  primary: '#031635'
  on-primary: '#ffffff'
  primary-container: '#1a2b4b'
  on-primary-container: '#8293b8'
  inverse-primary: '#b6c6ef'
  secondary: '#1b6d24'
  on-secondary: '#ffffff'
  secondary-container: '#a0f399'
  on-secondary-container: '#217128'
  tertiary: '#241300'
  on-tertiary: '#ffffff'
  tertiary-container: '#402600'
  on-tertiary-container: '#cd8300'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#d8e2ff'
  primary-fixed-dim: '#b6c6ef'
  on-primary-fixed: '#081b3a'
  on-primary-fixed-variant: '#364768'
  secondary-fixed: '#a3f69c'
  secondary-fixed-dim: '#88d982'
  on-secondary-fixed: '#002204'
  on-secondary-fixed-variant: '#005312'
  tertiary-fixed: '#ffddb8'
  tertiary-fixed-dim: '#ffb95f'
  on-tertiary-fixed: '#2a1700'
  on-tertiary-fixed-variant: '#653e00'
  background: '#f8f9ff'
  on-background: '#0b1c30'
  surface-variant: '#d3e4fe'
typography:
  display:
    fontFamily: Inter
    fontSize: 36px
    fontWeight: '700'
    lineHeight: 44px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Inter
    fontSize: 28px
    fontWeight: '600'
    lineHeight: 36px
    letterSpacing: -0.01em
  headline-md:
    fontFamily: Inter
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
  headline-sm:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '600'
    lineHeight: 24px
  body-lg:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-md:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  label-md:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 16px
    letterSpacing: 0.01em
  label-sm:
    fontFamily: Inter
    fontSize: 11px
    fontWeight: '600'
    lineHeight: 14px
  headline-lg-mobile:
    fontFamily: Inter
    fontSize: 24px
    fontWeight: '600'
    lineHeight: 32px
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  unit: 4px
  container-padding: 24px
  gutter: 16px
  stack-sm: 8px
  stack-md: 16px
  stack-lg: 32px
  max-width-desktop: 1440px
---

## Brand & Style
The design system is engineered for professional accountability, stability, and collective trust. It serves as the visual infrastructure for cooperative labor management, where transparency and data integrity are paramount.

The aesthetic follows a **Modern Corporate** direction with a focus on **Information Density** and **Functional Clarity**. It avoids decorative flourishes in favor of high-legibility layouts and structured data visualization. The emotional response is one of reliability, precision, and institutional strength, ensuring users feel the weight of professional governance behind every interface interaction.

## Colors
The palette is rooted in a high-contrast foundation to ensure WCAG 2.1 compliance and data legibility.

- **Primary (Deep Navy):** Used for navigation, primary actions, and structural headers to anchor the UI.
- **Success (Professional Green):** Specifically reserved for verified labor statuses, completed transactions, and positive growth trends.
- **Warning (Amber):** Identifies pending reviews, upcoming deadlines, or manual interventions required.
- **Alert (Red):** Used sparingly for compliance failures, critical labor disputes, or system errors.
- **Background & Surface:** The off-white background creates a "canvas" that allows white cards to stand out with subtle elevation, reducing eye strain during long periods of data entry and analysis.

## Typography
This design system utilizes **Inter** exclusively to leverage its exceptional legibility in data-dense environments. 

- **Weight Strategy:** Use `600` and `700` for structural elements and KPIs. Use `400` for standard body text.
- **Numeric Data:** For data tables and financial figures, ensure the use of tabular lining (monospaced numbers) to maintain vertical alignment in columns.
- **Hierarchy:** Use `label-sm` in uppercase for table headers and section subtitles to create clear visual separation from data rows.

## Layout & Spacing
The layout relies on a **12-column fluid grid** for dashboard views, transitioning to a single-column stack for mobile.

- **Margins:** Standardize on 24px container padding for desktop and 16px for mobile.
- **Rhythm:** Use a 4px baseline grid. All spacing between related elements (label/input) should be 8px (`stack-sm`), while spacing between sections should be 32px (`stack-lg`).
- **Data Density:** In complex tables, use "Compact" (8px vertical padding) or "Comfortable" (16px vertical padding) modes to allow users to customize their information viewing experience.

## Elevation & Depth
Hierarchy is established through **Tonal Layering** and **Low-Contrast Outlines** rather than aggressive shadows.

- **Level 0 (Background):** #F8FAFC.
- **Level 1 (Cards/Surface):** White (#FFFFFF) with a 1px border of #E2E8F0. This is the primary container for data.
- **Level 2 (Hover/Active):** A subtle, diffused shadow (0px 4px 6px -1px rgba(0, 0, 0, 0.05)) is applied only when a card or interactive element is hovered.
- **Separators:** Use 1px borders (#F1F5F9) for table rows and list items. Avoid using shadows to separate list items.

## Shapes
The design system uses a **Rounded** (8px to 12px) shape language to soften the institutional feel and make the software feel modern and accessible.

- **Buttons & Inputs:** 8px (`rounded-md`) for a precise, professional look.
- **Cards & Modals:** 12px (`rounded-lg`) to provide a distinct container feel for high-level information groups.
- **Status Badges:** Fully rounded (pill) to distinguish them from interactive buttons.

## Components
- **Buttons:** Primary buttons use Deep Navy with white text. Secondary buttons use a white background with a 1px border (#CBD5E1). Small buttons (28px height) are used within table rows.
- **Data Tables:** Headers must remain sticky. Row striping is not used; instead, use a 1px bottom border. Include a "Status" column with pill-shaped badges (Green/Amber/Red).
- **KPI Cards:** Large `headline-lg` numbers. Trend indicators (arrows) use Success Green or Alert Red. Include a small sparkline chart for 7-day trends.
- **Input Fields:** 1px border (#CBD5E1) that thickens to 2px Deep Navy on focus. Labels are always persistent above the field in `label-md`.
- **AI-Insight Components:** Surfaces for AI suggestions use a very subtle gradient (Deep Navy to a slightly lighter blue) or a specific icon treatment to denote "Calculated Intelligence" vs "Raw Data."
- **Checkboxes:** Standard 16px square with 4px corner radius. On selection, the fill is Deep Navy with a white checkmark.