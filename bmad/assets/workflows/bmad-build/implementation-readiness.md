Use the assigned BMAD implementation-readiness skill materialized for this agent.

Review the approved PRD, architecture, epics, and stories for implementation
readiness after `decompose` and before either implementation drain begins.
Treat readiness failures as blockers, use the readiness check as the gate for
implementation, and record the readiness report path and outcome on the
workflow root bead before implementation begins.

Do not invoke provider-native subagents or upstream BMAD runtime commands.
