# Laelith Open Licence Website

This repository contains the source code for the [Laelith Open Licence](https://www.laelith.org) website, which defines how the Laelith Intellectual Property and trademark can be used, modified, and shared.

## About Laelith

Laelith is a medieval-fantasy city setting with rich lore, characters, and stories created collectively by authors and contributors since 1985. The Laelith Open Licence makes this intellectual property available under a CC-BY 4.0 license for both personal and commercial use.

## Features

- **Bilingual support**: Full English and French translations
- **Open Licence documentation**: Complete trademark usage guidelines and IP licensing terms
- **Copy to clipboard**: Easy text copying with preserved formatting for licence pages
- **Responsive design**: Mobile-friendly layout
- **Custom Hugo theme**: Clean, medieval-fantasy inspired design

## Technology Stack

- **Static Site Generator**: [Hugo](https://gohugo.io/)
- **Theme**: Custom Laelith theme
- **CSS Framework**: Bootstrap 4.5
- **Fonts**: Cinzel (headings), Crimson Text (body)

## Getting Started

### Prerequisites

- [Hugo](https://gohugo.io/installation/) (Extended version recommended)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/laelith-org/laelith-org.git
   cd laelith-org
   ```

2. Run the development server:
   ```bash
   hugo server
   ```

3. Open your browser to `http://localhost:1313`

### Building for Production

To build the static site:

```bash
hugo
```

The compiled site will be in the `public/` directory.

## Project Structure

```
laelith-org/
├── content/              # Markdown content files
│   ├── _index.md        # English home page
│   ├── _index.fr.md     # French home page
│   ├── licence.md       # English licence page
│   ├── licence.fr.md    # French licence page
│   ├── authors.md       # English authors page
│   └── authors.fr.md    # French authors page
├── themes/
│   └── laelith/         # Custom Hugo theme
│       ├── layouts/     # HTML templates
│       └── static/      # CSS, images, fonts
├── hugo.toml            # Hugo configuration
└── public/              # Generated site (not in git)
```

## Content Management

### Adding/Editing Pages

Content is written in Markdown with YAML front matter. Example:

```yaml
---
title: "Page Title"
show_copy_button: true  # Optional: enables copy-to-clipboard button
---

# Your content here
```

### Translations

To add a French translation of a page, create a file with the `.fr.md` extension:
- `page.md` → `page.fr.md`


## License

This project (the website code) is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

The Laelith Intellectual Property content is licensed under [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/) - see the [licence page](https://www.laelith.org/licence) for details.

## Links

- **Website**: [https://www.laelith.org](https://www.laelith.org)
- **Laelith City**: [https://www.laelith.com](https://www.laelith.com)
