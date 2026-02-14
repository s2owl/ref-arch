# ABB to SBB Mapping Template

## Purpose
This template helps you map Architecture Building Blocks (ABBs) - the required capabilities - to Solution Building Blocks (SBBs) - the specific technologies and products you'll use to implement them.

---

## Mapping Principles

1. **One ABB can map to multiple SBBs** - Different technologies for different scenarios
2. **One SBB can realize multiple ABBs** - A product may deliver several capabilities
3. **Document rationale** - Explain why you chose specific SBBs
4. **Include alternatives** - Show what else was considered
5. **Track lifecycle** - Note when SBBs need replacement

---

## Example Mapping: Site-to-Site Connectivity Service

### ABB: Site-to-Site Connectivity Service
**From**: Layer 2 - Logical Connectivity Services

**Requirements Summary**:
- Any-to-any connectivity between sites
- 99.9% availability
- <50ms latency regional, <150ms global
- Private addressing
- QoS support

---

### SBB Option 1: Cisco SD-WAN (vManage + vEdge)

**Vendor**: Cisco  
**Product**: SD-WAN (formerly Viptela)  
**Version**: 20.12 or later

**How it realizes the ABB**:
| ABB Requirement | SBB Implementation |
|-----------------|-------------------|
| Any-to-any connectivity | Full mesh overlay via IPsec tunnels |
| 99.9% availability | Active-active multi-path, automatic failover <1 second |
| Latency targets | Application-aware routing, path selection based on SLA |
| Private addressing | RFC1918 overlay addressing, NAT traversal support |
| QoS support | Application-aware QoS, DSCP marking, queuing policies |

**Underlay Transport**:
- Primary: MPLS (AT&T, Verizon)
- Secondary: DIA (Comcast, Spectrum)
- Tertiary: 4G LTE backup (Verizon)

**Deployment Details**:
- vManage controllers: 3x redundant (AWS us-east-1, us-west-2, on-prem DC)
- vEdge routers: On-premises at each site
- vBond orchestrators: 2x redundant
- vSmart controllers: 3x redundant

**Pros**:
- Proven at scale (1000+ sites)
- Strong integration with existing Cisco infrastructure
- Comprehensive application visibility (NBAR2)
- Cloud on-ramp for AWS, Azure, GCP

**Cons**:
- Higher licensing costs vs. alternatives
- Vendor lock-in to Cisco ecosystem
- Requires expertise for advanced features

**Cost**:
- CapEx: $3,000 per site (hardware)
- OpEx: $1,200 per site annually (licensing)
- Total 3-year TCO: $6,600 per site

**Decision Rationale**:
Selected due to existing Cisco skills, integration with Cisco ACI data centers, and proven deployment at peer institutions.

**Alternatives Considered**:
- VMware VeloCloud: Lower cost but less mature
- Fortinet SD-WAN: Security-first approach, but separate overlay
- Palo Alto Prisma SD-WAN: Strong security, higher cost

**Lifecycle**:
- Deployment: Q2-Q4 2026
- Planned refresh: 2029 (3-year hardware lifecycle)
- Next review: Q1 2029

---

### SBB Option 2: Traditional MPLS (AT&T AVPN)

**Vendor**: AT&T  
**Product**: AVPN (Any-to-any VPN)  
**Service Level**: Platinum

**How it realizes the ABB**:
| ABB Requirement | SBB Implementation |
|-----------------|-------------------|
| Any-to-any connectivity | MPLS Layer 3 VPN (RFC 4364) |
| 99.9% availability | Carrier SLA, dual-homed sites for critical locations |
| Latency targets | AT&T's global backbone, predictable routing |
| Private addressing | Customer VRF with RFC1918 addressing |
| QoS support | 8-class QoS (DSCP-based), guaranteed bandwidth |

**Use Cases**:
- Legacy sites not yet migrated to SD-WAN
- Sites requiring 99.95% SLA (dual-carrier MPLS)
- Locations where SD-WAN underlay not available

**Pros**:
- Carrier-managed, minimal on-site equipment
- Strong SLA with financial penalties
- Proven reliability (10+ years in use)

**Cons**:
- Expensive (2-3x cost of SD-WAN)
- Slow provisioning (45-60 days)
- Inflexible (hard to adjust bandwidth)

**Cost**:
- OpEx: $3,500 per site annually (10Mbps CIR)
- Total 3-year TCO: $10,500 per site

**Decision Rationale**:
Being phased out in favor of SD-WAN, but retained for:
- Critical sites requiring 99.95% SLA
- Locations where dual internet not available
- During SD-WAN migration period (2026-2027)

**Lifecycle**:
- Current: 150 sites on MPLS
- Migration plan: 50 sites per quarter to SD-WAN
- Target: <20 sites on MPLS by end of 2027 (critical only)

---

## Template for Your Mappings

```markdown
### ABB: [Capability Name]
**From**: [Layer X - Layer Name]

**Requirements Summary**:
- [Requirement 1]
- [Requirement 2]
- [Requirement 3]

---

### SBB Option 1: [Product Name]

**Vendor**: [Vendor]  
**Product**: [Product Name]  
**Version**: [Version]

**How it realizes the ABB**:
| ABB Requirement | SBB Implementation |
|-----------------|-------------------|
| [Requirement 1] | [How product delivers this] |
| [Requirement 2] | [How product delivers this] |

**Deployment Details**:
- [Detail 1]
- [Detail 2]

**Pros**:
- [Advantage 1]
- [Advantage 2]

**Cons**:
- [Limitation 1]
- [Limitation 2]

**Cost**:
- CapEx: $[X]
- OpEx: $[Y] annually
- Total 3-year TCO: $[Z]

**Decision Rationale**:
[Why you chose this SBB]

**Alternatives Considered**:
- [Alternative 1]: [Why not selected]
- [Alternative 2]: [Why not selected]

**Lifecycle**:
- Deployment: [Timeline]
- Planned refresh: [Year]
- Next review: [Date]
```

---

## Multi-ABB SBB Example

Some products deliver multiple capabilities:

### SBB: Palo Alto Networks PA-5450 Firewall

**Realizes Multiple ABBs**:

1. **Network Security Control** (Layer 4)
   - Next-gen firewall with application visibility
   - Intrusion prevention (IPS)
   - URL filtering and threat prevention

2. **Network Segmentation & Isolation** (Layer 5)
   - Virtual systems for multi-tenancy
   - Zone-based security policies
   - Micro-segmentation via VM-Series

3. **Traffic Protection (Encryption)** (Layer 5)
   - SSL/TLS decryption and inspection
   - IPsec VPN termination
   - Certificate management

**How one product addresses multiple capabilities**:
This is common with platforms (e.g., firewalls, SD-WAN controllers, cloud networking) that provide multiple functions. Document all ABBs that each SBB delivers.

---

## Mapping Governance

### Review Process
1. **Quarterly Review**: Check if SBBs still meet ABB requirements
2. **Annual Assessment**: Evaluate alternatives, cost optimization
3. **Ad-hoc Updates**: Technology changes, vendor acquisitions, EOL notices

### Change Control
- **Minor Changes** (version upgrades): Network team approval
- **Major Changes** (new SBB selection): Architecture review board approval
- **Strategic Changes** (vendor switch): CTO and CFO approval

### Documentation Requirements
- Keep mapping current (update within 30 days of changes)
- Document all alternatives considered (even if rejected)
- Track actual vs. projected costs
- Record lessons learned

---

## ABB Coverage Matrix

Use this to ensure all ABBs are covered by at least one SBB:

| ABB | Layer | SBB(s) | Status | Owner |
|-----|-------|--------|--------|-------|
| Site-to-Site Connectivity | 2 | Cisco SD-WAN, AT&T MPLS | ✅ In Production | Network Eng |
| Site-to-Cloud Connectivity | 2 | AWS Direct Connect, Azure ExpressRoute | ✅ In Production | Cloud Eng |
| User-to-Application | 2 | Zscaler ZPA | ✅ In Production | Security Eng |
| Device-to-Network | 2 | Cisco ISE | ✅ In Production | Network Eng |
| Inter-Cloud | 2 | Megaport MCR | ⚠️ In Pilot | Cloud Eng |
| Market Data Connectivity | 2 | Microwave + Fiber | ✅ In Production | Trading Tech |
| ... | ... | ... | ... | ... |

**Legend**:
- ✅ In Production
- ⚠️ In Pilot / Testing
- 🔄 In Procurement
- 📋 Planned
- ❌ Gap (no SBB identified)

---

## Cost Rollup

Track total cost of all SBBs to understand network TCO:

### By ABB
| ABB | Annual Cost | Notes |
|-----|-------------|-------|
| Site-to-Site Connectivity | $2.4M | SD-WAN + MPLS + DIA circuits |
| Site-to-Cloud Connectivity | $800K | Direct Connect + ExpressRoute |
| User-to-Application | $600K | Zscaler licensing |
| ... | ... | ... |
| **TOTAL** | **$X.XM** | |

### By Vendor
| Vendor | Annual Spend | % of Total | Concentration Risk |
|--------|--------------|------------|-------------------|
| Cisco | $3.2M | 35% | ⚠️ High |
| AT&T | $2.1M | 23% | ⚠️ High |
| AWS | $1.5M | 16% | Medium |
| Zscaler | $600K | 7% | Low |
| ... | ... | ... | ... |

**Risk Mitigation**:
- Concentration >30% with single vendor = risk
- Plan multi-vendor strategy for critical capabilities
- Negotiate enterprise agreements for volume discounts

---

**Navigation**:
- ← Previous: [README](../../README.md)
- → Next: [Vendor Evaluation Criteria](../governance/vendor-evaluation.md)
