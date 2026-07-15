# AI-Assisted Architecture Governance — Business Case

**Prepared by:** Principal Network Architect
**Status:** Draft for review / funding conversation

---

## 1. Business Problem

The network estate (branches, campuses, headend, DDoS capability — ~70 sites spanning single-ATM/cellular through 10G-fibre campuses) has no scalable way to answer three questions that matter to both operational risk and regulatory posture:

1. **Does implementation match design?** Config drift between what a CBB specifies and what's actually deployed is currently only caught by manual review or incident.
2. **Is the same requirement solved consistently across the estate?** Divergent assembly of the same capability (e.g. Segmentation, IAM) across different sites is invisible today — nobody can query it.
3. **Can we evidence requirement-to-implementation fidelity to a regulator on demand?** DORA Article 8 and PRA SS2/21 both expect demonstrable, current understanding of the estate's dependency and control posture — not a point-in-time manual audit reconstructed under pressure.

**Who experiences this problem:** the Principal Architect (audit/evidence burden, inability to systematically validate the estate), GCB3 platform leads (blind spots in their own platforms' consistency), and ultimately the Networks MD (regulatory exposure if a concentration-risk or inconsistent-control-posture finding surfaces via external audit rather than internal detection).

**Cost of not solving it:**
- Audit/evidence preparation remains manual and reactive — labour-intensive every cycle, not continuously assured
- Config drift and hardware-constrained gaps (e.g. NLB/firewall hairpin patterns) go untracked until they cause an incident or fail an external audit
- No way to demonstrate to a regulator that architecture *interpretation* and engineering *implementation* stay aligned over time, which is the substance of what DORA/PRA are testing for

---

## 2. Quantified Impact

*Figures below are structured as a model to populate with real organisational data — placeholders are marked. Recommend validating with Finance/Ops before external use.*

| Impact area | Current state (estimate) | With capability | Basis |
|---|---|---|---|
| Manual audit-evidence preparation per cycle | **[X] person-days** across architecture + platform leads | Reduced to review/exception-handling only | Structured evaluation output replaces manual evidence assembly |
| Time to detect config drift from design | **[X] weeks/months**, typically incident-triggered | Near-continuous (batch-run cadence, e.g. weekly) | Automated CBB-vs-config diff |
| Sites with undetected capability divergence | **Unknown** (no current visibility) | Fully queryable across estate | Direct output of the divergence-detection layer |
| Cost of a regulator-identified (vs self-identified) finding | **High** — reputational + potential remediation-under-scrutiny cost | Self-identified, remediation on architecture's own timeline | Standard regulatory-relations principle: self-reported gaps are treated more favourably than externally discovered ones |
| Headcount currently required for systematic estate review | **1 (single contributor, capacity-constrained)** | Same headcount, materially higher review throughput | AI absorbs classification/comparison; human retains judgement/escalation |

**Recommended next step for this section:** pull actual person-days from the last 2–3 audit cycles (Architecture + platform-lead time) to replace the placeholder — this is the single most persuasive number for a funding conversation and is likely already available from prior audit retrospectives.

---

## 3. Use Case

**Primary use case:** Evaluate network design/config against governed architecture building blocks (ABB → VSBB → CBB) and regulatory mandates, at estate scale, to produce (a) a compliance/evidence output and (b) a divergence finding showing where the same requirement has been implemented inconsistently.

**User stories:**

- As the Principal Architect, I want to validate actual config against the CBB it should implement, so that I can catch drift (e.g. erroneous route redistribution) before it becomes an incident or audit finding.
- As the Principal Architect, I want to query capability consistency (e.g. Segmentation) across all sites in the same band, so that I can identify divergent implementations that represent inconsistent control posture.
- As a GCB3 platform lead, I want to see where my platform's implementation compares to equivalent sites elsewhere in the estate, so that I understand my own exposure without it reading as a personal audit.
- As the Networks MD, I want a defensible, regulator-facing answer to "how consistently do we implement our own requirements," so that I can demonstrate the estate is understood and controlled, not just individually compliant.
- As the Principal Architect, I want the tool to distinguish legitimate band-driven design variation from true divergence, so that findings are credible and not dismissed as "you're just flagging normal differences."

**Out of scope for this use case (see Non-Goals):**
- Live/real-time telemetry augmentation (separate, ops-owned initiative)
- Standard-inference (inferring *why* a config looks the way it does) — treated as a human-reviewed hypothesis generator only, never a stated finding
- Multi-DC core / unbounded topology reconstruction

---

## 4. Success Criteria

**Leading indicators (weeks):**
- Pipeline successfully classifies a curated subset of sites (target: 10–15) against ABB/VSBB/CBB with **[X]% agreement** on manual spot-check
- At least one genuine, previously undetected config deviation or divergence surfaced and confirmed by manual review
- Live query segment answers **[N] pre-tested questions** correctly and traceably to source ABB/DP in the workshop rehearsal

**Lagging indicators (quarters):**
- Reduction in person-days required for the next scheduled audit-evidence cycle, measured against the baseline in §2
- Number of divergence/drift findings self-identified and remediated before any external audit cycle
- Formal decision (yes/no, with rationale) from the funding conversation on Phase 2+ investment (full 70-site rollout, control-framework equivalence scorecard, engineer-facing live topology)

**Definition of workshop success specifically:**
- MD and GCB3 leads leave understanding this as a framework capability (architecture community validated), not just a personal tool (networks value proven) — both audiences named in the original outcome statement are satisfied
- No example lands as an attack on a specific platform, vendor choice, or individual's prior decision

---

## 5. Requirements

### Must-Have (P0)
- Structured, versioned ABB/SBB/VSBB/CBB catalogue with band attribute populated for the demo scope — *without this, classification and divergence detection have no reference to compare against*
- Curated, hand-validated config dataset (10–15 sites minimum) sourced from the existing compliance monitor export — *live API integration is explicitly not required for v1*
- Classification + deviation-detection engine producing structured (JSON) output, not free-text — *acceptance criterion: output is directly machine-consumable by the query/scorecard layer without reformatting*
- Divergence-detection logic that accounts for band before flagging a finding — *acceptance criterion: band-appropriate variation (e.g. ATM/cellular vs 10G campus) produces zero false-positive findings in testing*
- Live query layer scoped only to the pre-validated dataset — *acceptance criterion: every live query in rehearsal returns a traceable, correct answer against known-good data*

### Should-Have (P1)
- Diagram/visualisation of divergence findings (spectrum/map view rather than a named-site table), to reduce political read-risk
- Pattern-versioning support (SBB v1/v2) for hardware-constrained gaps, with rationale field populated
- Regulatory citation mapping (DORA Art. 8 / PRA SS2/21 / PCI-DSS) attached to each finding output

### Future Considerations (P2 — explicitly out of scope for this build)
- Full 70-site automated pipeline with direct API collection (replacing compliance-monitor reference copy)
- Control-framework equivalence scorecard (outcome-based, mechanism-agnostic compliance scoring)
- Engineer-facing live-augmented topology view (link status, bandwidth utilisation) — ops-owned, not architecture-owned
- Straight-to-execute enablement (build/operate/consume trust layer) — the long-horizon strategic thread this work feeds, not a v1 deliverable

### Non-Functional / Governance Requirements
- **This use case is explicitly non-agentic.** All gen-AI components are code-orchestrated, single-purpose, and invoked with a fixed input by the pipeline — the model returns structured output and does not decide what to query, investigate, or act on next. Where retrieval is used (the live query layer), it is bounded and read-only, with no write/side-effect capability. Any future move to autonomous, self-directed tool sequencing, or write-capable AI behaviour (e.g. the system independently investigating findings or updating the deviation log) constitutes a separate use case requiring its own governance review — it should not be assumed to inherit approval from this scope.
- No example used may be traceable to a live or personally-owned vendor/design decision by anyone in the workshop audience
- All divergence findings framed as framework/model observations, not team or individual critique — consistent with existing deviation-log handling
- Architecture retains ownership of rationale and gap-identification only; migration timelines and remediation economics remain a business/investment decision, not an architecture mandate
- Model/vendor selection for the AI components must clear existing data-residency and AI-procurement policy before any real config data is processed — confirm approved deployment route (e.g. approved Bedrock/Azure/Vertex tenancy, or self-hosted) before build begins

---

## 6. Open Questions

- **[Finance/Ops]** What is the actual person-day cost of the last 2–3 audit cycles, to replace placeholder figures in §2?
- **[Security/Compliance]** Which AI model/vendor and deployment route is already approved for processing network config data under current policy?
- **[Tobias]** Final platform/site selection for the demo — pending the political screen applied throughout scoping discussions
- **[Review group]** CBB vs VSBB definition, capability-tag taxonomy reconciliation, and SBB-versioning semantics — all flagged as pending in the workshop scope pack
- **[Tobias / Security-Governance]** Whether a future agentic extension (autonomous investigation, write access to the deviation log) is ever pursued — if so, it should be scoped and approved as its own use case, not an extension of this one

---

## 7. Related Documents
- *AI-Workshop-Scope-Pack.md* — workshop-specific scope, demo sequence, and build plan
