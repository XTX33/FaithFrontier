# Repository Governance - Strict Compliance
**FaithFrontier Development Environment**  
*Established: 2025-12-21*

---

## Repository Structure

### Production Repository (Stone)
- **Name**: `faithfrontier-stone`
- **Remote**: `https://github.com/xtx33/faithfrontier-stone.git`
- **Purpose**: Production-ready code only
- **Location**: `C:\Users\Devon Tyler\faithfrontier-stone`
- **Also tracks**: `faithfrontier-main` remote (https://github.com/xtx33/faithfrontier.git) for cross-sync

### Sandbox Repository
- **Name**: `faithfrontier-sandbox`
- **Remote**: `https://github.com/xtx33/faithfrontier-sandbox.git`
- **Upstream**: `https://github.com/xtx33/faithfrontier.git`
- **Purpose**: Development, testing, experimentation
- **Location**: `C:\Users\Devon Tyler\faithfrontier-sandbox`

---

## Governance Rules

### 1. Repository Isolation
- ✅ Sandbox and Stone are completely separate local directories
- ✅ Changes in one environment DO NOT affect the other
- ✅ Explicit action required to transfer code between environments

### 2. Push Protection
**Sandbox Push Rules:**
- Pushes to: `origin` (sandbox repo)
- Pre-push hook warns if attempting to push to non-sandbox remote
- Requires manual confirmation for unexpected remote targets

**Stone Push Rules:**
- Pushes to: `origin` (production repo)
- Pre-push hook REQUIRES confirmation before production push
- Warning message: "⚠️ PRODUCTION PUSH - Confirmed?"

### 3. Git Configuration
**Push Default**: `current`
- Only pushes the current branch being worked on
- Prevents accidental bulk pushes of all branches
- Applied to both sandbox and stone repositories

### 4. Pre-Push Hook Implementation

**Sandbox Hook** (`.git/hooks/pre-push`):
```bash
#!/bin/sh
# Lightweight protection: confirm you're pushing to the right repo
remote="$1"
url="$2"

if [ "$url" != "https://github.com/xtx33/faithfrontier-sandbox.git" ] && [ "$url" != "https://github.com/XTX33/faithfrontier-sandbox.git" ]; then
    echo "⚠️  WARNING: Pushing to non-sandbox repo: $url"
    echo "Expected: faithfrontier-sandbox"
    read -p "Continue? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi
exit 0
```

**Stone Hook** (`.git/hooks/pre-push`):
```bash
#!/bin/sh
# Lightweight protection: confirm you're pushing to production
remote="$1"
url="$2"

if [ "$url" = "https://github.com/xtx33/faithfrontier.git" ] || [ "$url" = "https://github.com/XTX33/faithfrontier.git" ]; then
    echo "⚠️  PRODUCTION PUSH to: $url"
    read -p "Confirmed? This goes to production. (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi
exit 0
```

---

## Workflow Compliance

### Development Workflow
1. **Experiment** in `faithfrontier-sandbox`
2. **Commit** changes locally
3. **Push** to sandbox remote (with confirmation)
4. **Test** thoroughly in sandbox environment
5. **Review** code quality and functionality
6. **Transfer** to stone when production-ready
7. **Push** from stone to production (with explicit confirmation)

### Safety Guarantees
✅ **No accidental production pushes** - Confirmation required  
✅ **No cross-contamination** - Isolated directories  
✅ **No broken merges** - Explicit transfers only  
✅ **Full rollback capability** - Git history preserved  
✅ **Zero development slowdown** - Protections only on push

---

## Command Reference

### Check Repository Status
```bash
# Sandbox
cd "C:\Users\Devon Tyler\faithfrontier-sandbox"
git remote -v
git status

# Stone
cd "C:\Users\Devon Tyler\faithfrontier-stone"
git remote -v
git status
```

### Safe Push Workflow
```bash
# From sandbox
git add .
git commit -m "description"
git push  # → Pushes to sandbox repo with confirmation

# From stone
git add .
git commit -m "description"
git push  # → Pushes to production with explicit confirmation
```

### Update Sandbox from Production
```bash
cd "C:\Users\Devon Tyler\faithfrontier-sandbox"
git fetch upstream
git merge upstream/main
```

---

## Compliance Verification

Run these commands to verify governance compliance:

```powershell
# Verify push configuration
cd "C:\Users\Devon Tyler\faithfrontier-sandbox"
git config push.default  # Should return: current

cd "C:\Users\Devon Tyler\faithfrontier-stone"
git config push.default  # Should return: current

# Verify hooks exist
Test-Path "C:\Users\Devon Tyler\faithfrontier-sandbox\.git\hooks\pre-push"
Test-Path "C:\Users\Devon Tyler\faithfrontier-stone\.git\hooks\pre-push"

# Verify remotes
cd "C:\Users\Devon Tyler\faithfrontier-sandbox"
git remote -v  # Should show origin→sandbox, upstream→production

cd "C:\Users\Devon Tyler\faithfrontier-stone"
git remote -v  # Should show origin→production
```

---

## Enforcement Policy

**MANDATORY COMPLIANCE**:
- All pushes subject to pre-push hook verification
- Production pushes require explicit human confirmation
- No bypass mechanisms permitted
- Hooks must remain intact and executable

**VIOLATION RESPONSE**:
- If wrong-repo push detected → abort immediately
- If hook missing → restore from this document
- If configuration drift → re-run compliance verification

---

## Maintenance

### Restore Hooks After Git Operations
If hooks are removed by git operations:

```bash
# Restore sandbox hook
cat > "C:\Users\Devon Tyler\faithfrontier-sandbox\.git\hooks\pre-push" << 'EOF'
[Copy sandbox hook content from above]
EOF

# Restore stone hook
cat > "C:\Users\Devon Tyler\faithfrontier-stone\.git\hooks\pre-push" << 'EOF'
[Copy stone hook content from above]
EOF
```

### Periodic Compliance Audit
Run monthly:
```bash
cd "C:\Users\Devon Tyler"
.\faithfrontier-sandbox\.git\hooks\pre-push origin https://github.com/xtx33/faithfrontier-sandbox.git
.\faithfrontier-stone\.git\hooks\pre-push origin https://github.com/xtx33/faithfrontier.git
```

---

**Document Version**: 1.0  
**Last Updated**: 2025-12-21  
**Authority**: Internal Repository Governance  
**Status**: ACTIVE - STRICT COMPLIANCE REQUIRED
