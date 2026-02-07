# Quick Start Guide

## Getting Started with the TOGAF Network Capability Model

This guide will help you get up and running with the capability model in 30 minutes.

---

## Step 1: Understand the Structure (5 minutes)

### The 5 Layers
The model is organized into 5 layers, each answering a different question:

1. **Business Layer** (WHY) - What business outcomes do we need?
2. **Logical Layer** (WHAT) - What services do we need to provide?
3. **Physical Layer** (HOW) - What technologies will we use?
4. **Control Plane** (INTELLIGENCE) - How do we automate and manage?
5. **Cross-Cutting** (OVERLAYS) - What concerns apply to everything?

**Key Insight**: Don't confuse layers with network layers (OSI model). These are architectural abstraction layers.

---

## Step 2: Explore the Visualization (5 minutes)

1. Open `visualizations/capability-map.html` in your web browser
2. Click "Expand All Layers" to see all capabilities
3. Note how capabilities flow from business needs → services → technologies
4. Observe that Layer 5 (Cross-Cutting) applies to ALL other layers

---

## Step 3: Read Layer 1 Documentation (10 minutes)

1. Open `docs/layers/01-business-layer.md`
2. Pick one business capability that resonates with your organization
3. Note the structure:
   - **Business Drivers**: Why this matters
   - **Business Outcomes**: What success looks like
   - **Success Metrics**: How to measure it
   - **Stakeholders**: Who cares about this

**Example**: If you support trading operations, read "Trading & Markets Connectivity"

---

## Step 4: Map to Your Environment (10 minutes)

1. Open `docs/mappings/abb-to-sbb-template.md`
2. Find the "Example Mapping: Site-to-Site Connectivity Service"
3. Compare the example to your own network:
   - What ABB (capability) do you need?
   - What SBB (product/technology) do you use?
   - Why did you choose it?

**Exercise**: Fill in the template for ONE capability you currently have deployed.

---

## Next Steps

### For Different Roles:

#### Enterprise Architects
**Goal**: Align network capabilities with business strategy

1. Review ALL of Layer 1 (Business Capabilities)
2. Identify which capabilities are critical for your organization
3. Read `assessments/maturity-model.md`
4. Assess current maturity of 2-3 critical capabilities
5. Create a roadmap to improve maturity

**Time**: 2-4 hours

---

#### Solution Architects
**Goal**: Map capabilities to specific technologies

1. Review Layer 2 (Logical Services) for capabilities you need to deliver
2. Read Layer 3 (Physical Technologies) for implementation options
3. Open `docs/mappings/abb-to-sbb-template.md`
4. Document your ABB → SBB mappings for 5-10 key capabilities
5. Include cost, pros/cons, and rationale

**Time**: 4-8 hours

---

#### Network Engineers
**Goal**: Understand how your work supports business outcomes

1. Find a technology you work with in Layer 3 (Physical Technologies)
2. Trace backward to Layer 2 to see what logical service it provides
3. Trace backward to Layer 1 to see what business outcome it enables
4. Share this with your team to build business context

**Time**: 1 hour

---

#### Technology Managers
**Goal**: Evaluate vendors and build business cases

1. Review `docs/governance/vendor-evaluation.md` (when available)
2. For your next vendor evaluation:
   - Start with Layer 1: What business capability do we need?
   - Define requirements using Layer 2 (logical services, quality attributes)
   - Evaluate vendors against ABB requirements, not feature checklists
3. Use the TCO analysis from `docs/mappings/abb-to-sbb-template.md`

**Time**: Ongoing (use as framework for vendor evaluations)

---

## Common Questions

### Q: Do I need to implement all 5 layers?
**A**: You already have! The layers are a way to ORGANIZE your thinking, not separate things to build. Your existing network has business drivers (Layer 1), delivers services (Layer 2), uses technologies (Layer 3), has routing/automation (Layer 4), and has security/monitoring (Layer 5).

### Q: Should every capability be at Level 5 maturity?
**A**: No! Focus on Level 3 (Defined/Standardized) for most capabilities. Reserve Level 4-5 for strategic/critical capabilities. See `assessments/maturity-model.md`.

### Q: How is this different from a network design document?
**A**: A network design document describes HOW your network is built (Layer 3-4). This model starts with WHY (Layer 1) and helps you make better technology choices by being clear about the business outcomes you're trying to achieve.

### Q: Can I customize this model?
**A**: Absolutely! This is a template. Add capabilities specific to your business, remove ones that don't apply, adjust maturity criteria to your context.

### Q: What's the difference between ABB and SBB again?
**A**: 
- **ABB** (Architecture Building Block): The capability you need (e.g., "Site-to-Site Connectivity Service")
- **SBB** (Solution Building Block): The specific product/technology (e.g., "Cisco SD-WAN" or "AT&T MPLS")

Think: ABB = "We need a car", SBB = "We'll buy a Toyota Camry"

---

## Recommended Learning Path

### Week 1: Understand the Model
- Read README.md
- Explore visualization
- Read one capability from each layer

### Week 2: Assess Current State
- Pick 3-5 critical capabilities
- Assess maturity using `assessments/maturity-model.md`
- Identify gaps

### Week 3: Document Your Implementation
- Use `docs/mappings/abb-to-sbb-template.md`
- Document your ABB → SBB mappings
- Calculate TCO

### Week 4: Plan Improvements
- Prioritize capability gaps
- Create improvement roadmap
- Present to stakeholders

---

## Resources

- **Full Documentation**: See `docs/layers/` for detailed capability descriptions
- **Maturity Assessment**: `assessments/maturity-model.md`
- **ABB → SBB Mapping**: `docs/mappings/abb-to-sbb-template.md`
- **TOGAF Reference**: https://www.opengroup.org/togaf

---

## Getting Help

### Internal Resources
- Enterprise Architecture team
- Network Architecture team
- Your architecture review board

### External Resources
- TOGAF documentation and certification
- Network vendor architecture teams
- Industry peer networks (FSI CTO forums)

---

## Contribution

Found a gap? Have a suggestion? See [CONTRIBUTING.md](CONTRIBUTING.md) for how to propose changes.

---

**Last Updated**: 2026-02-07  
**Version**: 1.0
