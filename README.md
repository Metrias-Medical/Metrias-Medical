# Metrias Medical Marketing Site

This is the single-page marketing website for Metrias Medical.

## Tech Stack

- **HTML5**: Single file structure.
- **CSS3**: Embedded in `index.html` (no external stylesheets).
- **Assets**: SVG logos and favicons.
- **Scripts**: None (Pure HTML/CSS).

## Project Structure

```
.
├── index.html      # Main website file
├── favicon.svg     # Browser tab icon (vector)
├── logo_mark.svg   # Header logo
└── README.md       # This file
```

## Deployment Guide: GitHub Pages

### 1. Push to GitHub

1. Open **GitHub Desktop**.
2. Click **"Publish repository"** (top right).
3. Name it `metrias-medical-site`.
4. **Important**: Uncheck "Keep this code private" (unless you have GitHub Pro, Pages requires a public repo for the free tier).
5. Click **Publish**.

### 2. Activate GitHub Pages

1. Go to your new repository on GitHub.com (`https://github.com/[your-username]/metrias-medical-site`).
2. Click **Settings** (top tab).
3. On the left sidebar, click **Pages**.
4. Under **"Build and deployment"** > **Branch**, select `main` and ensure folder is `/(root)`.
5. Click **Save**.

*Within 1-2 minutes, your site will be live at `[your-username].github.io/metrias-medical-site`.*

### 3. Connect Custom Domain (metriasmedical.com)

1. On that same **Settings > Pages** screen, scroll down to **Custom domain**.
2. Type `metriasmedical.com` and click **Save**.
3. GitHub will check for DNS records. It will tell you to add specific **A records** to your registrar (Godaddy/Namecheap/etc).

**DNS Records to Add at Registrar:**

| Type | Name | Value |
|------|------|-------|
| A    | @    | 185.199.108.153 |
| A    | @    | 185.199.109.153 |
| A    | @    | 185.199.110.153 |
| A    | @    | 185.199.111.153 |
| CNAME| www  | `[your-username].github.io` |

4. Once you add these at your registrar, wait 5-10 mins, then check **"Enforce HTTPS"** in GitHub Pages settings to secure the site.
