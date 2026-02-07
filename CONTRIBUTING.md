# Contributing to the TOGAF Network Capability Model

Thank you for your interest in improving this capability model! This is a living framework that should evolve with technology and business needs.

## How to Contribute

### Types of Contributions

1. **New Capabilities** - Add missing ABBs to any layer
2. **SBB Mappings** - Document real-world implementations
3. **Maturity Criteria** - Improve assessment frameworks
4. **Examples** - Share use cases and lessons learned
5. **Corrections** - Fix errors or outdated information
6. **Enhancements** - Improve clarity and usability

---

## Contribution Process

### 1. Review Existing Content
Before contributing, check if your idea already exists:
- Search `docs/layers/` for similar capabilities
- Review open issues/discussions
- Check the capability coverage matrix in README.md

### 2. Create an Issue (Optional but Recommended)
For major contributions:
- Open an issue describing your proposal
- Get feedback from maintainers
- Refine your approach based on discussion

### 3. Make Your Changes
```bash
# Fork the repository
git clone <your-fork-url>
cd togaf-network-capability-model

# Create a feature branch
git checkout -b feature/add-iot-capability

# Make your changes
# ... edit files ...

# Commit with clear message
git add .
git commit -m "Add IoT Device Connectivity capability to Layer 2"

# Push to your fork
git push origin feature/add-iot-capability
```

### 4. Submit a Pull Request
- Provide clear description of changes
- Explain the rationale (why is this needed?)
- Link to related issues if applicable
- Include examples or use cases

---

## Contribution Guidelines

### Documentation Standards

#### Markdown Formatting
- Use proper heading hierarchy (# for titles, ## for sections)
- Include tables for structured data
- Use code blocks with syntax highlighting
- Keep line length reasonable (<120 chars where possible)

#### Capability Descriptions
When adding new capabilities, use the templates provided in each layer:
- Business Layer: See template in `docs/layers/01-business-layer.md`
- Logical Layer: See template in `docs/layers/02-logical-layer.md`
- etc.

**Required sections**:
- Capability Definition (clear, one-sentence)
- Characteristics or Requirements
- Success Metrics or Quality Attributes
- Use Cases
- Related ABBs

#### ABB Naming Conventions
- Use descriptive names (not acronyms)
- Be consistent with existing naming patterns
- End service ABBs with "Service" or "Connectivity"
- Example: ✅ "IoT Device Connectivity Service" ❌ "IoT-C"

### Technology Neutrality

**Critical Rule**: Layers 1-2 MUST be technology-agnostic

❌ **DON'T**:
- "Implement Cisco SD-WAN for site connectivity" (in Layer 2)
- "Use AWS for cloud services" (in Layer 1)

✅ **DO**:
- "Provide site-to-site connectivity service with <50ms latency" (Layer 2)
- "Enable cloud-based application delivery" (Layer 1)

**Technology-specific content belongs in**:
- Layer 3 (Physical Technologies)
- `docs/mappings/` (SBB implementations)
- `examples/` (reference implementations)

### Financial Services Context

This model is designed for FSI organizations. When adding content:
- Consider regulatory requirements (PCI-DSS, SOX, GDPR, MiFID II)
- Address risk and compliance concerns
- Include security and audit considerations
- Reference industry standards where applicable

### Real-World Evidence

The most valuable contributions include:
- Actual implementations (SBB mappings)
- Measured results (metrics, costs, performance)
- Lessons learned (what worked, what didn't)
- Trade-off analysis (pros/cons of choices)

**Example**: Instead of theoretical vendor comparison, share:
- What you deployed
- Why you chose it
- What it cost (ballpark)
- What you'd do differently

---

## Review Process

### Review Criteria

Pull requests will be reviewed for:

1. **Accuracy**: Technically correct information
2. **Completeness**: All required sections included
3. **Clarity**: Understandable by target audience
4. **TOGAF Alignment**: Follows framework principles
5. **Consistency**: Matches existing style and structure
6. **Value**: Provides useful, actionable content

### Review Roles

| Role | Responsibility |
|------|---------------|
| **Maintainers** | Overall quality and consistency |
| **Subject Matter Experts** | Technical accuracy |
| **Architecture Board** | Strategic alignment |
| **Security Team** | Security implications |

### Timeline

- **Simple changes** (typos, clarifications): 1-3 days
- **New capabilities**: 1-2 weeks
- **Major additions** (new layers, frameworks): 2-4 weeks

---

## Specific Contribution Types

### Adding a New Business Capability (Layer 1)

1. Use the template in `docs/layers/01-business-layer.md`
2. Identify the business driver (what problem does this solve?)
3. Define success metrics (how do we know it's working?)
4. List stakeholders (who cares about this?)
5. Map to logical services (what technical capabilities are needed?)

**Example PR**: "Add 'ESG Reporting Connectivity' to support regulatory reporting"

### Adding a Logical Service (Layer 2)

1. Use the template in `docs/layers/02-logical-layer.md`
2. Define quality attributes (latency, bandwidth, availability targets)
3. Specify service characteristics (technology-agnostic)
4. List use cases (when is this service needed?)
5. Map to business capabilities (what business need does this serve?)

**Example PR**: "Add 'Blockchain Network Connectivity Service' for DeFi integration"

### Documenting an SBB Implementation

1. Use template in `docs/mappings/abb-to-sbb-template.md`
2. Specify which ABB this implements
3. Document product/technology details
4. Include pros/cons and cost
5. Explain your decision rationale
6. Note alternatives considered

**Example PR**: "Add Zscaler ZPA implementation for User-to-Application connectivity"

### Improving Maturity Criteria

1. Edit `assessments/maturity-model.md`
2. Add specific, measurable criteria
3. Provide examples at each level
4. Include industry benchmarks if available

**Example PR**: "Refine SD-WAN maturity levels based on 3-year deployment"

---

## Best Practices

### Do's ✅

- Start with "why" (business need)
- Be specific and measurable
- Provide examples and use cases
- Share real-world costs and metrics
- Document lessons learned
- Update related documents (README, navigation links)
- Test any code or configurations
- Spell-check and proofread

### Don'ts ❌

- Don't add vendor-specific content to Layer 1-2
- Don't use jargon without explanation
- Don't make unsubstantiated claims
- Don't copy-paste vendor marketing
- Don't include proprietary/confidential information
- Don't break existing links and references
- Don't submit incomplete work (use drafts)

---

## Getting Help

### Questions?

- **Technical questions**: Open a discussion
- **Contribution process**: Review this guide or ask maintainers
- **TOGAF concepts**: See [TOGAF documentation](https://www.opengroup.org/togaf)
- **Model usage**: See [QUICKSTART.md](QUICKSTART.md)

### Resources

- TOGAF Standard: https://www.opengroup.org/togaf
- Architecture Capability Framework: https://www.opengroup.org/architectural-capability
- IT4IT Reference Architecture: https://www.opengroup.org/it4it

---

## Recognition

Contributors will be:
- Listed in CONTRIBUTORS.md
- Acknowledged in release notes
- Credited in their pull requests

Significant contributions may be highlighted in documentation.

---

## Code of Conduct

### Our Commitment

We are committed to providing a welcoming and inclusive environment. We expect:

- **Respect**: Treat all contributors with respect
- **Professionalism**: Keep discussions focused and constructive  
- **Collaboration**: Work together toward shared goals
- **Transparency**: Be open about motivations and conflicts of interest

### Unacceptable Behavior

- Harassment or discrimination
- Personal attacks or trolling
- Sharing others' private information
- Unethical or illegal conduct

### Enforcement

Violations should be reported to the maintainers. We reserve the right to remove content or restrict access for violations.

---

## License

By contributing, you agree that your contributions will be covered under the same license as the project.

---

## Thank You!

Your contributions make this model better for everyone. Whether you're fixing a typo or adding a major capability, your effort is appreciated.

---

**Questions?** Open an issue or contact the maintainers.

**Last Updated**: 2026-02-07  
**Version**: 1.0
