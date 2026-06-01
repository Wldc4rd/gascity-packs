
Mechanically derive `requirements.md` from the issue body and triage report.
Mark the requirements artifact `status: approved` in both `interactive` and
`autonomous` modes. For `not_reproduced` plus `test_hardening`, state test
hardening explicitly and do not claim a confirmed bug fix. Current mode is
{{mode}}.

After writing the approved artifact, resolve the absolute path to
`requirements.md` and publish it on the workflow root with
`bd update <root-bead-id> --set-metadata gc.github.requirements_path=<absolute path>`.
Downstream implementation-plan, design compatibility, and create-beads steps
must read the artifact through `gc.github.requirements_path`, not by guessing a
run directory.
