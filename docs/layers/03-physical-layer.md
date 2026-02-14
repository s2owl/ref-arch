# Layer 3: Physical Connectivity Technologies

**Purpose**: Define HOW logical services are physically delivered using specific technologies (Solution Building Blocks).

This layer contains the actual products, protocols, and technologies that implement the logical services defined in Layer 2.

---

## Overview

Layer 3 is where we transition from "what" to "how". Each physical technology listed here should map to one or more logical services from Layer 2.

**Key Characteristics**:
- Vendor-specific products allowed
- Specific protocols and standards
- Implementation details
- Technology specifications

---

## Physical Technology Categories

### Fixed Connectivity
- MPLS (Multi-Protocol Label Switching)
- Point-to-Point Ethernet
- Dark Fiber / DWDM
- SD-WAN platforms
- Direct Internet Access (DIA)

### Wireless Connectivity
- Wi-Fi 6/6E/7 (802.11ax/be)
- 5G/LTE cellular
- Private 5G (CBRS)
- LEO Satellite (Starlink, OneWeb)
- Microwave / mmWave

### Cloud Connectivity
- AWS Direct Connect
- Azure ExpressRoute
- Google Cloud Interconnect
- Oracle FastConnect

### Specialized Technologies
- RDMA over Converged Ethernet (RoCE)
- InfiniBand
- Fiber Channel
- Precision Time Protocol (PTP)

---

## Documentation Template

For each physical technology, document:

```markdown
## [Technology Name]

### Description
[What this technology is]

### Specifications
- Protocol: [e.g., MPLS RFC 4364]
- Speed Range: [e.g., 10Mbps - 10Gbps]
- Distance: [e.g., Metro, Long-haul]
- Standards: [e.g., IEEE 802.11ax]

### Maps to Logical Services (Layer 2)
- [Logical Service Name 1]
- [Logical Service Name 2]

### Use Cases
- [Use case 1]
- [Use case 2]

### Pros & Cons
**Pros**:
- [Advantage 1]
- [Advantage 2]

**Cons**:
- [Limitation 1]
- [Limitation 2]

### Cost Considerations
- [Cost model: CapEx, OpEx, per-site, per-GB, etc.]

### Vendor Landscape
- [Vendor 1]: [Product]
- [Vendor 2]: [Product]
```

---

**Status**: This layer is under active development. See `docs/mappings/abb-to-sbb-template.md` for implementation examples.

---

**Navigation**:
- ← Previous: [Layer 2: Logical Services](02-logical-layer.md)
- → Next: [Layer 4: Control Plane](04-control-plane.md)
