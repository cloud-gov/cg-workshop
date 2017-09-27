
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