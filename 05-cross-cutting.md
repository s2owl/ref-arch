# Layer 5: Cross-Cutting Capabilities

**Purpose**: Define capabilities that apply horizontally across ALL other layers.

These are not separate layers but concerns that must be addressed at every level of the architecture.

---

## Overview

Cross-cutting capabilities are sometimes called "aspects" or "overlays". They include:

- **Security**: Applied at business, logical, physical, and control layers
- **Observability**: Monitoring and visibility at all layers  
- **Lifecycle Management**: Planning and optimization across the stack

---

## Security Overlay

### Network Access Control
Applied at:
- Business: Access policies and governance
- Logical: Identity-based access services
- Physical: 802.1X, NAC appliances
- Control: AAA integration

### Traffic Protection
Applied at:
- Business: Data classification and protection requirements
- Logical: Encryption service definitions
- Physical: TLS, IPsec, MACsec implementations
- Control: Certificate and key management

### Threat Prevention
Applied at:
- Business: Risk tolerance and security policies
- Logical: Threat detection services
- Physical: IDS/IPS, firewalls, DDoS mitigation
- Control: Threat intelligence integration

### Segmentation & Isolation
Applied at:
- Business: Compliance zones (PCI, GDPR)
- Logical: Segment definitions
- Physical: VLANs, VRFs, VXLANs
- Control: Policy enforcement points

---

## Observability Overlay

### Performance Monitoring
Applied at all layers to track health and performance

### Flow Analytics  
Applied to understand traffic patterns and detect anomalies

### Fault Detection
Applied for proactive issue identification

### Diagnostics
Applied for root cause analysis and troubleshooting

---

## Lifecycle Management Overlay

### Capacity Planning
Applied to predict and provision capacity

### Cost Optimization
Applied to minimize TCO while meeting requirements

### Technology Lifecycle
Applied to manage currency and plan refreshes

### Configuration Management
Applied to track and control changes

---

**Status**: This layer is under active development.

---

**Navigation**:
- ← Previous: [Layer 4: Control Plane](04-control-plane.md)
- → Next: [Governance](../../governance/)
