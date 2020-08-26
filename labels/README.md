# Labels

This is an attempt to maintain consistent issue labels across Apian repositories, since the Apian Org contains github projects that span multiple repos.

It may turn out that this is a dumb idea, and that it simply isn't worth spending any time trying to have consistency. I dunno.

Anyway, the idea here is that the issue labels in the `Start-Here` (this) repo are considered the "base" set that all Apian repos should have. To that end there are 2 shell scripts:

- `copy-apian-issue-labels` to copy the labels from `Start-Here` to another Apian-Framework repo

- `update-all-apian-labels` to call the above script for every Apian repo.


Usage:

`./copy-apian-issue-labels <access-token> <dest-apian-repo>`

`./update-all-apian-labels <access-token>`

Notes:

- The copy process will overwrite existing label withthe same name, but will leave other pre-existing labels in the destination repo alone

- ideas and most of the code from: https://douglascayers.com/2019/08/01/how-to-export-and-import-github-issue-labels-between-projects


