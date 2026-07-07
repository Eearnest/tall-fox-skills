# dalle-tool

A WASM tool for the IronClaw agent runtime that generates images from text prompts using the OpenAI DALL-E API.

## Overview

`dalle-tool` enables IronClaw agents to generate images directly from natural language prompts. It connects to the OpenAI Images API and returns image URLs that the agent can present to the user.

## Actions

### `generate_image`

Generate an image from a text prompt.

**Input:**
```json
{
  "prompt": "A dark futuristic trading dashboard with neon green accents and crypto charts",
  "size": "1024x1024",
  "quality": "standard",
  "style": "vivid",
  "n": 1
}
```

**Output:**
```json
{
  "url": "https://oaidalleapiprodscus.blob.core.windows.net/...",
  "revised_prompt": "A dark futuristic...",
  "created": 1717200000
}
```

### `generate_image_hd`

Generate a high-definition image. Same parameters as `generate_image` but forces `quality: hd`.

### `edit_image`

Edit an existing image using a mask and prompt.

**Input:**
```json
{
  "image_url": "https://...",
  "mask_url": "https://...",
  "prompt": "Add a NEAR logo to the top left corner",
  "size": "1024x1024"
}
```

### `describe_and_generate`

Takes a description of a design goal (not a raw prompt) and internally crafts an optimized DALL-E prompt before generating.

**Input:**
```json
{
  "goal": "Create an event flyer for NEAR Legion Nigeria, August 7, Uyo, green and black theme",
  "style": "vivid",
  "size": "1024x1792"
}
```

## Authentication

Requires an OpenAI API key stored in the IronClaw vault:

```
Vault key: OPENAI_API_KEY
Type: Bearer token
Header: Authorization: Bearer {OPENAI_API_KEY}
```

Never expose the API key in prompts, logs, or agent responses.

## Scopes & Limits

| Parameter | Value |
|-----------|-------|
| API endpoint | `https://api.openai.com/v1/images/generations` |
| Auth | Bearer token (OPENAI_API_KEY) |
| Max prompt length | 4000 characters |
| Images per call | 1 (n=1 enforced for cost control) |
| Supported sizes | 1024x1024, 1792x1024, 1024x1792 |
| Quality options | standard, hd |
| Style options | vivid, natural |
| Rate limit | 50 images per minute (Tier 1) |
| Cost | ~$0.04 standard / ~$0.08 HD per image |

## Target Use Cases

- Graphic design skill: generate event flyers, social media posts, logos
- Marketing skill: generate ad creatives from campaign briefs
- Brand guide skill: visualize brand concepts
- Any skill that needs to show rather than tell

## Allowed Endpoints

```
https://api.openai.com/v1/images/generations
https://api.openai.com/v1/images/edits
```

## Security Notes

- API key stored in IronClaw encrypted vault only
- No key ever appears in agent output, logs, or prompts
- Images are returned as URLs — no binary data stored locally
- User confirmation required before any paid API call
- Dry-run mode returns prompt preview without calling the API

## File Structure

```
tools/dalle/
├── Cargo.toml
├── README.md
├── dalle-tool.capabilities.json
└── src/
    ├── lib.rs        # Guest entry point and dispatch
    ├── types.rs      # Action enum and schema types
    ├── api.rs        # OpenAI API call implementations
    └── prompt.rs     # Prompt optimization helpers
```

## Example Agent Interaction

```
User: Create a flyer for my crypto meetup in Lagos, dark theme, August 15

Agent: [dalle-tool: describe_and_generate]
  goal: "Event flyer for crypto meetup Lagos Nigeria,
         August 15, dark background, neon accents,
         professional tech aesthetic, Lagos skyline"
  style: vivid
  size: 1024x1792

Result: [image URL returned and displayed in chat]
```

## Pricing Reference

| Model | Size | Quality | Cost per image |
|-------|------|---------|----------------|
| dall-e-3 | 1024x1024 | Standard | $0.040 |
| dall-e-3 | 1024x1024 | HD | $0.080 |
| dall-e-3 | 1792x1024 | Standard | $0.080 |
| dall-e-3 | 1024x1792 | Standard | $0.080 |
| dall-e-3 | 1792x1024 | HD | $0.120 |

## Author

@Eearnest
