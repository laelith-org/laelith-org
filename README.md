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
   hugo server -w
   ```

3. Open your browser to `http://localhost:1313`

### Building for Production

To build the static site:

```bash
hugo
```

The compiled site will be in the `public/` directory.

## Deployment

The site is deployed on [Render](https://render.com/) as a static site.

### Pinning the Hugo version on Render

Render's plain dashboard-configured "Static Site" service has **no setting to choose a Hugo version**
(unlike Netlify, which supports a `HUGO_VERSION` build environment variable). Left alone, Render just
uses whatever Hugo it bundles by default, and that silently drifts over time — it is **not** guaranteed
to match the version installed locally (`hugo version`).

The fix is a Render **Blueprint** ([docs](https://render.com/docs/infrastructure-as-code)): a `render.yaml`
file at the repo root that lets Render read the service config, including build env vars, as code. Render
still has no native `HUGO_VERSION` var even with Blueprints (see the
[feature request thread](https://feedback.render.com/features/p/specify-hugo-version) and Render's own
[Hugo deploy guide](https://render.com/docs/deploy-hugo)) — a custom build script that downloads a pinned
Hugo release is the documented workaround, per
[gohugo.io's own Render hosting guide](https://gohugo.io/host-and-deploy/host-on-render/).

How it's wired up in this repo:

- **`render.yaml`** — defines the Render service and sets `HUGO_VERSION` as a plain build env var.
- **`build.sh`** — the actual build command Render runs. It downloads that exact Hugo release
  (`hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz` from Hugo's GitHub releases) and builds the site
  against it.

**Important gotcha:** a `render.yaml` file sitting in the repo does nothing by itself. If the Render
service was originally created through the dashboard (not via "New > Blueprint"), you must explicitly
enable Blueprint sync for that service (Render dashboard → service → Settings) before it will read
`render.yaml` / `build.sh` at all. Until that's enabled, Render silently keeps using its own default
build command and bundled Hugo version, as if the Blueprint files didn't exist.

#### Bumping the Hugo version later

1. Update `HUGO_VERSION` in `render.yaml`.
2. Update your local Hugo install to match (e.g. `brew upgrade hugo`), so `hugo version` locally equals
   `HUGO_VERSION` in `render.yaml` — that lockstep is the whole point.
3. Push, then check the Render deploy log for the `hugo v...` line to confirm the version that actually
   built the site is the one you expect.

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
├── render.yaml          # Render Blueprint service config
├── build.sh             # Render build script (pins the Hugo version)
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
