
NB: These slide are inspired/influenced by https://basics-workshop.cfapps.io & https://github.com/cloudfoundry/summit-training-classes

Notes from dry-run:

- Everyone is focussed at the start of a lab. Deliver content then. Don't try to explain concept while students are trying to get things to work
- Then do lab. Pause for each command to complete. Those who don't need your guidance will pull ahead. Those who do need your guidance will want to go at a real-time pace
- Eliminate all editing
- Eliminate all `cd`. All commands should work even if steps are done out of order
- Be explicit about workspace setup.
  - One window terminal/powershell
  - One window live presentation
  - One window workshop.mda

- Add: Clean up after yourself!

- Add Gifs of the passcode login process w/ ScreenCastr

- Add: more resources and acknowledgements.

# Presenter: 

- Keycastr?
- Screenflow?
- Add break slides w/ "will be back...."
- Add :camera: to slide that need a linger by operator


Other notes
---

Also: Fix linebreak before all commands, use different font color for commands

Everyone should go to https://dashboard.fr.cloud.gov before commandline install

Todo: Insert slides/gif showing passcode login....

  DW copies the api url into the browser, so need to clarify there. Perhaps show a GIF of the process.

After cf login, run `cf orgs`


# Workspaces

In addition to installing `vscode` `git` `cf` I updated the path to include `cf:\Program Files\7zip` following https://codingbee.net/tutorials/powershell/powershell-make-a-permanent-change-to-the-path-environment-variable

# Media

All media uploaded to GovCloud `cg-public`.  Materials are also in Google Drive: cloud.gov > Events > 201709 DigitalGov workshop

```
for movie in Workspaces.mp4 cg-otp-login*; do
  aws s3 cp $movie s3://cg-public --acl public-read
done
```

# For some other time:

---

1. Access control -Demo only, skip if short on time.
  * `cf orgs`
  * `cf spaces`
  * Discussion / Demo only
  * Accomplished: 
    * Inbound access control w/ oauth - 
    * Egress to external providers by fixed IP

---

# YAGNI

1. Blue-green releases
  * Autopilot
1. Optional: Worker apps
  * See Aidan's notes for a good write-up
1. Development tips
  * `cf local`

---

# Closing: The 12-factor App

---

# Parking lot

- health checks


<!-- Table formatting is hard 

| Docs   |   |
|:--- | :--- |
| cloud.gov docs: [https://cloud.gov/docs/](https://cloud.gov/docs/)| Cloud Foundry docs: [https://docs.cloudfoundry.org](https://docs.cloudfoundry.org) |

| Books |   |
|:----  | --- | 
| Cloud Foundry: The Definitive Guide: <br>Develop, Deploy, and Scale (2017, O'Reilly) | Cloud Foundry eBooks: <br>[https://content.pivotal.io/ebooks](https://content.pivotal.io/ebooks) |

| Courses |   |
|:---- |---| 
| edX Course: [https://edx.org](https://courses.edx.org/courses/course-v1:LinuxFoundationX+LFS132x+1T2017/course/) | CloudFoundry training materials: <br>[https://basics-workshop.cfapps.io](https://basics-workshop.cfapps.io) | 

| Other |   |
|:---- |---| 
| Inquires: [cloud-gov-inquiries@gsa.gov](mailto:cloud-gov-inquiries@gsa.gov) | Twitter: @18F |

---

| Docs   |   |
|:--- | :--- |
| cloud.gov docs: [https://cloud.gov/docs/](https://cloud.gov/docs/)| Cloud Foundry docs: [https://docs.cloudfoundry.org](https://docs.cloudfoundry.org) |
| **Books** |   |
| Cloud Foundry: The Definitive Guide: <br>Develop, Deploy, and Scale (2017, O'Reilly) | Cloud Foundry eBooks: <br>[https://content.pivotal.io/ebooks](https://content.pivotal.io/ebooks) |
| **Courses** |   |
| edX Course: [https://edx.org](https://courses.edx.org/courses/course-v1:LinuxFoundationX+LFS132x+1T2017/course/) | CloudFoundry training materials: <br>[https://basics-workshop.cfapps.io](https://basics-workshop.cfapps.io) | 
| **Other** |   |
| Inquires: [cloud-gov-inquiries@gsa.gov](mailto:cloud-gov-inquiries@gsa.gov) | Twitter: @18F |

-->

# Why DeckSet?

I've been asked why I used DeckSet for slides.

First, I wanted my slides to render well as slides _and_ to be usable as GitHub pages and handouts. Also, since there's a lot of code that could get screwed up with an errant edit, that I could use Git with the slide to review changes before committing. That eliminated pretty much everything except Reveal.js (and related frameworks) and DeckSet (which I was tuned into a few weeks ago)

Deckset wins:
- live preview
- sensible image placement (left, right, inline, autofit)
- columns (image right, text left, e.g)
- BIG FONTS
- **code block autoscaling**
- code block line highlighting
- autofilter background images
- serverless

Reveal wins:
- formatting doesn't render (e.g. `footer:` `slide-numbers:`)
- custom CSS (e.g. https://github.com/18F/18f-reveal.js-theme)
  - v2 DeckSet will support this.
- CSS fine-tuning (YAGNI)
- free (DeckSet is $30)

# How to 