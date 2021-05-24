# Labels

This is an attempt to maintain consistent issue labels across Apian repositories, since the Apian Org contains github projects that span multiple repos.

The idea is that there is a "standard" set of lissue labels defined in `apian-issue-labels.json` which can be edited and then uploaded to any/all of teh Apian repositories.

To that end there are some shell scripts:

- `update-all-apian-labels` to call the above script for every Apian repo. This is the only one you really need to call. It updates all of the repos with the current `apian-issue-labels.json`

- `fetch-apian-issue-labels` will fetch the JSON for a particular repo's labels and write it to the console.
- `upload-apian-issue-labels` uploads the label definitions from a specified local JSON file to a specified repo.

- `copy-apian-issue-labels` to copy the labels from `Start-Here` to another Apian-Framework repo. This isn't used anymore but it's being kept around for reference

Usage:

`./update-all-apian-labels <access-token>`

Notes:

- The upload process will overwrite existing label withthe same name, but will leave other pre-existing labels in the destination repo alone

- ideas and most of the code from: https://douglascayers.com/2019/08/01/how-to-export-and-import-github-issue-labels-between-projects


