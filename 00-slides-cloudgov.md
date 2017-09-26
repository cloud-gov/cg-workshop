footer: ![inline 14%](images/18Flogo-192p.png) ![inline 14%](images/tweet.png) @pburkholder
theme: Zurich, 2
slidenumbers: true

---

# The case for 
# _cloud.gov_

Peter Burkholder
18F/cloud.gov Platform Engineer

^Note: Add :camera: to slides that deserve a longer linger by operator

---

[.build-lists: true]
![left](https://upload.wikimedia.org/wikipedia/commons/f/f3/Uncle_Sam_%28pointing_finger%29.jpg)

# [fit] I Want You
# to use

* :cloud: **cloud.gov**
* ➡️: Mission
* 🕑: Eliminate long lead times
* 💵: Your tax 💰 ($84.7B, 8.2% :cloud:)[^1]
* 🇺🇸: Excellent open-source services

[^1]: CIO IT Dashboard for FY2017 https://www.itdashboard.gov/#learn-basic-stats

^ Note: Here's my thesis. I want you to sign up for a PaaS.  I'd like it to be cloud.gov, but it doesn't have to be. There are 3 reasons, none of which is my sales commission. These are my reasons and I'd like them to be yours too. ^ cloud.gov enables mission like nothing else available to the federal govt at a TCO below most other options

^  Note: First, it's about the DevOps. Or DevSecOps, or DevSecCompOps. Regardless, since 2010 I've been an student of and advocate for DevOps practices: bring code development practices to operations (code, version control, tests, and automation, and operational awareness to developers (metrics, logging, sharing, composability, reliability). The DevOps why: in business, it can be summarized a short loop from "AHa!" to "KaChing" -- or "Aha" to "Mission realization". And this lag reduction through automation comes with better reliability and security than traditional operations. >> I want all of you to have this because, in the end, it's more sane and humane than the way we've done it.


^ Note: Tax dollars. $84.7 billion in unclass IT spend, only 8.2% of it in "Provisioned" Services. We can get much better value that than -- esp. when the budgets of many agencies are going to get slashed, we must deliver better value.

^ Note: Lastly, a sense of patriotism. I want beautiful, well-run sites that are a delight to use, and I want the world to share in them by building in the open. So let's get to what I mean by a full-service PaaS

---

# Road map

## 1 / The Mission
## 2 / Sign me Up
## 3 / Getting to :thumbsup:
## 4 / Case Studies

---

# 1 / The Mission

---

[.build-lists: true]
![right](images/18f-team-photo.jpg)

# Suppose:


* A mission
  * Housing for hurricane victims
* A team
  * Project / Product Managers
  * Designers / Developers
  * Ops / Security Folks
* A platform
  * **Build**
  * **Test**
  * **Run**

^ Note: This team has a lot of work to do to realize their mission. 

---

[.build-lists: true]

# Platform

* Stack: WebServer, AppServer, Database, Cache, Index
* Environments: (Local), Dev, Test, Stage, Prod
* User management: Admin, Devs, Auditors
* Operations: Patch, Logs, CDN, Scaling, Availability
* **All of this is __commodity__**: think iPad or Android Tablet
* **All of this is __commodity__**: & what constitutes a "full-service Paas"
* Feds: Acquire: weeks, Running: hours, Build: months, Authorize: weeks

^ Note: By commodity it should be no harder to run your platform that it is to run your iPad or Android table. You do not take your device to Genius Bar or equivalent to update it, or get new software, or configure the WiFi. These are self-service, have sane defaults, include vetted applications in a marketplace, and are regularly, or continually patched.

---

# Two reactions

---

![left](https://media.giphy.com/media/ogW3xiTxLO4ko/giphy.gif)

^This idea that we can treat so much of an underlying platform as self-service commodity that is still performant and compliant ---- how to address adoption/obstacles

---

![left](https://media.giphy.com/media/ogW3xiTxLO4ko/giphy.gif)
![right](https://media.giphy.com/media/V5Jc8pRfCFkQw/giphy.gif)

^Some folks will be hestitant work. That might be you -- so let's look at the potential "Nope" responses and get them to thumbs up.


---

# 2 / Sign me Up

---

# What is cloud.gov?

* open-source CloudFoundry PaaS atop AWS GovCloud[^2]
* available to Departments & Agencies by _IAA_
* FedRAMP P-ATO Moderate, DISA Level 2
* built/run by 18F/TTS/GSA as a cost-recoverable service 

[^2]: Multi-cloud w/ Azure USGov on our roadmap

---

[.footer: ]

![right](images/PaaS Grimace.png)

*Pre-built environment ready for deploying an application.*

*Developers can focus on mission needs.*

*Common technology resources are managed by an expert operations team:*

* Operating system
* Databases
* Audit trails
* Authorization and authentication
* Load balancing
* Scaling
* Vulnerability scans
* Programming languages
* Automated updates

---

# Three Stages

* Procure
* Implement
* Authorize

---

# Procure

* Pre-procurement sandbox accounts
* IAAs: weeks instead of months
* Pricing: $$Risk \times Complexity$$
  * Prototyping $$\times$$ Trivial = $20k/ann.
  * FISMA Moderate $$\times$$ Complex = $130k/ann.

---

# Implement

* Users, Spaces & Roles
* Apps
* Services

---

![left,fit](images/org-space-app-user.png)
# Implement: Users & Roles

* Authentication: 
  * Agency IdP or MAX.gov
* Authorization (CF's UAA)
  * _Manager_, _Developer_ , _Auditor_ $$\times$$
  * _Organization_ (EPA, FEC) & _Space_ (`dev`, `stage`)

---

![](https://www.site24x7.com/help/images/aws-iam-attach-policy.png)

---

![](images/cg-user-mgmt.png)

---

# Implement: Dev/Stage/Prod

```sh
cf create-space dev
cf create-space stage
cf create-space prod
```

---

# Implement: Users w/ Spaces

```sh
cf set-space-role peterb dev SpaceDeveloper
cf set-space-role peterb prod SpaceAuditor
```


---

[.build-lists: true]
# Time machine
* **Procured :white_check_mark:**
* **Implemented:**
  * **Users and Authentication :white_check_mark:**
  * **Dev/Test/Prod Environments :white_check_mark:**
  * **Roles :white_check_mark:**

^ Note: We've done the procurement, you've been provided a ;cloud.gov  organization, and you've integrated your ;cloud.gov authentication with your Agency IDP (which takes a couple of days). Then you've created the space you need and assigned your users to their appropriate roles.   All this take _months_ for bare metal or even of IaaS. And once the procurement is done, this has taken days (or less)  (https://www.google.com/patents/US20060073976)


---

# Implement: Python Application

```sh
git clone https://github.com/18F/cf-hello-worlds.git
cd cf-hello-worlds/python-flask
cf push cg-flask-demo
open https://cg-flask-demo.app.cloud.gov
cf scale cg-flask-demo -i 4 
```

---

# Implement: Demo

![inline,autoplay](images/cg-flask-demo-480p.mov)


^Note: While this runs, answer "Why not Docker?"

---

# Implement: Language

|  |  |  |
|---|---|---|
| staticfile | java | ruby 
| nodejs | go | python |
| php | binary | dotnet  |

---

# Implement: Services

|   |  | 
| --- | --- | 
| Relational databases (RDS) | PostgreSQL, MySQL, Oracle |
| Storage (S3) | Private or public data buckets |
| Custom domain | HTTPS + Content Delivery Network |
| Redis | In-memory data structure store |
| Elasticsearch | Full-text search engine |
| Service accounts | For continuous deployment and auditing |
| Identity provider |Use cloud.gov authentication in apps |


---

## Orgs, Spaces, Apps & Users[^3]

![inline](images/org-space-app-user.png)


[^3]: Needs redrawing. From: https://www.slideshare.net/jencompgeek/whats-newincloudfoundry

---

[.autoscale: false]
## Implement: Logs & Diagnostics

* logs: Kibana, custom logdrains
* **`cf ssh`** ssh into ephemeral containers

![inline](images/kibana.png)

---

# Three Stages

* **Procure**
* **Implement**
* Authorize

---
![](images/stackOfPaper-pixabayCC0.jpg)
# Authorize

* **Authority to Operate (ATO)**
* **Risk Management Framework (Low, Moderate, High)**
* **NIST 800-53**

^ Note: Fed systems must have ATO from agency CIO, generally follows CISO
lead, and they are obliged to follow NIST-800-53 standards, or accept risk of not doing so.
Risk averse: reputation, bad press, IG report, congress or potentially fired.

^ Clarify 325 for MODERATE, simplified, 

^ Systems need to be classified: Violaion of CIA: Low, Moderate, Hi. Depending on classification, then appropriate controls in place. 4004 pages

---

[.build-lists: true]

# Authorize: Controls

* DataCenter: All 325 - You're responsible for:
  * Height of fence
  * Retina Scans
* IaaS: FedRAMP - You _inherit_ ~88 controls, but still 237:
  * System logs
  * Kernel patches 
* cloud.gov:
  * See next slide....

---

[.footer:]
![](images/cg-faster-atos.png)

---

# Authorize: ATO & Security

* 15 unshared controls, 41 shared
* Simplicity and secure defaults
* Reduce shadow IT (thanks, self-service!)
* Example: stack-clash

---

Let's revisit the mission...

---

![right](images/18f-team-photo.jpg)

# Suppose:


* A mission
  * Housing for hurricane victims
* A team
  * Project / Product Managers
  * Designers / Developers
  * Ops / Security Folks
* A platform
  * **Build**
  * **Test**
  * **Run**

---

# Platform

* Stack: WebServer, AppServer, Database, Cache, Index
* Environments: (Local), Dev, Test, Stage, Prod
* User management: Admin, Devs, Auditors
* Operations: Patch, Logs, CDN, Scaling, Availability

---

# Three Stages

* **Procure**
* **Implement**
* **Authorize**

^Why wouldn't you use ;cloud.gov ?

---

# 3 / Getting to :thumbsup:

---

# Turning :thumbsdown: to :thumbsup:

# Concerns

* Sunk costs
* Requirement uncertainty
* Compliance uncertainty

# Obstacles

* "We have a PaaS"
* 🍎 & 🍊 comparisions

^You may have these reservations, or you may be dealing with folks who do. Many of these reservations, hesitancies, doubts come from some combination of misunderstanding, inaccurate prior knowledge, cognitive fallacies and so. Let's look at how to address some of them

---


* **Concerns**
  * Sunk costs
  * Requirement uncertainty
  * Compliance uncertainty

* **Answers**
  * Start small
  * Start new
  * Learn

---

# Obstacles

* "We have a PaaS"
* 🍎 & 🍊 comparisons

---

# We have a PaaS

## Is it :cloud:?

infinite scale * easy to automate * zero provision time * no up-front fees * testing new tools cheap & encouraged * reduce specialization[^4]

[^4]: Diego Lapiduz, https://www.slideshare.net/dlapiduz/cloud-native-devops-with-cloudgov-workshop


---

# 🍎 & 🍊 comparisons 

Esp when going from DC => :cloud:  For example:

|    | Test | Stage | Prod |
| --- | --- | ------ | ---- | 
| **Varnish** | ~ | 2x2cpu, 16 Gb | 2x2cpu, 16 Gb |
| **Web** | 1x4cpu, 4Gb | 2x4cpu, 4 Gb | 2x4cpu, 4 Gb |
| **App** | 1x8cpu, 64Gb | 2x8cpu, 64 Gb | 2x8cpu, 64Gb |
| **DB** | 1x4cpu, 14Gb | 1x4cpu, 14Gb | 2x8cpu, 14Gb |


^ This is just a rack. Provision once, run forever. Leverage none of the benefits from cloud.  What about cloud services? What A/Zs? What about coding for re-implementation? Nothing in term of CI/CD, continuous release. Utterly under-utilized. etc.
^ Also - Super $$$$

---

# 🍎 & 🍊 comparisions

The power of :cloud: is not in creating a resource, but in destroying it.

---

# Answer: Focus on Mission / Get help explaining technical benefits

* "We have a PaaS"
* 🍎 & 🍊 comparisions

^And some measure of re-education

---

![](images/current-customers.png)
# 4 / Case Studies


---

# FEC
![](images/fec.png)


---

# FEC

* https://cloud.gov/overview/customer-stories/fec/
* $1.4M -> $0.2M 
* Better user experience
* SAFe adoption


---

![](images/fec.png)

---

![](https://federalist-docs.18f.gov/uploads/partner-sites/arch-idmanagement-gov.png)
# Federalist

---


![fit](https://user-images.githubusercontent.com/10016577/28799555-144cd8dc-7617-11e7-9f3e-7eeb4dee2798.png)

---

![](https://federalist-docs.18f.gov/uploads/partner-sites/arch-idmanagement-gov.png)


---

# MOAR

EdX class
https://github.com/EngineerBetter/training-zero-to-hero
https://github.com/CloudCredo/training-cf-zero-to-hero

https://github.com/cloudfoundry/summit-training-classes -- which is home to:

https://cloud-native-workshop.cfapps.io/agenda/
https://basics-workshop.cfapps.io/agenda


---

# Parking Lot

| <br> |  <br> | 
| :------- | ----: |
| Pricing | How to find qualified contractors |
| How :cloud:.gov supports industry | How is cloud.gov built/run? |
| How to talk to InfoSec about :cloud:.gov | 

---

# Pricing


---

# How cloud.gov supports industry

| Good for modern contracting teams and small business | Supports modular contracting and procurement reform | Help vendors produce COTS products that run on a standard platform |
|---|---|---|
| Vendors are excited because cloud.gov offers easy access to modern infrastructure. Enables small teams to deliver great work. | Agencies can set up smaller contracts because the vendor team does not need to maintain infrastructure. | Because cloud.gov uses the open source Cloud Foundry platform, more industry products can easily be run on cloud.gov by agencies. |

---


# How cloud.gov is built

* SAFe
* Terraform (https://github.com/18f/cg-provision)
* BOSH/CloudFoundry
* Concourse

<!-- http://deckset-assets.s3.amazonaws.com/emoji-reference.md -->

---

# Questions?

- Peter Burkholder
- pburkholder@pobox.com / peter.burkholder@gsa.com
- @pburkholder (twitter, github, linked, 21.co)
