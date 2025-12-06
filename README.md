# Metrias Medical Marketing Site

This is the single-page marketing website for Metrias Medical.

## Tech Stack
- **HTML5**: Single file structure.
- **CSS3**: Embedded in `index.html` (no external stylesheets).
- **Assets**: `favicon.png`.
- **Scripts**: None (Pure HTML/CSS).

## Project Structure
```
.
├── index.html      # Main website file
├── favicon.png     # Browser tab icon
└── README.md       # This file
```

## Deployment Instructions

### Cloudflare Pages (Recommended)
1. Log in to the Cloudflare Dashboard and go to **Workers & Pages**.
2. Click **Create Application** > **Pages** > **Connect to Git**.
3. Select the repository containing this project.
4. **Build Settings**:
   - **Framework Preset**: None / Static HTML
   - **Build Command**: (Leave blank)
   - **Build Output Directory**: `/` (or leave blank if root)
5. Click **Save and Deploy**.

### Netlify
1. Log in to Netlify.
2. Click **Add new site** > **Import an existing project**.
3. Connect your Git provider and select this repository.
4. **Build Settings**:
   - **Build command**: (Leave blank)
   - **Publish directory**: `/` (or leave blank)
5. Click **Deploy site**.

### Manual / Other Static Hosting
Simply upload `index.html` and `favicon.png` to the public root directory of any static web host.

## Local Development
Since this is a static site, you can view it by simply opening `index.html` in your web browser. No server or build process is required.
