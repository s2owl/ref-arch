# Layer 2: Logical Connectivity Services

**Purpose**: Define WHAT connectivity services are needed, independent of specific technologies.

**Characteristics**:
- Technology-agnostic service definitions
- Implementation-neutral
- Quality attribute specifications
- Service-level contracts

---

## Site-to-Site Connectivity Service [ABB]

### Service Definition
Any-to-any connectivity between enterprise locations with predictable performance and secure transport.

### Service Characteristics
- **Topology**: Full mesh, hub-spoke, or hybrid
- **Geographic Reach**: Global coverage
- **Bandwidth Range**: 100Mbps to 100Gbps per site
- **Addressing**: Private (RFC1918) or public
- **Protocol Support**: IP-based (IPv4, IPv6)
- **Routing**: Dynamic (internal) or static

### Quality Attributes

| Attribute | Target | Measurement Method |
|-----------|--------|-------------------|
| Latency | <50ms regional, <150ms global | 95th percentile one-way |
| Packet Loss | <0.1% | Monthly average |
| Jitter | <10ms | 95th percentile |
| Availability | 99.9% | Monthly uptime |
| Bandwidth Guarantee | 100% of committed rate | Burstable to port speed |

### Service Interfaces
- **Network Layer**: IP routing (BGP, OSPF, static)
- **Access Methods**: Ethernet handoff, IP/MPLS, SD-WAN overlay
- **Management**: SNMP, NetFlow, Syslog

### Security Requirements
- Private addressing and routing
- Optional encryption (IPsec, MACsec)
- ACL support at network edge
- DDoS mitigation capability

### Use Cases
- Office-to-office communications
- Data center to branch connectivity
- VoIP/video conferencing transport
- Centralized application access

### Service Level Agreement (SLA)
- Availability: 99.9% monthly uptime guarantee
- Latency: 95th percentile targets per table above
- MTTR: <4 hours for service-affecting issues
- Provisioning: <30 days for new sites

### Related ABBs
- Quality of Service Management (control plane)
- Network Security Control (security overlay)
- Business Continuity Connectivity (resilience requirements)

---

## Site-to-Cloud Connectivity Service [ABB]

### Service Definition
Private, high-performance connectivity from enterprise sites to cloud service provider networks.

### Service Characteristics
- **Cloud Providers**: AWS, Azure, GCP, Oracle Cloud
- **Connection Types**: Dedicated, hosted, or partner-facilitated
- **Bandwidth Range**: 50Mbps to 100Gbps
- **Routing**: BGP with private peering
- **Multi-cloud Support**: Single connection to multiple clouds via exchange

### Quality Attributes

| Attribute | Target | Measurement Method |
|-----------|--------|-------------------|
| Latency | <10ms to nearest cloud PoP | 95th percentile one-way |
| Packet Loss | <0.05% | Monthly average |
| Availability | 99.95% | Monthly uptime |
| Bandwidth | Committed Information Rate (CIR) | Guaranteed minimum |

### Service Interfaces
- **Network Layer**: BGP routing to cloud VPCs/VNets
- **Access Methods**: Dedicated cross-connect, Layer 2/3 VPN
- **VLAN Support**: 802.1Q tagging for multiple VPCs

### Security Requirements
- Private routing (no internet transit)
- Customer-controlled BGP sessions
- Encryption optional (customer responsibility at app layer)
- Network ACLs and security groups integration

### Use Cases
- Hybrid cloud workloads
- Cloud backup and disaster recovery
- Data migration to cloud
- SaaS application acceleration

### Cost Optimization Features
- Burstable bandwidth (pay for average, burst to max)
- Regional egress cost reduction
- Multi-cloud aggregation (single connection)

### Related ABBs
- Inter-Cloud Connectivity Service (cloud-to-cloud)
- Hybrid Cloud Networking (technology layer)
- Cost Optimization (lifecycle overlay)

---

## User-to-Application Connectivity Service [ABB]

### Service Definition
Secure, seamless connectivity for users to access applications regardless of location, device, or network.

### Service Characteristics
- **Device Independence**: Laptop, mobile, tablet, thin client
- **Location Independence**: Office, home, travel, guest networks
- **Authentication**: Identity-based (SSO integration)
- **Access Control**: Application-level granularity
- **Protocol Support**: HTTPS, RDP, SSH, custom applications

### Quality Attributes

| Attribute | Target | Measurement Method |
|-----------|--------|-------------------|
| Application Response Time | <200ms | 95th percentile end-to-end |
| Connection Establishment | <10 seconds | Average time to productive |
| Availability | 99.9% | Monthly uptime |
| Concurrent Users | 50,000+ | Platform capacity |
| Global Coverage | <50ms to nearest PoP | Latency from user |

### Service Interfaces
- **Client Software**: Native apps (Windows, macOS, iOS, Android) or clientless (browser)
- **Authentication**: SAML, OAuth, MFA integration
- **Split Tunneling**: Configurable per application

### Security Requirements
- Zero-trust architecture principles
- Device posture assessment
- Continuous authentication and authorization
- Data loss prevention (DLP) integration
- TLS 1.3 encryption mandatory

### Use Cases
- Remote worker access to corporate applications
- Contractor and partner access
- BYOD (Bring Your Own Device) scenarios
- Secure access to SaaS and private apps

### User Experience Requirements
- Transparent to user (minimal login prompts)
- Automatic reconnection on network changes
- Offline credential caching
- Performance equivalent to on-premises access

### Related ABBs
- Identity & Access Control (security overlay)
- Application Delivery Service (logical layer)
- Zero Trust Network Access (security architecture)

---

## Device-to-Network Connectivity Service [ABB]

### Service Definition
Zero-touch onboarding and automatic policy enforcement for devices joining the enterprise network.

### Service Characteristics
- **Device Types**: Corporate-managed, BYOD, IoT, guests
- **Provisioning**: Zero-touch, certificate-based, or NAC
- **Policy Enforcement**: Automatic VLAN/segment assignment
- **Quarantine**: Non-compliant device isolation
- **Visibility**: Real-time device inventory

### Quality Attributes

| Attribute | Target | Measurement Method |
|-----------|--------|-------------------|
| Connection Time | <30 seconds | From plug-in to network access |
| Concurrent Devices | 10,000+ per site | Platform scalability |
| Authentication Success | >99% | First-attempt success rate |
| Policy Accuracy | 100% | Correct segment assignment |

### Service Interfaces
- **Wired Access**: 802.1X on Ethernet ports
- **Wireless Access**: WPA3-Enterprise on Wi-Fi
- **Device Profiling**: Passive (fingerprinting) and active (queries)

### Security Requirements
- Mutual authentication (device and network)
- Certificate-based for managed devices
- Sponsor approval for guests
- Posture assessment (OS version, antivirus, encryption)
- Automated quarantine and remediation

### Use Cases
- Employee laptop onboarding
- Corporate mobile device connectivity
- IoT device registration (printers, cameras, sensors)
- Guest Wi-Fi access with isolation

### Policy Framework
- Role-based access (employee, contractor, guest)
- Device type-based (corporate, BYOD, IoT)
- Time-based access (business hours, temporary)
- Location-based (campus, branch, remote)

### Related ABBs
- Network Access Control (security overlay)
- Identity & Access Control (cross-cutting)
- Campus Wireless Connectivity (physical layer)

---

## Inter-Cloud Connectivity Service [ABB]

### Service Definition
Private, high-bandwidth connectivity between different cloud platforms for workload portability and multi-cloud architectures.

### Service Characteristics
- **Cloud-to-Cloud**: Direct connectivity without enterprise transit
- **Providers Supported**: AWS ↔ Azure, GCP ↔ AWS, etc.
- **Routing**: Private BGP peering
- **Multi-Region**: Support for geographically distributed clouds

### Quality Attributes

| Attribute | Target | Measurement Method |
|-----------|--------|-------------------|
| Latency | <20ms intra-region, <100ms cross-region | 95th percentile |
| Bandwidth | 10Gbps minimum | Scalable to 100Gbps |
| Availability | 99.95% | Monthly uptime |
| Encryption | TLS 1.3 or IPsec | In-transit protection |

### Service Interfaces
- **Routing Protocol**: BGP (eBGP between clouds)
- **Access Method**: Cloud exchange, direct peering, or VPN
- **Addressing**: Private (RFC1918) or cloud-native

### Use Cases
- Multi-cloud disaster recovery
- Cloud bursting and workload migration
- Data replication between cloud environments
- Multi-cloud applications (e.g., data in Azure, compute in AWS)

### Cost Optimization
- Avoid double-egress charges
- Regional data transfer optimization
- Committed use discounts

### Related ABBs
- Site-to-Cloud Connectivity Service (enterprise to cloud)
- Multi-Cloud Application Support (application layer)
- Cloud Interconnection (physical layer)

---

## Market Data Connectivity Service [ABB]

### Service Definition
Ultra-low latency connectivity to trading venues and market data providers with deterministic performance.

### Service Characteristics
- **Exchange Connectivity**: Direct connections to major exchanges
- **Feed Types**: Multicast market data, FIX order entry
- **Redundancy**: A+B feeds (primary and backup)
- **Time Synchronization**: PTP (IEEE 1588) with nanosecond precision
- **Determinism**: Consistent, predictable latency

### Quality Attributes

| Attribute | Target | Measurement Method |
|-----------|--------|-------------------|
| Latency | <500 microseconds one-way | Hardware timestamping |
| Jitter | <10 microseconds | 99.9th percentile |
| Availability | 99.999% during market hours | Market hours only |
| Message Loss | 0 tolerance | Sequence gap detection |
| Time Sync Accuracy | ±100 nanoseconds | PTP monitoring |

### Service Interfaces
- **Protocols**: FIX, ITCH, OUCH, proprietary exchange protocols
- **Transport**: Multicast UDP (market data), TCP (orders)
- **Time Distribution**: PTP Grandmaster with GPS reference

### Security Requirements
- Dedicated network segments (no shared infrastructure)
- Physical security (locked cross-connects)
- Change control (no changes during market hours)
- Audit logging of all access

### Use Cases
- High-frequency trading order submission
- Market data feed distribution to trading systems
- Exchange connectivity for market makers
- Co-location to exchange matching engines

### Performance Optimization
- Direct fiber routes (shortest path)
- Hardware-based packet processing (FPGA, ASIC)
- Kernel bypass networking (DPDK, Solarflare)
- RDMA over Converged Ethernet (RoCE)

### Related ABBs
- Trading & Markets Connectivity (business layer)
- Ultra-Low Latency Connectivity (physical layer)
- Time Synchronization Service (technical layer)

---

## Template for New Logical Services

```markdown
## [Service Name] [ABB]

### Service Definition
[One-sentence definition of what this service provides]

### Service Characteristics
- [Characteristic 1]
- [Characteristic 2]
- [Characteristic 3]

### Quality Attributes

| Attribute | Target | Measurement Method |
|-----------|--------|-------------------|
| [Attribute 1] | [Target] | [Method] |
| [Attribute 2] | [Target] | [Method] |

### Service Interfaces
- [Interface type 1]
- [Interface type 2]

### Security Requirements
- [Requirement 1]
- [Requirement 2]

### Use Cases
- [Use case 1]
- [Use case 2]

### Related ABBs
- [Related capability 1]
- [Related capability 2]
```

---

**Navigation**:
- ← Previous: [Layer 1: Business Layer](01-business-layer.md)
- → Next: [Layer 3: Physical Technologies](03-physical-layer.md)
