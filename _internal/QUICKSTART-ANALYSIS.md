---
title: Quickstart (Analysis)
---

# OpenAI Case Analysis - Quick Start Guide
# OpenAI Case Analysis - Quick Start Guide

## Overview
The FaithFrontier repository now includes AI-powered case analysis that provides two perspectives on every case:
- **Judicial Oversight**: Legal analysis of constitutional and procedural issues
- **Journalistic Commentary**: Public interest perspective on rights and accountability

## Setup Instructions

### 1. Get an OpenAI API Key
1. Visit https://platform.openai.com/api-keys
2. Sign in or create an account
3. Click "Create new secret key"
4. Copy the key (starts with `sk-`)

### 2. For Local Development
```bash
# Copy the example environment file
cp .env.example .env

# Edit .env and add your API key
# OPENAI_API_KEY=sk-your-actual-api-key-here
```

### 3. For GitHub Actions (Automated)
1. Go to your repository Settings
2. Navigate to Secrets and variables > Actions
3. Click "New repository secret"
4. Name: `OPENAI_API_KEY`
5. Value: Your OpenAI API key
6. Click "Add secret"

## Usage

### Running Manually
```bash
# Install dependencies (first time only)
npm install

# Run analysis on all published cases
node scripts/analyze-cases.js
```

The script will:
- Process all published cases in `_cases/`
- Read associated docket entries from `_data/docket/`
- Generate analysis and save to `_data/analysis/<case-slug>.yml`
- Skip cases with recent analysis (< 7 days old)

### Automatic Analysis
The system automatically runs when:
- You push changes to case files in `_cases/`
- You update docket entries in `_data/docket/`

A Pull Request will be created with the generated analysis for your review.

### Manual Trigger from GitHub
1. Go to Actions tab
2. Select "Case Analysis with OpenAI"
3. Click "Run workflow"
4. Optionally enable "Force re-analysis" to regenerate all analyses

## Viewing Analysis

Analysis automatically appears on case pages after:
1. The analysis is generated
2. The PR is reviewed and merged
3. The Jekyll site is rebuilt

The analysis will be displayed at the bottom of each case page with:
- Clear section headers for each perspective
- Proper formatting and styling
- Disclaimer about AI-generated content
- Timestamp of generation

## Cost Estimates

Using `gpt-4o-mini` (default):
- Approximately $0.002-0.004 per case (both analyses)
- For 10 cases: ~$0.02-0.04
- For 100 cases: ~$0.20-0.40

Very affordable for this use case!

## Configuration

### Change AI Model
Edit `scripts/analyze-cases.js` and modify:
```javascript
model: 'gpt-4o-mini',  // Change to 'gpt-4o' or 'gpt-4' for higher quality
```

### Adjust Analysis Freshness
Edit `scripts/analyze-cases.js`:
```javascript
if (daysSinceGenerated < 7) {  // Change 7 to desired number of days
```

### Modify Analysis Prompts
Edit the `generateJudicialAnalysis` and `generateJournalisticCommentary` functions in `scripts/analyze-cases.js` to customize what the AI focuses on.

## Troubleshooting

### "OPENAI_API_KEY environment variable is not set"
✅ Create a `.env` file with your API key
✅ Check the key is correctly formatted (starts with `sk-`)

### "Error generating analysis"
✅ Verify API key is valid
✅ Check you have available credits at https://platform.openai.com/usage
✅ Check OpenAI service status: https://status.openai.com/

### Analysis not appearing on website
✅ Ensure the PR with analysis was merged
✅ Wait for Jekyll site to rebuild (check Actions tab)
✅ Check that the case slug matches the filename in `_data/analysis/`

### Workflow not triggering
✅ Verify `OPENAI_API_KEY` is set as a repository secret
✅ Check that changes were pushed to `_cases/` or `_data/docket/`
✅ Review the Actions tab for any error messages

## Security Best Practices

✅ Never commit `.env` file (already in `.gitignore`)
✅ Never share your API key publicly
✅ Rotate API keys periodically
✅ Monitor your OpenAI usage dashboard
✅ Review all AI-generated analysis before publishing

## Next Steps

1. Set up your OpenAI API key (local and/or GitHub)
2. Run analysis on existing cases
3. Review and merge the generated analysis PR
4. Add more cases and let the automation handle analysis
5. Customize prompts to better fit your needs

## Support

- Full documentation: See `ANALYSIS-SYSTEM.md`
- Docket system: See `DOCKET-SYSTEM.md`
- General setup: See `README.md`
- Open an issue on GitHub for questions or problems

---

**Note**: AI-generated analysis is informational only and should not be considered legal advice. Always review analysis for accuracy before publishing.
