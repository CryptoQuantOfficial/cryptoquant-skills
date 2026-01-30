# Contributing to CryptoQuant Plugin

Thank you for your interest in contributing to CryptoQuant Plugin for Claude! This guide will help you get started.

## Getting Started

### Prerequisites

- [CryptoQuant API key](https://cryptoquant.com/settings/api)
- Claude Code CLI

### Local Development Setup

```bash
# Clone the repository
git clone https://github.com/CryptoQuantOfficial/cryptoquant-skills.git
cd cryptoquant-skills

# Run with Claude Code
claude
```

## Project Structure

```
cryptoquant-skills/
├── .claude-plugin/  # Plugin configuration
├── skills/          # Claude Skills (SKILL.md files)
├── agents/          # Specialized analysis agents
└── hooks/           # Lifecycle hooks
```

## How to Contribute

### Reporting Issues

- Use [GitHub Issues](https://github.com/CryptoQuantOfficial/cryptoquant-skills/issues)
- Include steps to reproduce
- Provide error messages and logs

### Submitting Changes

1. Fork the repository
2. Create a feature branch: `git checkout -b feat/your-feature`
3. Make your changes
4. Test locally with Claude Code
5. Commit with conventional commits: `feat:`, `fix:`, `docs:`, `refactor:`
6. Push and create a Pull Request

### Contribution Areas

#### Skills & Agents
- Add new intent mappings in `skills/crypto/INTENT_MAP.md`
- Create new agents in `agents/`
- Improve metric interpretations in `skills/crypto/INTERPRETATION.md`

#### Documentation
- Improve README.md
- Add examples and tutorials

## Commit Convention

```
feat: add new feature
fix: bug fix
docs: documentation update
refactor: code refactoring
```

## Questions?

- Open an [issue](https://github.com/CryptoQuantOfficial/cryptoquant-skills/issues)
- Check existing issues for similar questions

## MCP Server

The MCP server is maintained in a separate repository: [@cryptoquant_official/mcp](https://www.npmjs.com/package/@cryptoquant_official/mcp)

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
