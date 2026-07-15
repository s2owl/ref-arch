# AI in Network Architecture Governance — Workshop Scope Pack

**Audience:** Networks MD (ex-security) and GCB3 platform leads (Network Directors)
**Format:** Live, rehearsed demo with an interactive query segment
**Prepared by:** Principal Network Architect

---

## 1. Purpose & Outcome

**One-line outcome:** Demonstrate that we can measure requirement-to-implementation fidelity across the estate — not just check individual boxes — and that this capability only exists because the governance framework (ABB/SBB/VSBB/CBB taxonomy) exists to make it queryable.

The workshop must land with **two audiences at once**:

| Audience | What they need to see |
|---|---|
| Networks (MD, Network Directors) | An AI that reasons like a principal architect — real operational value, blind spots surfaced, audit burden reduced |
| Architecture community | The taxonomy validated — consistency proven, Tobias positioned as pioneer, not as someone automating the discipline away |

**Narrative spine:** *"The framework made this possible. AI made it fast."*

---

## 2. Scope (in / out)

**In scope for the live demo:**
- 5–10 curated branch/campus sites (hand-validated), drawn from a wider ~70-site estate
- Headend infrastructure
- DDoS capability
- Reference source: existing compliance monitor scrape (not live API query)

**Explicitly out of scope for this workshop:**
- Multi-DC core / large-scale topology reconstruction
- Live/real-time telemetry augmentation
- Any example tied to a live or personally-owned vendor decision (see §5)

---

## 3. Core Model

### 3.1 Taxonomy extension
- **ABB** — capability domain (e.g. Branch, Campus)
- **SBB** — solution grouping (e.g. WAN, User LAN, WiFi), versionable (v1 → v2) to capture evolving solutions to the same problem, each version carrying a stated **rationale**
- **VSBB** — architecture boundary (band-appropriate design), PA-owned
- **CBB** — engineering configuration template derived from VSBB, engineering-owned
- **Capability tags** — Routing, Monitoring, Alerting, IAM, Segmentation — attached at VSBB/CBB level, queryable across the hierarchy

### 3.2 Band model (critical calibration)
Requirements (bandwidth, user count) drive which VSBB/CBB applies. **Divergence is only meaningful within a band** — different bands producing different designs is expected, not a finding.

> Reference calibration pair: single remote ATM on cellular vs 10k-user campus on 10G dark fibre — same five capabilities present at both ends, entirely different CBBs, zero divergence finding (band explains it).

### 3.3 Hardware-constrained gaps
Not every gap closes via config uplift. Some (e.g. NLB VIP hairpinning through a firewall) are topology/appliance-constrained and require a **pattern** — a versioned SBB whose migration is a capital/investment decision, not a template push. Architecture's role stops at surfacing rationale and gap; lifespan and migration economics belongs to whoever owns budget.

---

## 4. Demo Sequence

1. **DDoS evaluation** — simple, low-risk, standards-binary. Establishes the evaluation engine works before anything nuanced is shown.
2. **Band-justified variation** — ATM/cellular vs 10G campus. Shows the model *doesn't* falsely flag legitimate variation. Pre-empts the "you're just flagging normal differences" objection.
3. **Same-band divergence** — the real finding: same band, same capability, different CBB, no band justification. Framed as a framework/model gap, not a team failing.
4. **Config validation** — route-redistribution style error, CBB vs actual config. Concrete, technically legible, non-political.
5. **Live query segment** — MD/GCB3 ask questions against the pre-validated dataset ("why did site X come out differently on Segmentation").

---

## 5. Political Guardrails

- **No example tied to a live or personally-owned vendor decision.** (Ruled out: SASE — client-based SD-WAN/SSE vs infra-based converged, given known MD history.)
- Divergence is always framed as **model/framework visibility gap**, never team critique — consistent with how duplicate ABB-SEC pairs are already handled (flagged, not adjudicated).
- Screen every candidate example: *does anyone currently in the room own this decision?* If yes, don't use it.
- Segmentation/control examples measure **outcome satisfied**, never **mechanism used** — VLAN, ACL, zonal, service mesh are equally valid; conflating mechanism with compliance risks a false "you're doing it wrong" read.

---

## 6. Strategic Thread — Enabling Build, Operate, Consume

This isn't an isolated tooling exercise — it's the traceability foundation the next phase of strategy depends on.

If architecture has a validated grip on the estate **top to bottom** — capability → ABB → VSBB → CBB → actual config, down to vendor and version — that traceability is precisely what a **build, operate, consume** model needs to trust before it can go **straight to execute**. Today, provisioning a new site or capability likely still requires manual architecture review because nobody can cheaply prove the target pattern is valid and current. Once patterns, bands, and CBBs are governed, versioned, and machine-queryable:

- **Build** can select a known-good, band-appropriate CBB/pattern with confidence, rather than re-deriving a design from scratch or waiting on manual sign-off
- **Operate** inherits a config baseline it can validate against continuously, not just at point-of-deployment
- **Consume** (the platform lead requesting the capability) gets a catalogue to order from, not a bespoke design cycle

In other words: this workshop's mechanism (classify → validate → detect divergence) is also the **trust layer** that makes straight-to-execute safe. Without it, "straight to execute" is just skipping governance faster. With it, execution can move quickly *because* conformance is provable, not assumed — the framework becomes an enabler of pace, not a gate on it.

**Positioning note for the workshop:** worth landing this as the strategic "why this matters beyond one workshop" close — it reframes the whole demo from "AI helps governance" to "this is how the estate gets fast *and* stays safe," which is a stronger long-horizon pitch to an MD than governance value alone. Keep it as a closing thread rather than the headline — the workshop still needs to earn credibility on the concrete findings first (§4) before the audience is ready for the bigger claim.

---

## 7. Build Plan (4 weeks, several focused sessions)

| Block | Focus |
|---|---|
| 1 | Curate subset (~10–15 sites spanning band extremes) from compliance monitor export; validate data quality |
| 2 | Build classification + deviation-detection engine (local Python + Claude API, structured JSON output) |
| 3 | Pattern-clustering / divergence layer; scorecard + query layer wired to validated data |
| 4 | Rehearse live segment; prepare fallback path; tighten narrative and Q&A prep |

**Pipeline shape:** Compliance monitor export → curated/normalised local dataset → Claude API classification & reasoning (batched, structured output) → versioned JSON/YAML → existing browser-based query/diagram/scorecard tooling.

---

## 8. Future Value Opportunities (funding case exhibits — not built now)

These are deliberately **unbuilt and unowned** at workshop time — presented as ambition, not commitments, to avoid being assumed as next-quarter deliverables.

1. **Engineer-facing live topology view** — governance topology diagram (static, ABB/VSBB/CBB-derived) extended with live telemetry (link status, bandwidth utilisation) via SD-WAN/monitoring APIs. Governance owns the structural backbone; an ops/engineering team would own and run the live layer.

2. **Control-framework equivalence scorecard** — internal control framework requirements mapped to capability tags, scored by **outcome satisfied**, independent of mechanism (VLAN vs ACL vs zonal vs service mesh). Surfaces mechanism diversity as a separate support-economics observation, not a compliance failure.

3. **Full-estate rollout (70 sites)** — same pipeline, full curated dataset, real statistical weight on divergence and pattern findings rather than a demo-scoped subset.

4. **Automated collection pipeline** — direct API integration (SD-WAN orchestrator, device APIs, DDoS provider) replacing the compliance-monitor reference copy, enabling refresh without manual re-curation.

5. **Straight-to-execute enablement** — extending the validated pattern/CBB catalogue into a build/operate/consume trust layer, allowing provisioning against known-good, band-appropriate patterns without a bespoke manual design cycle each time. This is the larger strategic play the workshop findings feed into (see §6).

---

## 9. Open Items (pending review group challenge)

- Formal definition write-up: **CBB vs VSBB** ("VSBB is the architecture boundary; CBB is the engineering configuration template derived from it")
- Reconciliation of new capability tags (Routing, Monitoring, Alerting, IAM, Segmentation) against existing Primary/Network Capabilities taxonomy — avoid two drifting vocabularies
- Own-SBB vs attribute-tag decision for Routing/Segmentation (likely intrinsic to WAN/LAN SBB) vs Monitoring/Alerting/IAM (likely standalone SBBs)
- Band definitions — formalise as governed reference list, anchored to real examples (ATM/cellular, 10G campus)
- SBB versioning semantics — does v2 retire v1 outright, or can both remain valid for different bands concurrently?
- Final platform/site selection for the demo, pending political screen in §5
