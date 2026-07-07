# pollinations-tool

A WASM tool for the IronClaw agent runtime that generates images from text prompts using the Pollinations.ai API — completely free, no API key required.

## Overview

`pollinations-tool` enables IronClaw agents to generate images directly from natural language prompts with zero cost and zero authentication. It connects to the Pollinations.ai image API which is free and open to use.

This is the recommended starting tool for image generation in IronClaw — free to use, no vault credentials needed, and instant setup.

## Actions

### `generate_image`

Generate an image from a text prompt.

**Input:**
```json
{
  "prompt": "A dark futuristic trading dashboard with neon green accents",
  "width": 1024,
  "height": 1024,
  "model": "flux",
  "seed": null,
  "nologo": true
}
```

**Output:**
```json
{
  "url": "https://image.pollinations.ai/prompt/A%20dark%20futuristic...",
  "prompt": "A dark futuristic trading dashboard with neon green accents",
  "width": 1024,
  "height": 1024,
  "model": "flux"
}
```

### `generate_flyer`

Optimized for event flyers and promotional materials. Internally sets portrait dimensions and vivid style.

**Input:**
```json
{
  "event_name": "NEAR Legion Nigeria: I Got Skills",
  "date": "August 7",
  "location": "Cafe One, Uyo, Akwa Ibom State",
  "theme": "dark background, neon green, tech aesthetic",
  "additional_details": "NEAR Legion branding, robot mascot"
}
```

### `generate_social_post`

Optimized for square social media images (Instagram, Twitter).

**Input:**
```json
{
  "topic": "IronClaw agent skills pack launch",
  "style": "dark tech, neon green, bold typography",
  "text_overlay": "42 Skills. One Agent."
}
```

### `generate_logo_concept`

Generates logo concept images for review.

**Input:**
```json
{
  "brand_name": "IronClaw",
  "style": "minimalist, dark, mechanical claw, tech",
  "colors": "dark grey, electric blue",
  "format": "square"
}
```

## Authentication

**No authentication required.** Pollinations.ai is a free, open API.

```
No vault key needed
No API key needed
No account needed
```

## How It Works

Pollinations.ai works via a simple URL pattern:

```
https://image.pollinations.ai/prompt/{encoded_prompt}?width={w}&height={h}&model={model}&nologo=true
```

The tool constructs this URL, fetches the image, and returns it to the agent.

## Available Models

| Model | Description | Best For |
|-------|-------------|---------|
| `flux` | High quality, detailed | General purpose, recommended |
| `flux-realism` | Photorealistic output | Realistic scenes, people |
| `flux-anime` | Anime/illustration style | Creative, stylized |
| `flux-3d` | 3D rendered look | Product mockups, logos |
| `turbo` | Fastest generation | Quick drafts, iteration |

## Scopes & Limits

| Parameter | Value |
|-----------|-------|
| API endpoint | `https://image.pollinations.ai` |
| Auth | None required |
| Cost | Free |
| Max width | 2048px |
| Max height | 2048px |
| Default size | 1024x1024 |
| Rate limit | Generous — no hard limit published |
| Response time | 3–15 seconds depending on model |

## Target Use Cases

- Graphic design skill: generate event flyers, social posts, logos
- Marketing skill: generate ad creatives and campaign visuals
- Brand skill: visualize brand concepts at zero cost
- Prototyping: quick visual drafts before commissioning real design work
- Community tools: generate images for community events and announcements

## Allowed Endpoints

```
https://image.pollinations.ai/prompt/*
https://image.pollinations.ai/models
```

## Security Notes

- No credentials required or stored
- No user data sent to Pollinations beyond the prompt text
- Images are returned as URLs — no binary stored locally
- Prompts should not contain personal or sensitive information
- Free service — do not abuse with excessive generation loops

## File Structure

```
tools/pollinations/
├── Cargo.toml
├── README.md
├── pollinations-tool.capabilities.json
└── src/
    ├── lib.rs        # Guest entry point and dispatch
    ├── types.rs      # Action enum and schema types
    ├── api.rs        # Pollinations API call implementations
    └── prompt.rs     # Prompt construction and URL encoding
```

## Example Agent Interaction

```
User: Generate a flyer for NEAR Legion Nigeria event August 7 in Uyo

Agent: [pollinations-tool: generate_flyer]
  event_name: "NEAR Legion Nigeria: I Got Skills"
  date: "August 7"
  location: "Cafe One, Uyo, Akwa Ibom State"
  theme: "dark background, neon green, bold typography, tech aesthetic"
  additional_details: "NEAR Legion branding, robot mascot, Nigerian flag colors"

Result: [image URL returned and displayed in chat — free, instant]
```

## Comparison with DALL-E tool

| Feature | pollinations-tool | dalle-tool |
|---------|-------------------|------------|
| Cost | Free | $0.04–$0.12/image |
| Auth required | No | Yes (API key) |
| Image quality | Good | Excellent |
| Speed | 3–15s | 5–15s |
| Best for | Prototyping, community use | Production, high quality |
| Vault setup | None | OPENAI_API_KEY |

## Author

@Eearnest
