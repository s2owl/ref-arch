# Network Architecture Patterns

Common architectural patterns for network connectivity in financial services.

---

## Pattern 1: Hub-and-Spoke WAN

### Context
- Centralized data centers
- Many small branch offices
- Traffic primarily branch-to-datacenter

### Solution
```
               [Data Center 1]
                     |
          [Regional Hub 1] --- [Regional Hub 2]
           /    |    \          /    |    \
      [B1] [B2] [B3]       [B4] [B5] [B6]
```

### When to Use
- Centralized applications
- Cost-sensitive branch connectivity
- Predictable traffic patterns

---

## Pattern 2: Active-Active Multi-Region

### Context
- 24/7 global operations
- Require <5min RTO
- High-value applications

### Solution
```
[Region 1 DC]  ←→  [Region 2 DC]
     ↕                  ↕
  [Users]            [Users]
```

### When to Use
- Trading systems
- Critical infrastructure
- Regulatory requirements for resilience

---

**More patterns coming soon...**
