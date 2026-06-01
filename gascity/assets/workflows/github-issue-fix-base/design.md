Read the workflow root metadata and confirm that
`gc.github.implementation_plan_path` points to an existing file. Then stamp the
legacy compatibility key `gc.github.design_path` with that same absolute path
and close with `gc.outcome=pass`.

This step exists only as a compatibility alias for older layered
`github-issue-fix` overrides that still depend on the former `design` step id.
Do not create `design.md` or reinterpret the artifact contract. The
implementation plan remains the authoritative planning artifact and downstream
steps must continue to use `gc.github.implementation_plan_path` and
`implementation-plan.md`.
