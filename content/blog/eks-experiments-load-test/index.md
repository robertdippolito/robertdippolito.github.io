---
title: EKS Experiments E1 — Sudden Load Spike on a Small Kubernetes Cluster
date: "2025-08-15T22:40:32.169Z"
description: How an EKS cluster reacts to a sudden load spike.
---
This post summarizes my YouTube video where I stress-tested a small EKS cluster with a sudden traffic spike to see how it reacts. Below you’ll find the setup, the experiment design, the results, and the key learnings. 

---

### TL;DR

- Observe how a small EKS cluster handles a sudden burst of CPU-heavy requests.  
- ~3,200 requests served with **100% success**; **P95 latency increased ~250 ms** during the spike; HPA kicked in quickly and scaled out.  
- A **CDN will mask identical bursts**; ensure **HPA + cluster sizing** match your risk profile; keep **observability** handy because dashboards can lag under stress.

The learnings from this video are captured on my [Youtube](https://www.youtube.com/@RobOps101) channel and specifically in the video below:

<iframe width="560" height="315" src="https://www.youtube.com/embed/6tGKxJ625k4?si=Po-ftkKVW_SMWDTg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

---

## Results at a Glance

- **Requests served:** ~**3,200** total  
- **Errors:** **0** (100% success)  
- **Latency:** **P95 +~25 ms** during the spike (remained under a 500 ms SLO)  
- **Scaling:** **HPA reacted quickly** once CPU crossed its 50% target and scaled out from a single replica  
- **Operator signal:** **Grafana UI lagged** (slow auto-refresh) while the cluster was hot — the first visible “strain” wasn’t the API, it was my dashboard

I disabled CDN caching for this test so the **API absorbed the full burst**.

---

## What I Observed (and Why It Matters)

### 1) The first bottleneck wasn’t availability — it was headroom
Starting with **one** replica is cheap but brittle for spikes. CPU jumped **>100%** almost immediately on the lone pod, which **triggered HPA**, but there’s always a **spin-up window** (scheduling, image pull, readiness). That window is where you feel the spike: latency ticks up a little while replicas appear.

**So what?** If your traffic pattern includes sudden bursts, **pre-warm** a little capacity (minReplicas > 1) or reduce the time to scale (see “Changes I’d ship” below).

---

### 2) Latency moved, but stayed predictable
Even with the CPU surge, **P95 only grew by ~25 ms** and stayed below the 500 ms budget. That says two things:

- The workload was **CPU-bound** but not thrashing (no runaway queuing).
- The **HPA reaction** + Kubernetes scheduling caught up quickly enough to keep tail latency in check.

**So what?** For this specific shape of spike, **HPA + modest over-provisioning** is enough to protect the user experience.

---

### 3) Observability degraded before the app did
Grafana’s UI refresh stuttered while load peaked. That’s not an outage, but it’s a **risk to incident response**: your eyes and graphs slow down **exactly when you need them**.

**So what?** Treat your monitoring stack as **production-critical**:
- Give Prometheus/Grafana **their own resources** (node pool or higher requests/limits).
- Lower dashboard refresh rates during incidents, and keep **CLI/PromQL** ready as a plan B.
- Consider **recording rules** for pre-aggregated queries.

---

### 4) The CDN is a circuit breaker — but it can hide real problems
If CloudFront caching were **on**, this exact spike (repeated GETs) would likely **never hit the API**. That’s ideal in production but **misleading in testing**.

**So what?** Run **two kinds of tests**:
- **With CDN ON** to validate the *user* experience and edge config
- **With CDN OFF** to validate **backend resilience** and scaling

---

## What This Tells Me About Capacity

- Over ~9 minutes, ~**3,200** requests → **~6 RPS average** across the window.  
- With **P95 < 0.5 s**, back-of-the-envelope concurrency stayed low (RPS × latency ≈ **<3 concurrent in the tail**).  
- The brief CPU >100% + quick scale-out implies the **per-pod ceiling** was touched but **relief arrived fast**.

**Translation:** For short spikes of this size, **HPA suffices** if you preserve a small amount of idle capacity. For taller spikes (or slower image pulls), you’ll see **queuing → rising P95 → eventual 5xx** if scale-out lags.

---

## Changes I Would Ship After This Test

1. **Raise `minReplicas` from 1 → 2 or 3**  
   Cuts the “first-pod shock” and buys time for HPA to add capacity.

2. **Tune HPA behavior**  
   - Keep **target CPU ≈ 50%** (good headroom).  
   - Add `behavior.scaleDown.stabilizationWindowSeconds` to avoid oscillation.  
   - Ensure realistic **CPU `requests`** on the deployment so the signal is meaningful.

3. **Resource isolation for monitoring**  
   - Dedicated node group or **higher requests** for Prometheus/Grafana.  
   - Dashboard refresh ≥ **10 s** during load; rely on alerts + logs for real-time.

4. **CDN strategy**  
   - Keep caching **ON** for static/idem­potent GETs.  
   - Mark “synthetic compute” endpoints `Cache-Control: no-store` so test traffic reaches the API when intended.

5. **Warm-path readiness**  
   - Pre-pull images (or use a warm image cache).  
   - Keep a **small baseline** of pods per Availability Zone to avoid AZ-specific cold starts.

---

## What's Next
Continuing EKS experiments we will be investigating what happens when a good deployment is pushed to a cluster vs. a bad deployment. The next video will be an environment set up video so people can follow along and create their own clusters.

If you try a similar test, I’d love to hear your results and what changed when you toggled CDN caching or HPA limits. Drop a comment or open an issue in the repo!