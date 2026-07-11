# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Static HTML/CSS portfolio website deployed to AWS using S3 and CloudFront, provisioned with Terraform, and automated via GitHub Actions.

**Key Constraint**: This is a static site (HTML/CSS/images only). There is no build process, package manager, testing framework, or backend—just plain files served by Nginx.

## File Structure

```
index.html              # Main portfolio page
privacy.html            # Privacy policy page
terms.html              # Terms of service page
style.css               # Main stylesheet
images/                 # Static images (logo, courses, books, etc.)
```

## Important: Mandatory Footer Edit (DMI Requirement)

Before any deployment, students **must** edit the footer in `index.html` (line 604) to add their deployment proof:

**Original:**

```html
<p>Crafted with <span>cloud</span> excellence by Pravin Mishra</p>
```

**Must change to (example):**

```html
<p>
  <strong>Deployed by:</strong> DMI Cohort 2 | Your Name | Group 4 | Week 1 |
  16-01-2026
</p>
```

This visible footer text is required for DMI submission proof and must appear in browser screenshots.

## Deployment (Ubuntu + Nginx)

### Quick Deploy Commands

```bash
# Install Nginx
sudo apt update && sudo apt install nginx -y

# Copy website files to Nginx root
sudo cp -r . /var/www/html/
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/

# Start Nginx
sudo systemctl start nginx
sudo systemctl enable nginx
```

### Access

- URL: `http://<public-ip>` (after deployment)
- The site is fully functional at any static HTTP endpoint

## Architecture

- Pure HTML5 and CSS3
- No JavaScript
- No build step
- No framework

## Common Tasks

| Task                   | Action                                                                                       |
| ---------------------- | -------------------------------------------------------------------------------------------- |
| Edit portfolio content | Modify `index.html` sections (about, services, courses, books, contact)                      |
| Customize styling      | Edit `style.css`—uses semantic class names like `.hero`, `.services-grid`, `.trust-stats`    |
| Add images             | Place in `images/` folder and reference in HTML `src` attributes                             |
| Add new pages          | Create `.html` file and link from navbar in `index.html`                                     |
| Test locally           | Open `index.html` directly in a browser or run `python -m http.server 8000` to serve locally |

## Commands

- terraform init
- terraform plan
- terraform apply

## Conventions

- All infrastructure changes go through Terraform — never modify AWS resources manually
- No JavaScript in this project
- CSS uses mobile-first approach with breakpoints at 900px, 768px, and 600px

## Safety

Never put secrets in this file. No API keys, passwords, or AWS credentials.
