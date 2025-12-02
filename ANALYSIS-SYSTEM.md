# OpenAI Case Analysis System

This system provides AI-powered analysis of case records and dockets using OpenAI's GPT models. It generates two types of analysis:

1. **Judicial Oversight Analysis**: Legal perspective focusing on due process, constitutional issues, and procedural propriety
2. **Journalistic Commentary**: Public interest perspective on individual rights, government accountability, and access to justice

## Setup

### 1. Install Dependencies

```bash
npm install
```

### 2. Configure OpenAI API Key

Create a `.env` file in the project root (copy from `.env.example`):

```bash
cp .env.example .env
```

Edit `.env` and add your OpenAI API key:

```
OPENAI_API_KEY=sk-your-actual-api-key-here
```

Get your API key from: https://platform.openai.com/api-keys

### 3. For GitHub Actions

Add the `OPENAI_API_KEY` as a repository secret:

1. Go to repository Settings > Secrets and variables > Actions
2. Click "New repository secret"
3. Name: `OPENAI_API_KEY`
4. Value: Your OpenAI API key
5. Click "Add secret"

## Usage

### Manual Analysis

Run the analysis script manually:

```bash
node scripts/analyze-cases.js
```

The script will:
- Process all published case files in `_cases/`
- Read associated docket entries from `_data/docket/`
- Generate two analyses per case (judicial and journalistic)
- Save results to `_data/analysis/<case-slug>.yml`
- Skip cases with recent analysis (less than 7 days old)

### Automated Analysis

The system automatically runs when:
- Case files are modified in `_cases/`
- Docket entries are updated in `_data/docket/`

The workflow creates a Pull Request with the generated analysis for review.

### Manual Trigger

You can manually trigger analysis from GitHub Actions:
1. Go to Actions > Case Analysis with OpenAI
2. Click "Run workflow"
3. Optional: Check "Force re-analysis" to regenerate all analyses

## Output Format

Analysis files are saved as YAML in `_data/analysis/<case-slug>.yml`:

```yaml
generated_at: 2025-11-16T12:00:00.000Z
slug: case-slug
judicial_oversight: |
  [AI-generated judicial oversight analysis]
  
journalistic_commentary: |
  [AI-generated journalistic commentary]
```

## Using Analysis in Jekyll

Access the analysis data in your Jekyll layouts and includes:

```liquid
{% assign analysis = site.data.analysis[page.slug] %}

{% if analysis %}
  <section class="analysis">
    <h2>Judicial Oversight Analysis</h2>
    {{ analysis.judicial_oversight | markdownify }}
    
    <h2>Journalistic Commentary</h2>
    {{ analysis.journalistic_commentary | markdownify }}
    
    <p class="meta">Generated: {{ analysis.generated_at | date: "%B %d, %Y" }}</p>
  </section>
{% endif %}
```

## Analysis Prompts

### Judicial Oversight
Focuses on:
- Due process considerations
- Procedural propriety
- Constitutional issues
- Judicial conduct and adherence to law
- Administrative justice concerns

### Journalistic Commentary
Focuses on:
- Public interest and transparency
- Individual rights and freedoms
- Government accountability
- Access to justice
- Broader societal implications
- The human story behind legal proceedings

## Configuration

### Model Selection

The script uses `gpt-4o-mini` by default for cost-effectiveness. To use a different model, edit `scripts/analyze-cases.js`:

```javascript
model: 'gpt-4o',  // or 'gpt-4', 'gpt-3.5-turbo', etc.
```

### Analysis Freshness

By default, analyses older than 7 days are regenerated. Adjust in `scripts/analyze-cases.js`:

```javascript
if (daysSinceGenerated < 7) {  // Change to your preferred number of days
```

### Rate Limiting Protection

The script automatically handles rate limits with:
- **20-second delays** between API calls (respects 3 RPM free tier limit)
- **Exponential backoff retry** logic for 429 errors
- **Partial saves** so progress isn't lost if one analysis fails

To adjust the delays (if you have higher rate limits), edit `scripts/analyze-cases.js`:

```javascript
await new Promise(resolve => setTimeout(resolve, 20000));  // Change 20000 (20s) as needed
```

**Note:** Free tier has 3 RPM limit = minimum 20 seconds between requests. Paid tiers have higher limits.

## Costs

Using `gpt-4o-mini`:
- Input: ~$0.15 per 1M tokens
- Output: ~$0.60 per 1M tokens

Typical case analysis:
- Input: ~2,000-3,000 tokens per case
- Output: ~2,000 tokens per analysis type
- Total: ~$0.002-0.004 per case (both analyses)

For 10 cases: ~$0.02-0.04

## Troubleshooting

### "OPENAI_API_KEY environment variable is not set"
- Ensure `.env` file exists in project root
- Check that the API key is correctly formatted
- For GitHub Actions, verify the secret is set in repository settings

### "Error generating analysis"
- Check API key validity
- Verify you have available API credits
- Check OpenAI service status: https://status.openai.com/

### "No case files found to analyze"
- Ensure case files exist in `_cases/` directory
- Check that files have `.md` extension
- Verify files have valid YAML front matter

### Rate Limiting (HTTP 429 Errors)

The script is designed to handle OpenAI rate limits automatically:

**Free Tier Limits:**
- 3 requests per minute (RPM)
- 100,000 tokens per minute (TPM)

**Built-in Protection:**
- 20-second delay between API calls (respects 3 RPM limit)
- Automatic retry with exponential backoff on rate limit errors
- Partial results saved (judicial analysis saved even if journalistic fails)
- Can resume analysis on subsequent runs (skips recently generated analyses)

**If Rate Limits Are Hit:**
- The script will automatically wait and retry (up to 5 attempts)
- Wait times are extracted from error messages when possible
- For very large case backlogs, consider:
  - Running analysis in multiple smaller batches
  - Upgrading to a paid OpenAI plan with higher rate limits
  - Using the `force_reanalysis: false` option to only analyze new cases

**Expected Runtime:**
- Each case requires 2 API calls (judicial + journalistic)
- With 3 RPM limit: ~40 seconds per case minimum
- For 7 cases: ~5-6 minutes minimum
- GitHub Actions timeout: 6 hours (plenty of time)

## Security

- Never commit `.env` file or expose API keys
- API keys are stored as GitHub secrets for automated workflows
- All uploads go through PR review before merging
- Analysis is generated but requires human review

## Support

For issues or questions:
1. Check this README
2. Review the script comments in `scripts/analyze-cases.js`
3. Open an issue on GitHub
