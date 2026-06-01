
Read workflow root metadata, including `gc.github.post_mode`,
`gc.github.triage_priority`, and `gc.github.triage_verdict`.

If `post_mode=human_gate`, priority is `p0`, or verdict is
`security_sensitive`, send the rendered triage report and proposed comment to
the human gate and record exactly one workflow-root metadata value:
`gc.github.public_comment_gate=approved`, `rejected`, or
`revision_requested`. Use `approved` only after explicit human approval,
`revision_requested` when the public comment must be revised before posting,
and `rejected` when the public comment must not be posted. If none of those
conditions applies, close this step as a no-op gate with metadata
`gc.github.public_comment_gate=not_required`.

This gate intentionally evaluates runtime triage metadata in the step body
rather than a static formula condition.
