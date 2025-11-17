# Quick Start: Generating AI Analysis for Case Records

This guide will help you generate AI-powered analysis for your case records using the OpenAI API.

## Prerequisites

✅ OpenAI API key is configured (check Settings > Secrets > Actions > OPENAI_API_KEY)
✅ Repository has case files in `_cases/` directory
✅ Docket files exist in `_data/docket/` directory

## Current Status

Your case record pages show "Analysis pending" because **no analysis files have been generated yet**. The analysis files need to be created by running the `analyze-cases.js` script with a valid OpenAI API key.

## How to Generate Analysis

### Option 1: Automatic Trigger (Recommended)

The analysis workflow runs automatically when you:

1. **Push changes to case files**: Any edit to files in `_cases/` will trigger analysis
2. **Update docket entries**: Changes to `_data/docket/` files trigger analysis

To manually trigger without code changes:
- Make a trivial edit to any case file (e.g., add a space)
- Commit and push the change
- Wait for the workflow to complete (~5-6 minutes for 7 cases)

### Option 2: Manual Workflow Trigger

1. Go to your repository on GitHub
2. Navigate to **Actions** tab
3. Select **"Case Analysis with OpenAI"** workflow
4. Click **"Run workflow"** button
5. Select branch: `main`
6. Optional: Check "Force re-analysis" to regenerate all analyses
7. Click **"Run workflow"**

### Option 3: Local Development

Run the script locally with your API key:

```bash
# Set up environment
cp .env.example .env
# Edit .env and add your OPENAI_API_KEY

# Install dependencies
npm install

# Run analysis
node scripts/analyze-cases.js
```

## What Happens During Analysis

1. **Script runs** for ~5-6 minutes (7 cases × 40 seconds each)
2. **Progress indicators** show:
   - 🔍 Generating judicial oversight analysis...
   - ⏱️  Waiting 20s to respect rate limits...
   - 📰 Generating journalistic commentary...
   - ✓ Analysis saved
3. **Files created** in `_data/analysis/`:
   - `a-000308-25.yml`
   - `street-crossing-pcr-appeal.yml`
   - `atl-dc-007956-25.yml`
   - `atl-l-002794-25.yml`
   - `barber-nj-pcr-2022.yml`
   - `usdj-1-22-cv-06206.yml`
   - `usdj-1-25-cv-15641.yml`
4. **Pull Request created** with the analysis files (GitHub Actions workflow)
5. **Review and merge** the PR to publish the analysis
6. **Jekyll rebuilds** the site with the new analysis data
7. **Case pages updated** to show the AI-generated analysis

## Expected Timeline

| Step | Duration |
|------|----------|
| Workflow starts | Immediate |
| Analysis generation | 5-6 minutes |
| PR creation | ~10 seconds |
| Review & merge | Manual (your time) |
| Site rebuild | 2-3 minutes |
| **Total** | **~10 minutes** (+ your review time) |

## Verifying Success

### Check Workflow Status
1. Go to **Actions** tab
2. Look for "Case Analysis with OpenAI" run
3. Status should be ✅ **Success** (not ❌ Failed)
4. Click on the run to see logs

### Check for Generated Files
1. Look for a new PR titled "AI Analysis: Case Records and Dockets"
2. Review the files changed (should be in `_data/analysis/`)
3. Each case should have a corresponding `.yml` file

### Verify Case Pages
After merging the PR and site rebuild:
1. Visit any case record page (e.g., `/cases/street-crossing-pcr-appeal/`)
2. Scroll to "AI-Generated Analysis" section
3. Should show:
   - 📋 **Judicial Oversight Perspective** (with content)
   - 📰 **Reporter's Commentary** (with content)
   - Not "Analysis pending" placeholder

## Troubleshooting

### Rate Limit Errors
**Symptom:** Workflow fails with HTTP 429 errors

**Solution:** The updated script handles this automatically with retries. If it still fails:
- Wait an hour for rate limits to reset
- Re-run the workflow
- Consider upgrading to a paid OpenAI plan

### No PR Created
**Symptom:** Workflow succeeds but no PR appears

**Possible causes:**
- All cases already have recent analysis (< 7 days old)
- No new analysis was generated due to errors
- Check workflow logs for "⚠ Skipped" messages

### Analysis Still Shows "Pending"
**Symptom:** PR was merged but pages still show placeholder

**Solutions:**
1. Wait for Jekyll to rebuild (check Pages deployment in Actions)
2. Hard refresh the page (Ctrl+F5 or Cmd+Shift+R)
3. Check that YAML files are in `_data/analysis/` directory
4. Verify file naming matches case slugs

## Getting Help

If you encounter issues:

1. **Check workflow logs**: Actions > Case Analysis run > View logs
2. **Review documentation**:
   - ANALYSIS-SYSTEM.md (complete system docs)
   - .github/SETUP-OPENAI.md (API key setup)
3. **Check OpenAI status**: https://status.openai.com/
4. **Verify API credits**: https://platform.openai.com/usage

## Next Steps After First Analysis

- Analysis auto-regenerates every 7 days for updated cases
- Workflow runs automatically when cases/dockets are updated
- You can force re-analysis via manual workflow trigger
- Monitor API usage to manage costs

---

**Quick Action:** Go to [Actions → Case Analysis with OpenAI → Run workflow](../../actions/workflows/case-analysis.yml) to start now!
