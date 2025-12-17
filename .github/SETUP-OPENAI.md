# OpenAI API Key Setup Checklist

This guide helps you configure the OpenAI API key for automated case analysis.

## Prerequisites

- Repository admin access
- OpenAI account with API access
- Available API credits

## Setup Steps

### 1. Get OpenAI API Key

1. Go to [OpenAI Platform](https://platform.openai.com/api-keys)
2. Sign in or create an account
3. Click "Create new secret key"
4. Give it a descriptive name (e.g., "FaithFrontier Analysis")
5. Copy the key immediately (you won't be able to see it again)

### 2. Add Secret to GitHub Repository

1. Go to your repository on GitHub
2. Navigate to: **Settings** → **Secrets and variables** → **Actions**
3. Click **"New repository secret"**
4. Configure the secret:
   - **Name:** `OPENAI_API_KEY`
   - **Value:** Paste your OpenAI API key
5. Click **"Add secret"**

### 3. Verify Setup

The workflow will automatically validate that the secret is set before running. If the secret is missing, you'll see a clear error message in the workflow logs.

To manually test:

1. Go to **Actions** tab in your repository
2. Select **"Case Analysis with OpenAI"** workflow
3. Click **"Run workflow"**
4. Monitor the workflow run for any errors

### 4. Local Development (Optional)

For local testing:

1. Copy `.env.example` to `.env`:
   ```bash
   cp .env.example .env
   ```

2. Edit `.env` and add your API key:
   ```
   OPENAI_API_KEY=sk-your-actual-api-key-here
   ```

3. Install dependencies:
   ```bash
   npm install
   ```

4. Run the analysis script:
   ```bash
   node scripts/analyze-cases.js
   ```

## Troubleshooting

### Secret Not Found Error

If you see:
```
OPENAI_API_KEY secret is not set
```

**Solution:** Make sure you:
- Named the secret exactly `OPENAI_API_KEY` (case-sensitive)
- Added it as a repository secret (not an organization or environment secret)
- Have the necessary permissions to add secrets

### Authentication Failed

If you see OpenAI authentication errors:
- Verify your API key is valid and not expired
- Check that your OpenAI account has available credits
- Ensure you copied the full key without any extra spaces

### Workflow Not Triggering

The workflow runs automatically when:
- Files in `_cases/` are modified
- Files in `_data/docket/` are modified
- You manually trigger it from the Actions tab

## Security Best Practices

- ✅ Never commit `.env` file to the repository
- ✅ Use GitHub secrets for production workflows
- ✅ Rotate API keys periodically
- ✅ Monitor API usage and costs
- ✅ Limit key permissions to only what's needed

## Cost Considerations

Using `gpt-4o-mini` (default):
- Typical cost: ~$0.002-0.004 per case analysis
- For 10 cases: ~$0.02-0.04
- For 100 cases: ~$0.20-0.40

Monitor your usage at: https://platform.openai.com/usage

## Support

For detailed information, see [_docs/ANALYSIS-SYSTEM.md](../../_docs/ANALYSIS-SYSTEM.md)

For issues:
1. Check this checklist
2. Review workflow logs in the Actions tab
3. Consult the troubleshooting section in _docs/ANALYSIS-SYSTEM.md
4. Open an issue if problems persist
