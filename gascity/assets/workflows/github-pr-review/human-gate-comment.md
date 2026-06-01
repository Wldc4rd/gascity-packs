
Read workflow root metadata, including `gc.github.review_report_path`,
`gc.github.comment_path`, `gc.github.review_outcome`, and `gc.github.post_mode`.
If `post_mode` {{post_mode}} is not `human_gate`, close this step as a no-op
gate with metadata `gc.github.public_comment_gate=not_required`.

If `post_mode` is `human_gate`, send the rendered review report and comment to
the human gate. Record exactly one workflow-root metadata value:
`gc.github.public_comment_gate=approved`, `rejected`, or
`revision_requested`. Use `approved` only after explicit human approval,
`revision_requested` when the comment must be revised before posting, and
`rejected` when the comment must not be posted.
