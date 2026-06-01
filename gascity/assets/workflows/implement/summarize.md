
Write the aggregate implementation summary, including selected anchors, drain
policy, item result classes, report paths, commit refs when available, and any
operator recovery instructions. Direct implement does not run gap-analysis or
review loops. Publish settings are push {{push}} and open_pr {{open_pr}}.

Write to summary_path {{summary_path}} when provided; otherwise use the default
implementation summary path for the workflow run. Update workflow root metadata
with `gc.implementation.summary_path=<absolute path>` so the optional publish
step has an explicit report path to consume.
