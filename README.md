# alexa-shopping-list-sync
Alexa Shopping list-Home Assistant Sync
# 🛒 Alexa Shopping List Sync for Home Assistant

Synchronize your Amazon Alexa shopping list with Home Assistant using a lightweight Dockerized Flask service.

---

## 🚀 Features
- Two-way sync between Alexa and Home Assistant shopping lists  
- Simple Docker deployment with persistent `/config` volume  
- Secure communication via local network (no cloud dependency)

---

## 🧱 Architecture

---

## 🧩 Setup

### 1. Docker Compose
```yaml
version: "3.8"

services:
  homeassistant:
    image: ghcr.io/home-assistant/home-assistant:stable
    container_name: homeassistant
    restart: unless-stopped
    network_mode: host
    environment:
      - TZ=America/New_York
      - PUID=1000
      - PGID=10
    volumes:
      - /volume1/docker/apps/home_assistant/config:/config

  alexa_shopping_list_sync:
    container_name: alexa_shopping_list_sync
    image: ghcr.io/mjc8278a/alexa-shopping-list-sync:latest
    network_mode: host
    volumes:
      - /volume1/docker/apps/alexa_sync_config:/config
    environment:
      - PUID=1000
      - PGID=10
    restart: unless-stopped

Press **CTRL + O → ENTER → CTRL + X** to save.

---

2️⃣ **Stage and commit everything again:**

```bash
git add -f README.md Dockerfile server.py build_push_alexa_sync.sh
git commit -m "Add README and all missing project files"
git push -u origin main
