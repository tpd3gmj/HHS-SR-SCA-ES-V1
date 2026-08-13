
;;; ============================================================
;;; HHS-SR-164_310-Physical-DEMO.clp
;;; HIPAA Security Rule Risk Assessment (SCA) Expert System
;;; Physical Safeguards | Controls PHYS-01 through PHYS-08
;;; 45 CFR Part 164.310 Security Rule | HHS RIN 0945-AA22 NPRM
;;; Compatible with CLIPS 6.x
;;; ------------------------------------------------------------
;;; Copyright 2026.  Thomas P. Dover.  All Rights Reserved.
;;; Contact: tdover@pas-lp.com  |  tpd_phd@yahoo.com
;;; ------------------------------------------------------------
;;; DEMONSTRATION VERSION (Proof-of-Concept)
;;;   Limited to first 8 controls (PHYS-01 through PHYS-08).
;;;   For evaluation purposes only.
;;;   Full version: HHS-SR-164_310-Physical.clp

;;; Current Version: 1.0.15
;;; Full version history archived separately in: HHS-SR-164_310-Physical-DEMO-CHANGELOG.txt

;;; ---------- TEMPLATES ----------

(deftemplate response
  (slot id                         (type STRING))
  (slot answer                     (type STRING))
  (slot finding                    (type STRING))
  (slot score                      (type FLOAT))
  (slot noncompliant-flag          (type STRING) (default "no"))
  (slot section                    (type STRING) (default ""))
  (slot section2                   (type STRING) (default ""))
  (slot rem-compliant-plain        (type STRING) (default ""))
  (slot rem-compliant-technical    (type STRING) (default ""))
  (slot rem-partial-plain          (type STRING) (default ""))
  (slot rem-partial-technical      (type STRING) (default ""))
  (slot rem-noncompliant-plain     (type STRING) (default ""))
  (slot rem-noncompliant-technical (type STRING) (default ""))
  (slot ref-name                   (type STRING) (default ""))
  (slot ref-security-control       (type STRING) (default ""))
  (slot ref-sections               (type STRING) (default ""))
  (slot ref-pages                  (type STRING) (default ""))
)

(deftemplate assessment-state
  (slot phase       (default "banner"))  ; banner | asking | report
  (slot qnum        (type INTEGER) (default 1))
  (slot report-mode (type STRING)  (default "1"))  ; "1"=Standard "2"=Technical
  (slot save-file   (type STRING)  (default "SCA-310-DEMO-Answers.txt"))
  (slot answer-path   (type STRING)  (default ""))
  (slot report-path   (type STRING)  (default ""))
  (slot report-format (type STRING)  (default "N"))  ; T=text H=html N=none
  (slot report-fh     (type SYMBOL)  (default nil))
  (slot timestamp     (type STRING)  (default ""))   ; MM-DD-YYYY
  (slot completed-by  (type STRING)  (default ""))   ; assessor name
  (slot assessor-title (type STRING) (default ""))   ; assessor title
  (slot organization   (type STRING) (default ""))   ; assessor organization
)

;;; ---------- INITIAL STATE ----------

(deffacts initial-state
  (assessment-state (phase "banner") (qnum 1))
)

;;; ---------- QUESTION DATA ----------

(deffacts question-data
  (qdata   1 "PHYS-01" "164.310 (a)(2)(i) [Contingency Operations]" "Facility Access Controls"
    "Have written procedures been established (and implemented as needed) that allow facility access in support of your organization's contingency plan (as required by § 164.308(a)(13)?"
    "Y|ALT|DNA" "P" 0.5 1
    "Compliant" "Partial Compliance" "Requirement: Contingency Operations" "" "Non-compliant"
    "Maintain control(s).  Modify/update as needed." ""
    "Review and complete written contingency facility access procedures. Ensure they are linked to your contingency plan and that staff responsible for access restoration are identified." "Integrate partial contingency access procedures with CP-2 (Contingency Plan) and PE-17 (Alternate Work Site). Document access restoration roles and validate through tabletop testing per CP-4."
    "Establish written procedures that define how facility access will be maintained or restored during a contingency event. Procedures must reference your contingency plan and identify responsible personnel." "Develop and implement contingency facility access procedures per PE-17 and CP-2. Ensure procedures address physical access restoration, key/credential management during emergencies, and are tested per CP-4."
    "NIST SP 800-53r5" "Physical and Environmental Protection (PE)" "PE-17, CP-2, CP-4" "200, 89, 92"
    "SR-A" "An ADDRESSABLE (optional) standard in the current Security Rule")
  (qdata   2 "PHYS-02" "164.310 (a)(2)(ii) [Facility Security Plan]" "Facility Access Controls"
    "Has your organization established and implemented written policies and procedures to safeguard all facilities and the equipment therein from unauthorized physical access, tampering and theft?"
    "Y|ALT|DNA" "P" 0.5 1
    "Compliant" "Partial Compliance" "Requirement: Facility Security Plan" "" "Non-compliant"
    "Maintain control(s).  Modify/update as needed." ""
    "Complete and formalize the facility security plan. Ensure all facilities are covered including remote offices, server rooms, and equipment storage areas. Document physical controls in place for each." "Expand facility security plan to cover all locations per PE-3 (Physical Access Control) and PE-6 (Monitoring Physical Access). Ensure equipment protection measures align with PE-20 (Asset Monitoring and Tracking)."
    "Develop and implement a written facility security plan that identifies all facilities where ePHI or systems are housed and establishes physical controls to prevent unauthorized access, tampering, and theft." "Implement a facility security plan per PE-1 (Policy and Procedures), PE-3 (Physical Access Control), and PE-6 (Monitoring Physical Access). Include controls for all entry points, equipment areas, and visitor management."
    "NIST SP 800-53r5" "Physical and Environmental Protection (PE)" "PE-1, PE-3, PE-6, PE-20" "183, 185, 191, 207"
    "SR-A" "An ADDRESSABLE (optional) standard in the current Security Rule")
  (qdata   3 "PHYS-03" "164.310 (a)(2)(iii) [Access Management and Validation Procedures]" "Facility Access Controls"
    "Has your organization established and implemented written procedures to authorize and manage a person’s access to facilities based on their role or function, including visitor management?"
    "Y|ALT|DNA" "P" 0.5 1
    "Compliant" "Partial Compliance" "Requirement: Access Management and Validation Procedures" "" "Non-compliant"
    "Maintain control(s).  Modify/update as needed." ""
    "Complete written procedures for role-based facility access. Ensure visitor management procedures are documented including sign-in, escort requirements, and time-limited access." "Expand access management procedures to address all roles per PE-3 (Physical Access Control) and PE-8 (Visitor Access Records). Confirm badge/credential issuance and revocation processes are documented."
    "Establish written procedures that define how physical access to facilities is authorized by role or function. Include visitor management controls such as sign-in logs, escort requirements, and badge issuance and revocation." "Implement role-based physical access controls per PE-3 (Physical Access Control) and PE-8 (Visitor Access Records). Document credential issuance, revocation, and visitor management procedures consistent with AC-2 (Account Management) principles applied to physical access."
    "NIST SP 800-53r5" "Physical and Environmental Protection (PE)" "PE-3, PE-8, AC-2" "185, 194, 15"
    "SR-A" "An ADDRESSABLE (optional) standard in the current Security Rule")
  (qdata   4 "PHYS-04" "164.310  (a)(2)(iv) [Physical Maintenance Records]" "Facility Access Controls"
    "Has your organization established and implemented written policies and procedures to document repairs and modifications to the physical components of a facility that are related to security, including but not limited to hardware, walls, doors, locks, and security cameras?"
    "Y|ALT|DNA" "P" 0.5 1
    "Compliant" "Partial Compliance" "Requirement: Physical Maintenance Records" "" "Non-compliant"
    "Maintain control(s).  Modify/update as needed." ""
    "Complete written maintenance recordkeeping procedures. Ensure all security-relevant repairs and modifications to physical components are documented including date, nature of work, and personnel involved." "Expand maintenance documentation to cover all physical security components per PE-6 (Monitoring Physical Access) and MA-5 (Maintenance Personnel). Ensure controlled maintenance records include third-party vendors."
    "Establish written policies and procedures for documenting all repairs and modifications to security-related physical components such as doors, locks, walls, and cameras. Records must include date, description, and responsible party." "Implement physical maintenance recordkeeping per MA-5 (Maintenance Personnel) and PE-6 (Monitoring Physical Access). Establish a log of all security-relevant physical modifications including third-party vendor activities and controlled maintenance access."
    "NIST SP 800-53r5" "Physical and Environmental Protection (PE); Maintenance (MA)" "PE-6, MA-5" "191, 167"
    "SR-A" "An ADDRESSABLE (optional) standard in the current Security Rule")
  (qdata   5 "PHYS-05" "164.310 (a)(2)(v) [Maintenance]" "Facility Access Controls"
    "For each facility, does your organization review and test 'Facility Access Controls' written policies and procedures at least once every 12 months, and modify them (if needed) as reasonable and appropriate?"
    "Y|ALT|DNA" "P" 0.5 1
    "Compliant" "Partial Compliance" "Requirement: Facility Access Controls Maintenance" "" "Non-compliant"
    "Maintain control(s).  Modify/update as needed." ""
    "Complete annual reviews for all facilities. Ensure testing of physical access controls is conducted, results are documented, and procedures are updated based on findings." "Expand annual review to cover all facility locations per PE-3 and CA-7 (Continuous Monitoring). Document testing results and track procedure updates to closure."
    "Establish and conduct an annual review and test of all facility access control policies and procedures. Document results and update procedures based on findings. Ensure all facilities are included in the review cycle." "Implement an annual facility access control review program per PE-3 (Physical Access Control) and CA-7 (Continuous Monitoring). Document testing activities, results, and corrective actions taken for each facility location."
    "NIST SP 800-53r5" "Physical and Environmental Protection (PE); Assessment, Authorization and Monitoring (CA)" "PE-3, CA-7" "185, 84"
    "SR-AE" "An ADDRESSABLE standard in the current Security Rule but enhanced by the NPRM")
  (qdata   6 "PHYS-06" "164.310 (b)(2)(i)(A) [Policies and Procedures]" "Workstation Use"
    "Does your organization maintain written policies and procedures specifying the functions for which a workstation may be used if it accesses electronic protected health information?"
    "Y|ALT|DNA" "P" 0.5 1
    "Compliant" "Partial Compliance" "Requirement: Policies and Procedures" "" "Non-compliant"
    "Maintain control(s).  Modify/update as needed." ""
    "Complete written workstation use policies to specify all permitted functions for ePHI-accessing workstations. Ensure policies are communicated to workforce members and enforced." "Expand workstation function policies to cover all device types and locations per AC-17 (Remote Access) and CM-6 (Configuration Settings). Ensure permitted functions are technically enforced where feasible."
    "Establish written policies specifying the functions for which each workstation may be used when accessing ePHI. Policies must address what activities are permitted and prohibited on ePHI-accessing workstations." "Implement workstation use policies per AC-17 (Remote Access) and CM-6 (Configuration Settings). Define permitted workstation functions technically through configuration baselines and enforce restrictions through access controls."
    "NIST SP 800-53r5" "Access Control (AC); Configuration Management (CM)" "AC-17, CM-6" "36, 110"
    "SR-R" "A REQUIRED standard in the current Security Rule")
  (qdata   7 "PHYS-07" "164.310 (b)(2)(i)(B) [Policies and Procedures]" "Workstation Use"
    "Does your organization maintain written policies and procedures specifying the manner in which a workstation may be used to perform those functions if it accesses electronic protected health information?"
    "Y|ALT|DNA" "P" 0.5 1
    "Compliant" "Partial Compliance" "Requirement: Policies and Procedures" "" "Non-compliant"
    "Maintain control(s).  Modify/update as needed." ""
    "Expand written workstation use policies to address not just what functions are permitted but how those functions must be performed. Include session timeout, screen positioning, and data handling requirements." "Expand manner-of-use policies to include technical controls per AC-11 (Session Lock), SC-28 (Protection of Information at Rest), and CM-6 (Configuration Settings). Enforce policies through technical configuration where feasible."
    "Establish written policies specifying how workforce members must use ePHI-accessing workstations when performing permitted functions. Include requirements for screen positioning, session locking, and appropriate data handling." "Implement workstation manner-of-use policies per AC-11 (Session Lock) and CM-6 (Configuration Settings). Technically enforce session timeouts, screen lock requirements, and data handling controls through system configuration."
    "NIST SP 800-53r5" "Access Control (AC); Configuration Management (CM)" "AC-11, CM-6, SC-28" "26, 110, 249"
    "SR-R" "A REQUIRED standard in the current Security Rule")
  (qdata   8 "PHYS-08" "164.310 (b)(2)(i)(C)  [Policies and Procedures]" "Workstation Use"
    "Does your organization maintain written policies and procedures specifying the physical attributes of the surroundings of a specific workstation or class of workstation that can access electronic protected health information, including the removal of such workstations from a facility and the movement of such workstations within and outside of a facility?"
    "Y|ALT|DNA" "P" 0.5 1
    "Compliant" "Partial Compliance" "Requirement: Policies and Procedures" "" "Non-compliant"
    "Maintain control(s).  Modify/update as needed." ""
    "Expand workstation physical environment policies to address screen visibility, workstation placement, and procedures for moving workstations within and outside facilities. Include requirements for all workstation classes." "Expand physical attribute policies per PE-5 (Access Control for Output Devices) and MP-5 (Media Transport). Address workstation siting, privacy screens, and movement controls for all device classes including laptops and mobile workstations."
    "Establish written policies addressing the physical environment requirements for all ePHI-accessing workstations. Include screen placement, visibility controls, and procedures for workstation removal and movement within and outside facilities." "Implement workstation physical environment policies per PE-5 (Access Control for Output Devices) and MP-5 (Media Transport). Define siting requirements, screen visibility controls, and documented procedures for all workstation movements."
    "NIST SP 800-53r5" "Physical and Environmental Protection (PE); Media Protection (MP)" "PE-5, MP-5" "190, 173"
    "SR-R" "A REQUIRED standard in the current Security Rule")
)


;;; ---------- TEE / REPORT OUTPUT FUNCTIONS ----------

(deffunction format-datetime-str (?ts)
  "Returns ?ts as-is; timestamp is entered by user during banner."
  ?ts
)

(deffunction html-escape (?s)
  "Escape HTML special characters in a string."
  (bind ?s (str-cat ?s ""))
  (bind ?s (implode$ (subseq$ (explode$ (str-cat (sub-string 1 (str-length ?s) ?s))) 1 (length$ (explode$ (str-cat (sub-string 1 (str-length ?s) ?s)))))))
  ?s
)

(deffunction tee (?fh ?format ?text)
  "Print ?text to screen; if report file is open also write to it."
  (printout t ?text)
  (if (and (neq ?fh nil) (neq ?fh FALSE))
    then
      (if (eq ?format "H")
        then (printout ?fh ?text)
        else (printout ?fh ?text)
      )
  )
)

(deffunction tee-line (?fh ?format ?text)
  "Print ?text + newline to screen and optionally to report file."
  (printout t ?text crlf)
  (if (and (neq ?fh nil) (neq ?fh FALSE))
    then
      (if (eq ?format "H")
        then (printout ?fh ?text "<br>" crlf)
        else (printout ?fh ?text crlf)
      )
  )
)

(deffunction tee-section (?fh ?format ?text)
  "Print a section heading line to screen and report file."
  (printout t ?text crlf)
  (if (and (neq ?fh nil) (neq ?fh FALSE))
    then
      (if (eq ?format "H")
        then (printout ?fh "<h3>" ?text "</h3>" crlf)
        else (printout ?fh ?text crlf)
      )
  )
)

(deffunction tee-blank (?fh ?format)
  "Print a blank line to screen and report file."
  (printout t crlf)
  (if (and (neq ?fh nil) (neq ?fh FALSE))
    then
      (if (eq ?format "H")
        then (printout ?fh "<br>" crlf)
        else (printout ?fh crlf)
      )
  )
)

(deffunction open-report-file (?path ?format)
  "Open the report file and write HTML header if needed. Returns file handle or nil."
  (if (eq ?path "")
    then nil
    else
      (bind ?fh (open ?path report-file "w"))
      (if (or (not ?fh) (eq ?fh FALSE))
        then
          (printout t "  [!] Could not open report file: " ?path crlf)
          nil
        else
          (if (eq ?format "H")
            then
              (printout report-file "<!DOCTYPE html>" crlf)
              (printout report-file "<html lang=\"en\">" crlf)
              (printout report-file "<head><meta charset=\"UTF-8\">" crlf)
              (printout report-file "<title>HIPAA Security Rule - SCA ES (v1.0) Report</title>" crlf)
              (printout report-file "<style>" crlf)
              (printout report-file "body{font-family:Courier New,monospace;font-size:13px;margin:40px;color:#1a1a1a;background:#fff;}" crlf)
              (printout report-file "h1{color:#1F3864;border-bottom:3px solid #2E75B6;padding-bottom:8px;}" crlf)
              (printout report-file "h2{color:#2E75B6;margin-top:24px;}" crlf)
              (printout report-file "h3{color:#1F3864;margin-top:16px;}" crlf)
              (printout report-file ".banner{background:#1F3864;color:#fff;padding:12px 16px;border-radius:4px;}" crlf)
              (printout report-file ".section{background:#f2f2f2;padding:8px 12px;border-left:4px solid #2E75B6;margin:8px 0;}" crlf)
              (printout report-file ".finding-nc{background:#fdecea;border-left:4px solid #c0392b;padding:8px 12px;margin:8px 0;}" crlf)
              (printout report-file ".finding-p{background:#fef9e7;border-left:4px solid #f39c12;padding:8px 12px;margin:8px 0;}" crlf)
              (printout report-file ".guidance{color:#1a5276;margin-left:16px;}" crlf)
              (printout report-file ".technical{color:#196f3d;margin-left:16px;}" crlf)
              (printout report-file ".reference{color:#6c3483;margin-left:16px;font-size:12px;}" crlf)
              (printout report-file ".disclaimer{background:#fdfefe;border:1px solid #ccc;padding:12px;margin-top:24px;font-size:11px;color:#555;}" crlf)
              (printout report-file "table{border-collapse:collapse;width:100%;margin:8px 0;}" crlf)
              (printout report-file "th{background:#1F3864;color:#fff;padding:6px 10px;text-align:left;}" crlf)
              (printout report-file "td{padding:5px 10px;border-bottom:1px solid #ddd;}" crlf)
              (printout report-file "tr:nth-child(even){background:#f9f9f9;}" crlf)
              (printout report-file "</style></head><body>" crlf)
              (printout report-file "<h1>HIPAA Security Rule - Safeguard Compliance Assessment (SCA)</h1>" crlf)
              (printout report-file "<p><em>Physical Safeguards &mdash; PHYS-01 to PHYS-08</em></p>" crlf)
          )
          report-file
      )
  )
)

(deffunction close-report-file (?fh ?format)
  "Close the report file, writing HTML footer if needed."
  (if (and (neq ?fh nil) (neq ?fh FALSE))
    then
      (if (eq ?format "H")
        then (printout report-file "</body></html>" crlf)
      )
      (close report-file)
  )
)

;;; ---------- HELPER FUNCTIONS ----------
;;; NOTE: All 83 controls share the same answer mapping:
;;;   Compliant     = Y, ALT       (full weight)
;;;   Partial       = P             (partial weight)
;;;   Non-compliant = N, DNA, U     (0.0)

(deffunction compliant-answer? (?ans)
  "Returns TRUE if answer earns full credit (Y or ALT only)"
  (or (eq ?ans "Y")
      (eq ?ans "ALT"))
)

(deffunction partial-answer? (?ans)
  "Returns TRUE if answer earns partial credit"
  (eq ?ans "P")
)

(deffunction noncompliant-answer? (?ans)
  "Returns TRUE if answer is N or U (non-compliant, weight 0.0)"
  (or (eq ?ans "N")
      (eq ?ans "U"))
)

(deffunction score-answer (?ans ?pw ?w)
  "Returns weighted score based on answer; DNA scores 1.0; N/U always 0.0"
  (if (or (compliant-answer? ?ans) (eq ?ans "DNA"))
    then (* ?w 1.0)
    else (if (partial-answer? ?ans)
      then (* ?pw 1.0)
      else 0.0
    )
  )
)

(deffunction finding-for (?ans ?fc ?fp ?fg ?fn)
  "Returns finding label based on answer. DNA returns 'Does Not Apply'."
  (if (eq ?ans "DNA")
    then "Does Not Apply"
    else (if (compliant-answer? ?ans)
      then ?fc
      else (if (partial-answer? ?ans)
        then ?fp
        else (if (noncompliant-answer? ?ans)
          then ?fn
          else ?fg
        )
      )
    )
  )
)

(deffunction normalize-answer (?raw)
  "Converts upper-cased user input to canonical answer code."
  (if (or (eq ?raw "Y") (eq ?raw "YES"))       then "Y"
  else (if (or (eq ?raw "N") (eq ?raw "NO"))   then "N"
  else (if (or (eq ?raw "P") (eq ?raw "PARTIAL")
              (eq ?raw "PART"))                 then "P"
  else (if (or (eq ?raw "DNA")
              (eq ?raw "DOESNOTAPPLY")
              (eq ?raw "DOES-NOT-APPLY")
              (eq ?raw "NA") (eq ?raw "N/A"))   then "DNA"
  else (if (or (eq ?raw "ALT")
              (eq ?raw "ALTERNATIVE")
              (eq ?raw "ALTERNATE"))            then "ALT"
  else (if (or (eq ?raw "U")
              (eq ?raw "UNKNOWN")
              (eq ?raw "UNK"))                  then "U"
  else ?raw))))))
)

(deffunction valid-answer? (?ans)
  "Returns TRUE for any recognised canonical answer code"
  (or (eq ?ans "Y")
      (eq ?ans "N")
      (eq ?ans "P")
      (eq ?ans "DNA")
      (eq ?ans "ALT")
      (eq ?ans "U"))
)

(deffunction abbrev-answer (?ans)
  "Abbreviates DNA->D and ALT->A for report display"
  (if (eq ?ans "DNA") then "D"
  else (if (eq ?ans "ALT") then "A"
  else ?ans))
)

(deffunction extract-section2 (?fg)
  "Extracts section2 label from finding_gap string (strips Requirement: prefix)"
  (bind ?prefix "Requirement: ")
  (bind ?plen (str-length ?prefix))
  (if (and (>= (str-length ?fg) ?plen)
           (eq (sub-string 1 ?plen ?fg) ?prefix))
    then (sub-string (+ ?plen 1) (str-length ?fg) ?fg)
    else ?fg)
)

(deffunction print-wrapped (?text ?prefix ?indent ?width ?fh ?fmt)
  "Word-wraps ?text to ?width chars. ?prefix appears on the first line;
   continuation lines use ?indent. Outputs to screen and report file."
  (bind ?words   (explode$ ?text))
  (bind ?count   (length$ ?words))
  (bind ?line    ?prefix)
  (bind ?i       1)
  (while (<= ?i ?count)
    (bind ?word (nth$ ?i ?words))
    (bind ?candidate (str-cat ?line ?word))
    (if (> (str-length ?candidate) ?width)
      then
        (tee-line ?fh ?fmt ?line)
        (bind ?line (str-cat ?indent ?word " "))
      else
        (bind ?line (str-cat ?candidate " "))
    )
    (bind ?i (+ ?i 1))
  )
  (if (neq ?line ?indent)
    then (tee-line ?fh ?fmt ?line))
)


;;; ---------- SAVE / LOAD HELPER FUNCTIONS ----------

(deffunction save-answers (?filename)
  "Writes all response facts to a plain-text answer file."
  (bind ?fh (open ?filename answer-file "w"))
  (if (or (not ?fh) (eq ?fh FALSE))
    then
      (printout t "  [!] Could not open file for writing: " ?filename crlf)
    else
      (printout answer-file ";;; HIPAA SCA Answer File" crlf)
      (printout answer-file ";;; Format: control_id=answer" crlf)
      (printout answer-file ";;; Generated by HHS-SR-164_310-Physical-DEMO.clp" crlf)
      (do-for-all-facts ((?r response)) TRUE
        (printout answer-file (fact-slot-value ?r id) "=" (fact-slot-value ?r answer) crlf)
      )
      (close answer-file)
      (printout t "  Answers saved to: " ?filename crlf)
  )
)

(deffunction load-answer-line (?line)
  "Parses a line of the form PHYS-NN=ANS and returns a multifield (id ans) or FALSE."
  (bind ?eq (str-index "=" ?line))
  (if (not ?eq)
    then FALSE
    else
      (bind ?id  (sub-string 1 (- ?eq 1) ?line))
      (bind ?ans (sub-string (+ ?eq 1) (str-length ?line) ?line))
      (create$ ?id ?ans)
  )
)


;;; ---------- PHASE 1: BANNER ----------

(defrule show-banner
  (declare (salience 100))
  ?s <- (assessment-state (phase "banner"))
  =>
  (printout t crlf)
  (printout t "  ============================================================" crlf)
  (printout t "  >>> DEMONSTRATION VERSION (Proof-of-Concept)            <<<" crlf)
  (printout t "  >>> First 8 Controls Only -- For Evaluation Purposes    <<<" crlf)
  (printout t "  ============================================================" crlf)
  (printout t crlf)
  (printout t "  ============================================================" crlf)
  (printout t "  HIPAA Security Rule - Safeguard Compliance Assessment (SCA)"             crlf)
  (printout t "  Expert System (ES) (v1.0)"            crlf)
  (printout t "  Physical Safeguards  |  Controls PHYS-01 to PHYS-08"    crlf)
  (printout t "  45 CFR Part 164.310 Security Rule  |  HHS RIN 0945-AA22 NPRM"   crlf)
  (printout t "  ------------------------------------------------------------" crlf)
  (printout t "  Copyright 2026.  Thomas P. Dover.  All Rights Reserved."     crlf)
  (printout t "  Contact: tdover@pas-lp.com  |  tpd_phd@yahoo.com"           crlf)
  (printout t "  ============================================================" crlf)
  (printout t crlf)
  (printout t "  ABOUT PHYSICAL SAFEGUARDS" crlf)
  (printout t "  ===============================" crlf)
  (printout t "  Each 'Covered Entity' (Healthcare Delivery Organization) and" crlf)
  (printout t "  'Business Associate' (Contractor, Vendor, 3rd Party) must, in" crlf)
  (printout t "  accordance with §§ 164.306 (General Rules) and 164.316" crlf)
  (printout t "  (Policies, Procedures, and Documentation Requirements)," crlf)
  (printout t "  implement safeguards to protect the confidentiality," crlf)
  (printout t "  integrity, and availability of all electronic protected health" crlf)
  (printout t "  information that it creates, receives, maintains, or" crlf)
  (printout t "  transmits." crlf)
  (printout t "  ===============================" crlf)
  (printout t crlf)
  (printout t "  Answer codes:"                                                crlf)
  (printout t "    Y   = Yes         (fully implemented)"                      crlf)
  (printout t "    N   = No          (not implemented)"                        crlf)
  (printout t "    P   = Partial     (partially implemented)"                  crlf)
  (printout t "    DNA = Does Not Apply"                                       crlf)
  (printout t "    ALT = Alternative measure in place"                         crlf)
  (printout t "    U   = Unknown"                                              crlf)
  (printout t crlf)
  (printout t "  Scoring:  Y/ALT/DNA = 1.0  |  P = 0.5  |  N/U = 0.0"       crlf)
  (printout t crlf)
  (printout t "  NOTE: Findings and Recommendations are presented in the"     crlf)
  (printout t "  End-of-Assessment Report after all questions are answered."   crlf)
  (printout t crlf)

  ;;; --- Report Mode ---
  (printout t "  ------------------------------------------------------------" crlf)
  (printout t "  REPORT MODE"                                                  crlf)
  (printout t "  ------------------------------------------------------------" crlf)
  (printout t "    1 = Standard  (plain language guidance)"                    crlf)
  (printout t "    2 = Technical (plain language + NIST control references)"   crlf)
  (printout t crlf)
  (bind ?mode-str "")
  (while (not (or (eq ?mode-str "1") (eq ?mode-str "2")))
    (printout t "  Enter selection (1 or 2): ")
    (bind ?mode-str (upcase (readline)))
    (if (not (or (eq ?mode-str "1") (eq ?mode-str "2")))
      then
        (printout t crlf)
        (printout t "  [!] Invalid entry -- please enter 1 or 2." crlf)
        (printout t crlf)
    )
  )
  (printout t crlf)

  ;;; --- Output Format ---
  (printout t "  ------------------------------------------------------------" crlf)
  (printout t "  OUTPUT FORMAT"                                                crlf)
  (printout t "  ------------------------------------------------------------" crlf)
  (printout t "    T = Text file  (.txt)"                                      crlf)
  (printout t "    H = HTML file  (.html)  opens in browser, printable to PDF" crlf)
  (printout t "    N = No file    (screen only)"                               crlf)
  (printout t crlf)
  (bind ?fmt-str "")
  (while (not (or (eq ?fmt-str "T") (eq ?fmt-str "H") (eq ?fmt-str "N")))
    (printout t "  Enter selection (T / H / N): ")
    (bind ?fmt-str (upcase (readline)))
    (if (not (or (eq ?fmt-str "T") (eq ?fmt-str "H") (eq ?fmt-str "N")))
      then
        (printout t crlf)
        (printout t "  [!] Invalid entry -- please enter T, H, or N." crlf)
        (printout t crlf)
    )
  )
  (printout t crlf)

  ;;; --- Report File Path (if format is not N) ---
  (bind ?rpt-path "")
  (if (neq ?fmt-str "N")
    then
      (bind ?ext (if (eq ?fmt-str "T") then ".txt" else ".html"))
      (printout t "  ------------------------------------------------------------" crlf)
      (printout t "  REPORT FILE LOCATION"                                        crlf)
      (printout t "  ------------------------------------------------------------" crlf)
      (printout t "  To specify a folder:"                                         crlf)
      (printout t "    1. Open Windows Explorer and navigate to your folder."      crlf)
      (printout t "    2. Click the address bar -- it shows the path."             crlf)
      (printout t "    3. Copy the path (Ctrl+C)."                                 crlf)
      (printout t "    4. Paste here (right-click or Ctrl+V) and add a filename."  crlf)
      (printout t "       Example: C:\Users\YourName\Documents\SCA-310-DEMO-Report" ?ext crlf)
      (printout t crlf)
      (printout t "  Press ENTER to save in the CLIPS program folder"              crlf)
      (printout t "  as SCA-310-DEMO-Report" ?ext "." crlf)
      (printout t crlf)
      (printout t "  Enter path or press ENTER: ")
      (bind ?rpt-input (readline))
      (printout t crlf)
      (if (eq ?rpt-input "")
        then (bind ?rpt-path (str-cat "SCA-310-DEMO-Report" ?ext))
        else (bind ?rpt-path ?rpt-input)
      )
      (printout t "  Report file set to: " ?rpt-path crlf)
      (printout t crlf)
  )

  ;;; --- Answer File Path ---
  (printout t "  ------------------------------------------------------------" crlf)
  (printout t "  ANSWER FILE LOCATION"                                          crlf)
  (printout t "  ------------------------------------------------------------" crlf)
  (printout t "  The answer file saves your responses for future sessions."     crlf)
  (printout t crlf)
  (printout t "  To specify a folder:"                                          crlf)
  (printout t "    1. Open Windows Explorer and navigate to your folder."       crlf)
  (printout t "    2. Click the address bar at the top -- it shows the path."   crlf)
  (printout t "    3. Copy the path (Ctrl+C)."                                  crlf)
  (printout t "    4. Paste it here (right-click or Ctrl+V) and add a"          crlf)
  (printout t "       filename at the end."                                     crlf)
  (printout t "       Example: C:\Users\YourName\Documents\SCA-310-DEMO-Answers.txt"  crlf)
  (printout t crlf)
  (printout t "  Press ENTER to save in the CLIPS program folder"               crlf)
  (printout t "  (SCA-310-DEMO-Answers.txt in the folder where CLIPS.exe is located)."   crlf)
  (printout t crlf)
  (printout t "  Enter path or press ENTER: ")
  (bind ?path-input (readline))
  (printout t crlf)
  (if (eq ?path-input "")
    then (bind ?save-path "SCA-310-DEMO-Answers.txt")
    else (bind ?save-path ?path-input)
  )
  (printout t "  Answer file set to: " ?save-path crlf)
  (printout t crlf)

  ;;; --- Check if answer file exists at that path ---
  (bind ?probe-fh (open ?save-path probe-file "r"))
  (if (and ?probe-fh (neq ?probe-fh FALSE))
    then
      (close probe-file)
      (printout t "  Previous answer file found." crlf)
      ;;; Drain any residual newline left in buffer before Y/N prompt
      (bind ?load-ans "")
      (while (eq ?load-ans "")
        (printout t "  Load answers from previous session? (Y/N): ")
        (bind ?load-ans (upcase (readline)))
        (if (eq ?load-ans "")
          then (printout t crlf))
      )
      (printout t crlf)
  else
      (bind ?load-ans "N")
  )

  ;;; --- Prompt for assessment date stamp ---
  (printout t "  ------------------------------------------------------------" crlf)
  (printout t "  ASSESSMENT DATE" crlf)
  (printout t "  ------------------------------------------------------------" crlf)
  (printout t "  Enter date for the report (MM-DD-YYYY)" crlf)
  (printout t "  or press ENTER to leave blank." crlf)
  (printout t "  Date: ")
  (bind ?ts-input (readline))
  (if (eq ?ts-input "")
    then (bind ?ts-input "Not recorded")
  )
  (printout t crlf)
  (printout t "  ------------------------------------------------------------" crlf)
  (printout t "  COMPLETED BY" crlf)
  (printout t "  ------------------------------------------------------------" crlf)
  (printout t "  Enter name of person completing assessment," crlf)
  (printout t "  or press ENTER to leave blank." crlf)
  (printout t "  Completed by: ")
  (bind ?cb-input (readline))
  (if (eq ?cb-input "")
    then (bind ?cb-input "Not recorded")
  )
  (printout t "  Title: ")
  (bind ?title-input (readline))
  (if (eq ?title-input "")
    then (bind ?title-input "Not recorded")
  )
  (printout t "  Organization: ")
  (bind ?org-input (readline))
  (if (eq ?org-input "")
    then (bind ?org-input "Not recorded")
  )
  (printout t crlf)

  (if (eq ?load-ans "Y")
    then
      (bind ?fname ?save-path)
      (printout t crlf)
      ;;; --- Attempt to open and read the file ---
      (bind ?fh (open ?fname load-file "r"))
      (if (or (not ?fh) (eq ?fh FALSE))
        then
          (printout t "  [!] File not found: " ?fname crlf)
          (printout t "  Starting fresh assessment." crlf)
          (printout t crlf)
          (bind ?rpt-fh (open-report-file ?rpt-path ?fmt-str))
          (modify ?s (phase "asking") (qnum 1) (report-mode ?mode-str) (answer-path ?save-path)
                     (report-format ?fmt-str) (report-path ?rpt-path) (report-fh ?rpt-fh)
                     (timestamp ?ts-input) (completed-by ?cb-input) (assessor-title ?title-input) (organization ?org-input))
        else
          (printout t "  Loading answers from: " ?fname crlf)
          (bind ?loaded 0)
          (bind ?errors 0)
          (bind ?line (readline load-file))
          (while (neq ?line EOF)
            ;;; Skip comment lines starting with ;
            (if (neq (sub-string 1 1 ?line) ";")
              then
                (bind ?parsed (load-answer-line ?line))
                (if ?parsed
                  then
                    (bind ?lid (nth$ 1 ?parsed))
                    (bind ?lans (nth$ 2 ?parsed))
                    ;;; Find matching qdata to rebuild full response fact
                    (bind ?matched FALSE)
                    (do-for-fact ((?q qdata)) (eq (nth$ 2 (fact-slot-value ?q implied)) ?lid)
                      (bind ?matched TRUE)
                      (bind ?qfc  (nth$ 10 (fact-slot-value ?q implied)))
                      (bind ?qfp  (nth$ 11 (fact-slot-value ?q implied)))
                      (bind ?qfg  (nth$ 12 (fact-slot-value ?q implied)))
                      (bind ?qfn  (nth$ 14 (fact-slot-value ?q implied)))
                      (bind ?qsec (nth$ 3  (fact-slot-value ?q implied)))
                      (bind ?qpw  (nth$ 8  (fact-slot-value ?q implied)))
                      (bind ?qw   (nth$ 9  (fact-slot-value ?q implied)))
                      (bind ?qrcp (nth$ 15 (fact-slot-value ?q implied)))
                      (bind ?qrct (nth$ 16 (fact-slot-value ?q implied)))
                      (bind ?qrpp (nth$ 17 (fact-slot-value ?q implied)))
                      (bind ?qrpt (nth$ 18 (fact-slot-value ?q implied)))
                      (bind ?qrnp (nth$ 19 (fact-slot-value ?q implied)))
                      (bind ?qrnt (nth$ 20 (fact-slot-value ?q implied)))
                      (bind ?qrfn (nth$ 21 (fact-slot-value ?q implied)))
                      (bind ?qrsc (nth$ 22 (fact-slot-value ?q implied)))
                      (bind ?qrss (nth$ 23 (fact-slot-value ?q implied)))
                      (bind ?qrpg (nth$ 24 (fact-slot-value ?q implied)))
                      (bind ?qsc  (score-answer  ?lans ?qpw ?qw))
                      (bind ?qfnd (finding-for   ?lans ?qfc ?qfp ?qfg ?qfn))
                      (bind ?qnc  (if (noncompliant-answer? ?lans) then "yes" else "no"))
                      (assert (response
                        (id ?lid) (answer ?lans) (finding ?qfnd) (score ?qsc)
                        (noncompliant-flag ?qnc)
                        (section ?qsec) (section2 (extract-section2 ?qfg))
                        (rem-compliant-plain ?qrcp) (rem-compliant-technical ?qrct)
                        (rem-partial-plain ?qrpp) (rem-partial-technical ?qrpt)
                        (rem-noncompliant-plain ?qrnp) (rem-noncompliant-technical ?qrnt)
                        (ref-name ?qrfn) (ref-security-control ?qrsc)
                        (ref-sections ?qrss) (ref-pages ?qrpg)))
                      (bind ?loaded (+ ?loaded 1))
                    )
                    (if (not ?matched)
                      then (bind ?errors (+ ?errors 1)))
                )
            )
            (bind ?line (readline load-file))
          )
          (close load-file)
          (bind ?rpt-fh (open-report-file ?rpt-path ?fmt-str))
          (printout t "  Loaded " ?loaded " answers." crlf)
          (if (> ?errors 0)
            then (printout t "  [!] " ?errors " unrecognized entries skipped." crlf))
          (printout t crlf)
          (if (= ?loaded 8)
            then
              (printout t "  All 8 answers loaded -- proceeding to report." crlf)
              (printout t crlf)
              (modify ?s (phase "report") (report-mode ?mode-str) (answer-path ?save-path)
                         (report-format ?fmt-str) (report-path ?rpt-path) (report-fh ?rpt-fh)
                         (timestamp ?ts-input) (completed-by ?cb-input) (assessor-title ?title-input) (organization ?org-input))
            else
              (bind ?resume (+ ?loaded 1))
              (printout t "  Resuming from question " ?resume "." crlf)
              (printout t crlf)
              (modify ?s (phase "asking") (qnum ?resume) (report-mode ?mode-str) (answer-path ?save-path)
                         (report-format ?fmt-str) (report-path ?rpt-path) (report-fh ?rpt-fh)
                         (timestamp ?ts-input) (completed-by ?cb-input) (assessor-title ?title-input) (organization ?org-input))
          )
      )
    else
      (bind ?rpt-fh (open-report-file ?rpt-path ?fmt-str))
      (modify ?s (phase "asking") (qnum 1) (report-mode ?mode-str)
                 (answer-path ?save-path) (report-format ?fmt-str)
                 (report-path ?rpt-path) (report-fh ?rpt-fh)
                 (timestamp ?ts-input) (completed-by ?cb-input) (assessor-title ?title-input) (organization ?org-input))
  )
)


;;; ---------- PHASE 2: INTERACTIVE Q&A LOOP ----------

(defrule ask-next-question
  (declare (salience 50))
  ?s <- (assessment-state (phase "asking") (qnum ?n) (report-mode ?rmode)
                          (report-fh ?rpt-fh) (report-format ?rpt-fmt))
  (qdata ?n ?id ?section ?standard ?text
         ?compliant ?partial ?pw ?w
         ?fc ?fp ?fg ?rem ?fn
         ?rcp ?rct ?rpp ?rpt_tech ?rnp ?rnt
         ?refname ?refsec ?refsections ?refpages
         ?rule-src ?rule-src-def)
  (not (response (id ?id)))
  =>
  (printout t "  ------------------------------------------------------------" crlf)
  (printout t (str-cat "  [" ?id "]  " ?standard "  |  CFR: " ?section) crlf)
  (printout t "  ------------------------------------------------------------" crlf)
  (bind ?prefix (str-cat "  Q" ?n ": "))
  (printout t ?prefix)
  (print-wrapped ?text "       " "       " 105 nil "N")
  (printout t crlf)
  ;;; --- Retry loop: keep prompting until a valid answer is received ---
  (bind ?ans "")
  (while (not (valid-answer? ?ans))
    (printout t "  Enter answer (Y / N / P / DNA / ALT / U): ")
    (bind ?ans (normalize-answer (upcase (readline))))
    (if (not (valid-answer? ?ans))
      then
        (printout t crlf)
        (printout t "  [!] Invalid entry -- please enter Y, N, P, DNA, ALT, or U." crlf)
        (printout t crlf)
    )
  )
  (bind ?sc  (score-answer  ?ans ?pw ?w))
  (bind ?fnd (finding-for   ?ans ?fc ?fp ?fg ?fn))
  (bind ?nc (if (noncompliant-answer? ?ans) then "yes" else "no"))
  (assert (response (id ?id) (answer ?ans) (finding ?fnd) (score ?sc) (noncompliant-flag ?nc)
                   (section ?section) (section2 (extract-section2 ?fg))
                   (rem-compliant-plain ?rcp) (rem-compliant-technical ?rct)
                   (rem-partial-plain ?rpp) (rem-partial-technical ?rpt_tech)
                   (rem-noncompliant-plain ?rnp) (rem-noncompliant-technical ?rnt)
                   (ref-name ?refname) (ref-security-control ?refsec)
                   (ref-sections ?refsections) (ref-pages ?refpages)))
  (printout t crlf)
  (if (< ?n 8)
    then (modify ?s (qnum (+ ?n 1)))
    else (modify ?s (phase "report"))
  )
)

;;; ---------- PHASE 3: FINAL REPORT ----------

(defrule generate-report
  (declare (salience 10))
  ?s <- (assessment-state (phase "report") (report-mode ?rmode)
                          (report-fh ?rpt-fh) (report-format ?rpt-fmt)
                          (timestamp ?rpt-ts)
                          (completed-by ?rpt-cb) (assessor-title ?rpt-title)
                          (organization ?rpt-org))
  (not (assessment-state (phase "report-done")))
  =>
  ;;; --- Compute total score by iterating all response facts ---
  (bind ?total    0.0)
  (bind ?possible 8.0)
  (bind ?compliant-count    0)
  (bind ?partial-count      0)
  (bind ?noncompliant-count 0)
  (bind ?dna-count          0)
  (do-for-all-facts ((?r response)) TRUE
    (bind ?total (+ ?total (fact-slot-value ?r score)))
    (bind ?ans (fact-slot-value ?r answer))
    (if (or (eq ?ans "Y") (eq ?ans "ALT"))
      then (bind ?compliant-count (+ ?compliant-count 1)))
    (if (eq ?ans "P")
      then (bind ?partial-count (+ ?partial-count 1)))
    (if (or (eq ?ans "N") (eq ?ans "U"))
      then (bind ?noncompliant-count (+ ?noncompliant-count 1)))
    (if (eq ?ans "DNA")
      then (bind ?dna-count (+ ?dna-count 1)))
  )
  (bind ?pct     (* (/ ?total ?possible) 100.0))
  (bind ?pct-str (format nil "%.2f" ?pct))

  ;;; --- Report banner (mirrors interactive banner) ---
  (tee-blank ?rpt-fh ?rpt-fmt)
  (tee-blank ?rpt-fh ?rpt-fmt)
  (tee-line ?rpt-fh ?rpt-fmt "  ============================================================")
  (tee-line ?rpt-fh ?rpt-fmt "  >>> DEMONSTRATION VERSION (Proof-of-Concept)            <<<")
  (tee-line ?rpt-fh ?rpt-fmt "  >>> First 8 Controls Only -- For Evaluation Purposes    <<<")
  (tee-line ?rpt-fh ?rpt-fmt "  ============================================================")
  (tee-blank ?rpt-fh ?rpt-fmt)
  (tee-line ?rpt-fh ?rpt-fmt "  ============================================================")
  (tee-line ?rpt-fh ?rpt-fmt "  HIPAA Security Rule - Safeguard Compliance Assessment (SCA)")
  (tee-line ?rpt-fh ?rpt-fmt "  Expert System (ES) (v1.0)")
  (tee-line ?rpt-fh ?rpt-fmt "  Physical Safeguards  |  Controls PHYS-01 to PHYS-08")
  (tee-line ?rpt-fh ?rpt-fmt "  45 CFR Part 164.310 Security Rule  |  HHS RIN 0945-AA22 NPRM")
  (tee-line ?rpt-fh ?rpt-fmt "  ------------------------------------------------------------")
  (tee-line ?rpt-fh ?rpt-fmt "  Copyright 2026.  Thomas P. Dover.  All Rights Reserved.")
  (tee-line ?rpt-fh ?rpt-fmt "  Contact: tdover@pas-lp.com  |  tpd_phd@yahoo.com")
  (tee-line ?rpt-fh ?rpt-fmt "  ============================================================")
  (tee-blank ?rpt-fh ?rpt-fmt)
  (tee-line ?rpt-fh ?rpt-fmt "  ABOUT PHYSICAL SAFEGUARDS")
  (tee-line ?rpt-fh ?rpt-fmt "  ===============================")
  (tee-line ?rpt-fh ?rpt-fmt "  Each 'Covered Entity' (Healthcare Delivery Organization) and")
  (tee-line ?rpt-fh ?rpt-fmt "  'Business Associate' (Contractor, Vendor, 3rd Party) must, in")
  (tee-line ?rpt-fh ?rpt-fmt "  accordance with §§ 164.306 (General Rules) and 164.316")
  (tee-line ?rpt-fh ?rpt-fmt "  (Policies, Procedures, and Documentation Requirements),")
  (tee-line ?rpt-fh ?rpt-fmt "  implement safeguards to protect the confidentiality,")
  (tee-line ?rpt-fh ?rpt-fmt "  integrity, and availability of all electronic protected health")
  (tee-line ?rpt-fh ?rpt-fmt "  information that it creates, receives, maintains, or")
  (tee-line ?rpt-fh ?rpt-fmt "  transmits.")
  (tee-line ?rpt-fh ?rpt-fmt "  ===============================")

  ;;; --- Assessment Complete banner ---
  (tee-blank ?rpt-fh ?rpt-fmt)
  (tee-line ?rpt-fh ?rpt-fmt "+++ ASSESSMENT COMPLETE +++")
  (tee-line ?rpt-fh ?rpt-fmt (str-cat "  Assessment Date: " ?rpt-ts))
  (tee-line ?rpt-fh ?rpt-fmt (str-cat "  Completed by   : " ?rpt-cb))
  (tee-line ?rpt-fh ?rpt-fmt (str-cat "  Title          : " ?rpt-title))
  (tee-line ?rpt-fh ?rpt-fmt (str-cat "  Organization   : " ?rpt-org))
  (tee-blank ?rpt-fh ?rpt-fmt)

  ;;; --- RESULTS header ---
  (tee-line ?rpt-fh ?rpt-fmt "  ============================================================")
  (tee-line ?rpt-fh ?rpt-fmt "  RESULTS")
  (tee-line ?rpt-fh ?rpt-fmt "  ============================================================")
  (tee-blank ?rpt-fh ?rpt-fmt)

  ;;; --- Report Header ---
  (tee-line ?rpt-fh ?rpt-fmt "  ============================================================")
  (tee-line ?rpt-fh ?rpt-fmt "  HIPAA SCA ASSESSMENT REPORT")
  (tee-line ?rpt-fh ?rpt-fmt "  Physical Safeguards  |  PHYS-01 to PHYS-08")
  (tee-line ?rpt-fh ?rpt-fmt "  ============================================================")
  (tee-blank ?rpt-fh ?rpt-fmt)

  ;;; --- STATISTICS section ---
  (tee-line ?rpt-fh ?rpt-fmt "  ------------------------------------------------------------")
  (tee-line ?rpt-fh ?rpt-fmt "  STATISTICS")
  (tee-line ?rpt-fh ?rpt-fmt "  ------------------------------------------------------------")
  (tee-line ?rpt-fh ?rpt-fmt (str-cat "  TOTAL SCORE  : " ?total " / " ?possible))
  (tee-line ?rpt-fh ?rpt-fmt (str-cat "  PERCENTAGE   : " ?pct-str "%"))
  (tee-blank ?rpt-fh ?rpt-fmt)
  (tee-line ?rpt-fh ?rpt-fmt (str-cat "  Compliant        : " ?compliant-count))
  (tee-line ?rpt-fh ?rpt-fmt (str-cat "  Partial          : " ?partial-count))
  (tee-line ?rpt-fh ?rpt-fmt (str-cat "  Non-compliant    : " ?noncompliant-count))
  (tee-line ?rpt-fh ?rpt-fmt (str-cat "  Does Not Apply   : " ?dna-count " (scored as compliant)"))
  (tee-blank ?rpt-fh ?rpt-fmt)

  ;;; --- ANSWER KEY section ---
  (tee-line ?rpt-fh ?rpt-fmt "  ------------------------------------------------------------")
  (tee-line ?rpt-fh ?rpt-fmt "  ANSWER KEY")
  (tee-line ?rpt-fh ?rpt-fmt "  ------------------------------------------------------------")
  (if (neq ?rpt-fmt "H") then (tee-line ?rpt-fh ?rpt-fmt "  Control  | Ans |  Scr  | Finding            | Rule Source"))
  (if (neq ?rpt-fmt "H") then (tee-line ?rpt-fh ?rpt-fmt "  ---------+-----+-------+--------------------+------------"))
  (if (and (neq ?rpt-fh nil) (neq ?rpt-fh FALSE) (eq ?rpt-fmt "H")) then
    (printout report-file "<table><tr><th>Control</th><th>Ans</th><th>Score</th><th>Finding</th><th>Rule Source</th></tr>" crlf))
  (do-for-all-facts ((?r response)) TRUE
    (bind ?row-id  (fact-slot-value ?r id))
    (bind ?row-ans (abbrev-answer (fact-slot-value ?r answer)))
    (bind ?row-sc  (format nil "%.1f" (fact-slot-value ?r score)))
    (bind ?row-fnd (fact-slot-value ?r finding))
    (bind ?row-rs  "")
    (do-for-fact ((?q qdata)) (eq (nth$ 2 (fact-slot-value ?q implied)) ?row-id)
      (bind ?row-rs (nth$ 25 (fact-slot-value ?q implied)))
    )
    (bind ?row-ans-p (sub-string 1 3  (str-cat ?row-ans "   ")))
    (bind ?row-fnd-p (sub-string 1 18 (str-cat ?row-fnd "                  ")))
    (bind ?row-rs-p  (sub-string 1 5  (str-cat ?row-rs  "     ")))
    (if (neq ?rpt-fmt "H") then (tee-line ?rpt-fh ?rpt-fmt (str-cat "  " ?row-id "  | " ?row-ans-p " |  " ?row-sc "  | " ?row-fnd-p " | " ?row-rs-p)))
    (if (and (neq ?rpt-fh nil) (neq ?rpt-fh FALSE) (eq ?rpt-fmt "H")) then
      (printout report-file "<tr><td>" ?row-id "</td><td>" ?row-ans "</td><td>" ?row-sc "</td><td>" ?row-fnd "</td><td>" ?row-rs "</td></tr>" crlf))
  )
  (if (and (neq ?rpt-fh nil) (neq ?rpt-fh FALSE) (eq ?rpt-fmt "H")) then
    (printout report-file "</table>" crlf))
  (tee-blank ?rpt-fh ?rpt-fmt)

  ;;; --- COMPLIANCE section (all responses) ---
  (tee-line ?rpt-fh ?rpt-fmt "  ============================================================")
  (tee-line ?rpt-fh ?rpt-fmt "  COMPLIANT")
  (tee-line ?rpt-fh ?rpt-fmt "  ============================================================")
  (do-for-all-facts ((?r response)) TRUE
    (bind ?ctrl   (fact-slot-value ?r id))
    (bind ?ans    (fact-slot-value ?r answer))
    (bind ?fnd    (fact-slot-value ?r finding))
    (bind ?sec    (fact-slot-value ?r section))
    ;;; Only show Y and ALT responses in COMPLIANT section; DNA gets its own NOT APPLICABLE section
    (if (or (eq ?ans "Y") (eq ?ans "ALT"))
      then
        ;;; Look up question_text from qdata (nth$ 5)
        (bind ?qtxt "")
        (do-for-fact ((?q qdata)) (eq (nth$ 2 (fact-slot-value ?q implied)) ?ctrl)
          (bind ?qtxt (nth$ 5 (fact-slot-value ?q implied)))
          (bind ?std  (nth$ 4 (fact-slot-value ?q implied)))
          (bind ?rsd  (nth$ 26 (fact-slot-value ?q implied)))
        )
        (if (neq ?rpt-fmt "H") then
          (tee-blank ?rpt-fh ?rpt-fmt)
          (tee-line ?rpt-fh ?rpt-fmt (str-cat "  [" ?ctrl "]"))
          (tee-line ?rpt-fh ?rpt-fmt (str-cat "  Standard      : " (upcase ?std)))
          (tee-line ?rpt-fh ?rpt-fmt (str-cat "  Specification : " ?sec))
          (tee-line ?rpt-fh ?rpt-fmt (str-cat "  Rule Source   : " ?rsd))
          (print-wrapped ?qtxt "  Question      : " "                  " 100 ?rpt-fh ?rpt-fmt)
          (tee-line ?rpt-fh ?rpt-fmt (str-cat "  Answer        : " ?ans))
          (tee-line ?rpt-fh ?rpt-fmt (str-cat "  Finding       : " ?fnd))
        )
        (if (and (neq ?rpt-fh nil) (neq ?rpt-fh FALSE) (eq ?rpt-fmt "H")) then
          (printout report-file
            "<div class=\"section\">"
            "<strong>[" ?ctrl "]</strong><br>"
            "<strong>Standard:</strong> " (upcase ?std) "<br>"
            "<strong>Specification:</strong> " ?sec "<br>"
            "<strong>Rule Source:</strong> " ?rsd "<br>"
            "<strong>Question:</strong> " ?qtxt "<br>"
            "<strong>Answer:</strong> " ?ans " | "
            "<strong>Finding:</strong> " ?fnd
            "</div>" crlf)
        )
    )
  )
  (tee-blank ?rpt-fh ?rpt-fmt)

  ;;; --- RECOMMENDATIONS AND GUIDANCE section ---
  (tee-line ?rpt-fh ?rpt-fmt "  ============================================================")
  (tee-line ?rpt-fh ?rpt-fmt "  NON-COMPLIANT AND PARTIAL COMPLIANCE  |  RECOMMENDATIONS AND GUIDANCE")
  (tee-line ?rpt-fh ?rpt-fmt "  ============================================================")
  (do-for-all-facts ((?r response)) TRUE
    (bind ?fnd  (fact-slot-value ?r finding))
    (if (or (eq ?fnd "Partial Compliance") (eq ?fnd "Non-compliant"))
      then
        (bind ?ctrl   (fact-slot-value ?r id))
        (bind ?sec    (fact-slot-value ?r section))
        (bind ?ans    (fact-slot-value ?r answer))
        (bind ?rpp    (fact-slot-value ?r rem-partial-plain))
        (bind ?rpt-p  (fact-slot-value ?r rem-partial-technical))
        (bind ?rnp    (fact-slot-value ?r rem-noncompliant-plain))
        (bind ?rnt    (fact-slot-value ?r rem-noncompliant-technical))
        (bind ?rfn    (fact-slot-value ?r ref-name))
        (bind ?rsc    (fact-slot-value ?r ref-security-control))
        (bind ?rss    (fact-slot-value ?r ref-sections))
        (bind ?rpg    (fact-slot-value ?r ref-pages))
        ;;; Look up question_text from qdata (nth$ 5)
        (bind ?qtxt "")
        (do-for-fact ((?q qdata)) (eq (nth$ 2 (fact-slot-value ?q implied)) ?ctrl)
          (bind ?qtxt (nth$ 5 (fact-slot-value ?q implied)))
          (bind ?std  (nth$ 4 (fact-slot-value ?q implied)))
          (bind ?rsd  (nth$ 26 (fact-slot-value ?q implied)))
        )
        (if (neq ?rpt-fmt "H") then
          (tee-blank ?rpt-fh ?rpt-fmt)
          (tee-line ?rpt-fh ?rpt-fmt (str-cat "  [" ?ctrl "]"))
          (tee-line ?rpt-fh ?rpt-fmt (str-cat "  Standard      : " (upcase ?std)))
          (tee-line ?rpt-fh ?rpt-fmt (str-cat "  Specification : " ?sec))
          (tee-line ?rpt-fh ?rpt-fmt (str-cat "  Rule Source   : " ?rsd))
          (print-wrapped ?qtxt "  Question      : " "                  " 100 ?rpt-fh ?rpt-fmt)
          (tee-line ?rpt-fh ?rpt-fmt (str-cat "  Answer        : " ?ans))
          (tee-line ?rpt-fh ?rpt-fmt (str-cat "  Finding       : " ?fnd))
        )
        (if (and (neq ?rpt-fh nil) (neq ?rpt-fh FALSE) (eq ?rpt-fmt "H")) then
          (bind ?div-cls (if (eq ?fnd "Non-compliant") then "finding-nc" else "finding-p"))
          (printout report-file
            "<div class=\"" ?div-cls "\">"
            "<strong>[" ?ctrl "]</strong><br>"
            "<strong>Standard:</strong> " (upcase ?std) "<br>"
            "<strong>Specification:</strong> " ?sec "<br>"
            "<strong>Rule Source:</strong> " ?rsd "<br>"
            "<strong>Question:</strong> " ?qtxt "<br>"
            "<strong>Answer:</strong> " ?ans " | "
            "<strong>Finding:</strong> " ?fnd "<br>" crlf)
        )
        ;;; Plain guidance (always shown)
        (bind ?rem-plain (if (eq ?fnd "Partial Compliance") then ?rpp else ?rnp))
        (if (neq ?rem-plain "") then
          (if (neq ?rpt-fmt "H") then
            (print-wrapped ?rem-plain "  Guidance  : " "              " 100 ?rpt-fh ?rpt-fmt))
          (if (and (neq ?rpt-fh nil) (neq ?rpt-fh FALSE) (eq ?rpt-fmt "H")) then
            (printout report-file "<p class=\"guidance\"><strong>Guidance:</strong> " ?rem-plain "</p>" crlf))
        )
        ;;; Technical guidance + reference (mode 2 only)
        (if (eq ?rmode "2") then
          (bind ?rem-tech (if (eq ?fnd "Partial Compliance") then ?rpt-p else ?rnt))
          (if (neq ?rem-tech "") then
            (if (neq ?rpt-fmt "H") then
              (print-wrapped ?rem-tech "  Technical : " "              " 100 ?rpt-fh ?rpt-fmt))
            (if (and (neq ?rpt-fh nil) (neq ?rpt-fh FALSE) (eq ?rpt-fmt "H")) then
              (printout report-file "<p class=\"technical\"><strong>Technical:</strong> " ?rem-tech "</p>" crlf))
          )
          (if (neq ?rfn "") then
            (if (neq ?rpt-fmt "H") then
              (tee-line ?rpt-fh ?rpt-fmt (str-cat "  Reference        : " ?rfn))
              (tee-line ?rpt-fh ?rpt-fmt (str-cat "  Security Control : " ?rsc))
              (tee-line ?rpt-fh ?rpt-fmt (str-cat "  Sections         : " ?rss))
              (tee-line ?rpt-fh ?rpt-fmt (str-cat "  Pages            : " ?rpg)))
            (if (and (neq ?rpt-fh nil) (neq ?rpt-fh FALSE) (eq ?rpt-fmt "H")) then
              (printout report-file "<p class=\"reference\">Reference: " ?rfn " | " ?rsc " | Sections: " ?rss " | Pages: " ?rpg "</p>" crlf))
          )
        )
        (if (and (neq ?rpt-fh nil) (neq ?rpt-fh FALSE) (eq ?rpt-fmt "H")) then
          (printout report-file "</div>" crlf))
    )
  )
  (tee-blank ?rpt-fh ?rpt-fmt)

  ;;; --- NOT APPLICABLE section (DNA responses only) ---
  (tee-line ?rpt-fh ?rpt-fmt "  ============================================================")
  (tee-line ?rpt-fh ?rpt-fmt "  NOT APPLICABLE")
  (tee-line ?rpt-fh ?rpt-fmt "  ============================================================")
  (tee-line ?rpt-fh ?rpt-fmt "  Requirements marked Does Not Apply (DNA) are scored as")
  (tee-line ?rpt-fh ?rpt-fmt "  compliant but listed here for auditor review.  Each DNA")
  (tee-line ?rpt-fh ?rpt-fmt "  determination should be documented with a written rationale.")
  (do-for-all-facts ((?r response)) TRUE
    (bind ?ans (fact-slot-value ?r answer))
    (if (eq ?ans "DNA")
      then
        (bind ?ctrl (fact-slot-value ?r id))
        (bind ?sec  (fact-slot-value ?r section))
        (bind ?fnd  (fact-slot-value ?r finding))
        (bind ?qtxt "")
        (bind ?std  "")
        (bind ?rsd  "")
        (do-for-fact ((?q qdata)) (eq (nth$ 2 (fact-slot-value ?q implied)) ?ctrl)
          (bind ?qtxt (nth$ 5 (fact-slot-value ?q implied)))
          (bind ?std  (nth$ 4 (fact-slot-value ?q implied)))
          (bind ?rsd  (nth$ 26 (fact-slot-value ?q implied)))
        )
        (if (neq ?rpt-fmt "H") then
          (tee-blank ?rpt-fh ?rpt-fmt)
          (tee-line ?rpt-fh ?rpt-fmt (str-cat "  [" ?ctrl "]"))
          (tee-line ?rpt-fh ?rpt-fmt (str-cat "  Standard      : " (upcase ?std)))
          (tee-line ?rpt-fh ?rpt-fmt (str-cat "  Specification : " ?sec))
          (tee-line ?rpt-fh ?rpt-fmt (str-cat "  Rule Source   : " ?rsd))
          (print-wrapped ?qtxt "  Question      : " "                  " 100 ?rpt-fh ?rpt-fmt)
          (tee-line ?rpt-fh ?rpt-fmt (str-cat "  Answer        : " ?ans))
          (tee-line ?rpt-fh ?rpt-fmt (str-cat "  Finding       : " ?fnd))
        )
        (if (and (neq ?rpt-fh nil) (neq ?rpt-fh FALSE) (eq ?rpt-fmt "H")) then
          (printout report-file
            "<div class=\"section\">"
            "<strong>[" ?ctrl "]</strong><br>"
            "<strong>Standard:</strong> " (upcase ?std) "<br>"
            "<strong>Specification:</strong> " ?sec "<br>"
            "<strong>Rule Source:</strong> " ?rsd "<br>"
            "<strong>Question:</strong> " ?qtxt "<br>"
            "<strong>Answer:</strong> " ?ans " | "
            "<strong>Finding:</strong> " ?fnd
            "</div>" crlf)
        )
    )
  )
  (tee-blank ?rpt-fh ?rpt-fmt)

  ;;; --- Disclaimer ---
  (tee-line ?rpt-fh ?rpt-fmt "  ============================================================")
  (tee-line ?rpt-fh ?rpt-fmt "  DISCLAIMER")
  (tee-line ?rpt-fh ?rpt-fmt "  ============================================================")
  (tee-line ?rpt-fh ?rpt-fmt "  This assessment is provided for informational purposes only.")
  (tee-line ?rpt-fh ?rpt-fmt "  It does not constitute legal advice.  The questions and")
  (tee-line ?rpt-fh ?rpt-fmt "  scoring are based on the HHS RIN 0945-AA22 Notice of")
  (tee-line ?rpt-fh ?rpt-fmt "  Proposed Rulemaking (NPRM) for the HIPAA Security Rule.")
  (tee-line ?rpt-fh ?rpt-fmt "  Question text has been modified for readability.  Please")
  (tee-line ?rpt-fh ?rpt-fmt "  refer to HHS RIN 0945-AA22 NPRM for the official regulatory")
  (tee-line ?rpt-fh ?rpt-fmt "  text and requirements.  Results should be reviewed by a")
  (tee-line ?rpt-fh ?rpt-fmt "  qualified compliance professional.")
  (tee-line ?rpt-fh ?rpt-fmt "  ============================================================")
  (tee-blank ?rpt-fh ?rpt-fmt)

  ;;; --- Save answers to file ---
  (bind ?save-path (fact-slot-value ?s answer-path))
  (if (eq ?save-path "") then (bind ?save-path "SCA-310-DEMO-Answers.txt"))
  (save-answers ?save-path)
  (close-report-file ?rpt-fh ?rpt-fmt)
  (if (and (neq ?rpt-fh nil) (neq ?rpt-fh FALSE)) then
    (printout t "  Report saved to: " (fact-slot-value ?s report-path) crlf)
    (printout t crlf))

  (modify ?s (phase "revise"))
)


;;; ---------- PHASE 4: ANSWER REVISION ----------

(defrule revise-answers
  (declare (salience 10))
  ?s <- (assessment-state (phase "revise") (report-mode ?rmode)
                          (report-fh ?rpt-fh) (report-format ?rpt-fmt)
                          (report-path ?rpt-path))
  =>
  (printout t "  ------------------------------------------------------------" crlf)
  (printout t "  ANSWER REVISION"                                              crlf)
  (printout t "  ------------------------------------------------------------" crlf)
  (printout t "  Enter a Control ID to revise (e.g. ADM-12),"                 crlf)
  (printout t "  or press ENTER to exit: ")
  (bind ?ctrl-input (upcase (readline)))
  (printout t crlf)

  (if (eq ?ctrl-input "")
    then
      ;;; --- Exit ---
      (printout t "  Assessment complete." crlf)
      (modify ?s (phase "done"))
    else
      ;;; --- Find and revise the specified control ---
      (bind ?found FALSE)
      (bind ?revised FALSE)
      (do-for-fact ((?r response)) (eq (fact-slot-value ?r id) ?ctrl-input)
        (bind ?found TRUE)
        (bind ?old-ans (fact-slot-value ?r answer))
        (printout t "  Control  : " ?ctrl-input crlf)
        (printout t "  Current answer: " ?old-ans crlf)
        (printout t crlf)
        ;;; Get new answer
        (bind ?new-ans "")
        (while (not (valid-answer? ?new-ans))
          (printout t "  Enter new answer (Y / N / P / DNA / ALT / U): ")
          (bind ?new-ans (normalize-answer (upcase (readline))))
          (if (not (valid-answer? ?new-ans))
            then
              (printout t crlf)
              (printout t "  [!] Invalid entry." crlf)
              (printout t crlf)
          )
        )
        ;;; Rebuild response with new answer using qdata for scoring
        (do-for-fact ((?q qdata)) (eq (nth$ 2 (fact-slot-value ?q implied)) ?ctrl-input)
          (bind ?qfc  (nth$ 10 (fact-slot-value ?q implied)))
          (bind ?qfp  (nth$ 11 (fact-slot-value ?q implied)))
          (bind ?qfg  (nth$ 12 (fact-slot-value ?q implied)))
          (bind ?qfn  (nth$ 14 (fact-slot-value ?q implied)))
          (bind ?qpw  (nth$ 8  (fact-slot-value ?q implied)))
          (bind ?qw   (nth$ 9  (fact-slot-value ?q implied)))
          (bind ?qsc  (score-answer  ?new-ans ?qpw ?qw))
          (bind ?qfnd (finding-for   ?new-ans ?qfc ?qfp ?qfg ?qfn))
          (bind ?qnc  (if (noncompliant-answer? ?new-ans) then "yes" else "no"))
          ;;; Capture all ?r slots BEFORE retracting - fact ref is invalid after retract
          (bind ?r-section     (fact-slot-value ?r section))
          (bind ?r-section2    (fact-slot-value ?r section2))
          (bind ?r-rcp         (fact-slot-value ?r rem-compliant-plain))
          (bind ?r-rct         (fact-slot-value ?r rem-compliant-technical))
          (bind ?r-rpp         (fact-slot-value ?r rem-partial-plain))
          (bind ?r-rpt         (fact-slot-value ?r rem-partial-technical))
          (bind ?r-rnp         (fact-slot-value ?r rem-noncompliant-plain))
          (bind ?r-rnt         (fact-slot-value ?r rem-noncompliant-technical))
          (bind ?r-rfn         (fact-slot-value ?r ref-name))
          (bind ?r-rsc         (fact-slot-value ?r ref-security-control))
          (bind ?r-rss         (fact-slot-value ?r ref-sections))
          (bind ?r-rpg         (fact-slot-value ?r ref-pages))
          (retract ?r)
          (assert (response
            (id ?ctrl-input)
            (answer ?new-ans) (finding ?qfnd) (score ?qsc)
            (noncompliant-flag ?qnc)
            (section     ?r-section)
            (section2    ?r-section2)
            (rem-compliant-plain     ?r-rcp)
            (rem-compliant-technical ?r-rct)
            (rem-partial-plain       ?r-rpp)
            (rem-partial-technical   ?r-rpt)
            (rem-noncompliant-plain  ?r-rnp)
            (rem-noncompliant-technical ?r-rnt)
            (ref-name             ?r-rfn)
            (ref-security-control ?r-rsc)
            (ref-sections         ?r-rss)
            (ref-pages            ?r-rpg)))
          (bind ?revised TRUE)
        )
      )
      ;;; Post-revision actions outside do-for-fact to avoid retracted fact ref
      (if ?revised then
        (printout t crlf)
        (printout t "  Answer updated: " ?ctrl-input " = " ?new-ans crlf)
        (printout t crlf)
        (bind ?rev-path (fact-slot-value ?s answer-path))
        (if (eq ?rev-path "") then (bind ?rev-path "SCA-310-DEMO-Answers.txt"))
        (save-answers ?rev-path)
        (printout t crlf)
        ;;; Re-open report file for revised report
        (bind ?new-fh (open-report-file ?rpt-path ?rpt-fmt))
        (modify ?s (phase "report") (report-fh ?new-fh))
      )
      (if (not ?found)
        then
          (printout t "  [!] Control ID not found: " ?ctrl-input crlf)
          (printout t "  Please enter a valid ID (PHYS-01 through PHYS-08)." crlf)
          (printout t crlf)
          ;;; Stay in revise phase
          (modify ?s (phase "revise"))
      )
  )
)

;;; ---------- PHASE 5: DONE ----------

(defrule assessment-done
  (declare (salience 10))
  (assessment-state (phase "done"))
  =>
  (printout t crlf)
)

;;; End of HHS-SR-164_310-Physical-DEMO.clp
