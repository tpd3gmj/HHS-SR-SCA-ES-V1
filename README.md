# HIPAA Security Rule — Safeguard Compliance Assessment (SCA) Expert System

**Version 1.0**

A CLIPS 6.x rule-based expert system that guides HIPAA-regulated Healthcare Delivery Organizations (i.e., Covered Entities and/or Business Associates) through a structured Safeguard Compliance Assessment against the proposed HHS Security Rule NPRM (RIN 0945-AA22). The system asks plain-language yes/no/partial compliance questions, scores each response, and generates a detailed report — in plain text or HTML — with NIST SP 800-53r5 control references for any gaps found.

45 CFR Part 164 Security Rule | HHS RIN 0945-AA22 NPRM

---

## About

The Notice of Proposed Rulemaking (NPRM) for the HIPAA Security Rule introduces 168 distinct Standards and Specifications — a significant increase in granularity over the current Security Rule's 46 Required/Addressable standards. The SCA distills the NPRM into an Expert System, allowing organizations of any size to identify compliance gaps and receive industry-standard remediation guidance, without requiring specialized software or training.

The system is suitable for both non-technical audiences (executive leadership, compliance officers, legal/regulatory counsel) and technical audiences (information security specialists), and can be run in either **Standard** (plain-language) or **Technical** (plain-language + NIST control references) report mode.

An accompanying paper documents the system's design, knowledge base architecture, and rationale.

## Demo Modules

This repository contains **proof-of-concept demo versions** of three Security Rule Safeguard modules. Each demo includes 8 representative controls from its corresponding full module.

| File | Safeguard | Controls (Demo) |
|---|---|---|
| `HHS-SR-164_308-Administrative-DEMO.clp` | Administrative Safeguards | 8 |
| `HHS-SR-164_310-Physical-DEMO.clp` | Physical Safeguards | 8 |
| `HHS-SR-164_312-Technical-DEMO.clp` | Technical Safeguards | 8 |

> **Note:** Full production modules — including Organizational Requirements and Documentation Safeguards — are not included in this release. See the paper for the complete scope of the SCA knowledge base.

## System Requirements

| Requirement | Specification |
|---|---|
| Operating System | Windows 10 or Windows 11 (64-bit) |
| Software | CLIPS 6.x ([official download](https://sourceforge.net/projects/clipsrules/files/CLIPS/)) |
| Disk Space | ~10 MB for CLIPS installation; SCA modules are less than 1 MB total |
| RAM | 512 MB minimum |
| Display | Any resolution — CLIPS runs in a text console window |
| Permissions | Standard user account — no administrator rights required to run |

## Getting Started

1. Download and install CLIPS 6.x from the [official SourceForge repository](https://sourceforge.net/projects/clipsrules/files/CLIPS/).
2. Download the demo `.clp` files from this repository.
3. **Verify file integrity** — before running any module, confirm its SHA256 hash matches the value published in [`HHS-SR-SCA-FileHashes.txt`](./HHS-SR-SCA-FileHashes.txt). Do not run a file whose hash does not match.
4. Follow the full setup, verification, and usage instructions in the [Installation, Configuration and Setup Guide](./HHS-SR-SCA-ES-Installation-Guide.pdf).

## Verifying Downloads

All files in this repository are hashed with SHA256. Reference values are published in `HHS-SR-SCA-FileHashes.txt`. Verify using PowerShell:

```powershell
Get-FileHash <filename> -Algorithm SHA256
```

or Command Prompt:

```cmd
certutil -hashfile <filename> SHA256
```

If a hash does not match, do not run the file — contact the provider for a verified copy.

## Documentation

- 📄 [Installation, Configuration and Setup Guide (PDF)](./HHS-SR-SCA-ES-Installation-Guide.pdf)
- 📄 [Paper — System Design & Knowledge Base Architecture (PDF)](./HIPAA_Security_Rule_NPRM_CLIPS_Expert_System.pdf)
- 🎥 [Demo Video — link to be added](https://github.com/tpd3gmj/HHS-SR-SCA-ES/releases/download/Version_1_0/SCA_DEMO_Video.mp4)
- 🔐 [File Integrity Hashes](./HHS-SR-SCA-FileHashes.txt)

## Disclaimer

This software is provided for informational purposes only and does not constitute legal advice. The assessment questions and scoring are based on the HHS RIN 0945-AA22 Notice of Proposed Rulemaking (NPRM) for the HIPAA Security Rule. Question text has been modified for readability. Results should be reviewed by a qualified compliance professional. Please refer to HHS RIN 0945-AA22 NPRM for the official regulatory text and requirements.

The SCA is not a substitute or replacement for AICPA SOC-2, Type II or HITRUST audits or certification, or any other HIPAA-related compliance or certification framework.

## License / Copyright

Copyright 2026. Thomas P. Dover. All Rights Reserved.

Contact: tdover@pas-lp.com | tpd_phd@yahoo.com
