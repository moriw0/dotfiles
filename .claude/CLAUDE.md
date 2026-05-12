## Core Philosophy

You are Claude Code. I use specialized agents and skills for complex tasks.

**Key Principles:**
1. **Agent-First**: Delegate to specialized agents for complex work
2. **Parallel Execution**: Use Task tool with multiple agents when possible
3. **Plan Before Execute**: Use Plan Mode for complex operations
4. **Test-Driven**: Write tests before implementation
5. **Security-First**: Never compromise on security

---

## Modular Rules

Detailed guidelines are in `~/.claude/rules/`:

| Rule File | Contents |
|-----------|----------|
| security.md | Security checks, secret management |
| coding-style.md | Immutability, file organization, error handling |
| testing.md | TDD workflow, 80% coverage requirement |
| git-workflow.md | Commit format, PR workflow |
| agents.md | Agent orchestration, when to use which agent |
| patterns.md | API response, repository patterns |
| performance.md | Model selection, context management |
| hooks.md | Hooks System |

---

## Available Agents

Provided by the `everything-claude-code` plugin. Source: `~/.claude/plugins/cache/everything-claude-code/everything-claude-code/<version>/agents/`.

| Agent | Purpose |
|-------|---------|
| `everything-claude-code:planner` | Feature implementation planning |
| `everything-claude-code:architect` | System design and architecture |
| `everything-claude-code:tdd-guide` | Test-driven development |
| `everything-claude-code:code-reviewer` | Code review for quality/security |
| `everything-claude-code:security-reviewer` | Security vulnerability analysis |
| `everything-claude-code:build-error-resolver` | Build error resolution |
| `everything-claude-code:e2e-runner` | Playwright E2E testing |
| `everything-claude-code:refactor-cleaner` | Dead code cleanup |
| `everything-claude-code:doc-updater` | Documentation updates |

---

## Available Commands

- `/tdd` - Test-driven development workflow
- `/plan` - Create implementation plan
- `/code-review` - Review code quality
- `/build-fix` - Fix build errors

## Personal Preferences

### Privacy
- Always redact logs; never paste secrets (API keys/tokens/passwords/JWTs)
- Review output before sharing - remove any sensitive data

### Code Style
- No emojis in code, comments, or documentation
- Prefer immutability - never mutate objects or arrays
- Many small files over few large files
- 200-400 lines typical, 800 max per file

### Git
- Conventional commits: `feat:`, `fix:`, `refactor:`, `docs:`, `test:`
- Always test locally before committing
- Small, focused commits

### Testing
- TDD: Write tests first
- 80% minimum coverage
- Unit + integration + E2E for critical flows

---

## Editor Integration

I use RubyMine as my primary editor:
- Vim mode enabled

---

## Success Metrics

You are successful when:
- All tests pass (80%+ coverage)
- No security vulnerabilities
- Code is readable and maintainable
- User requirements are met

---

**Philosophy**: Agent-first design, parallel execution, plan before action, test before code, security always.
