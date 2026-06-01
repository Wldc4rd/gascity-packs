
Use the mayor implementation-plan procedure over the approved generated
requirements. In `interactive` mode, human-gate the implementation plan
artifact. In `autonomous` mode, generate and approve the implementation plan
non-interactively while recording the autonomous decision in the run artifacts.
Current mode is {{mode}}.

After writing the approved artifact, resolve the absolute path to
`implementation-plan.md` and publish it on the workflow root with
`bd update <root-bead-id> --set-metadata gc.github.implementation_plan_path=<absolute path>`.
Downstream design compatibility, design-review, and create-beads steps must
read the artifact through `gc.github.implementation_plan_path`, not by guessing
a run directory.
