---
name: creating-prd
description: Conducts a Socratic interview with a product manager, drafts a structured PRD in the repo template, and saves it for downstream event modeling and planning.
metadata:
  short-description: Create a PRD
---

# Creating a PRD

Use this skill when a product-manager agent needs to turn a rough initiative into a repo-local PRD that can feed event modeling, architecture, and planning.

## Core workflow

1. Gather context through an interview.
2. Draft the PRD from the template.
3. Review the draft with the PM.
4. Save the file in the repo.

## Interview rules

- Ask one question at a time.
- Prefer concrete examples over abstract goals.
- Stop and ask follow-ups when a required section is under-specified.
- Always probe the domain glossary. Define every noun that could become an event, command, aggregate, or slice downstream.

Cover these areas in roughly this order:

1. Problem statement and evidence
2. Primary persona
3. Success metrics
4. Domain glossary
5. Use cases
6. Functional requirements
7. Non-functional requirements
8. Out of scope
9. Constraints and dependencies
10. Open questions and decisions

## Drafting rules

- Use the repo-local template at `templates/prd_template.md`.
- Keep the PRD scoped to one initiative.
- Write testable acceptance criteria where possible.
- Every metric needs a number.
- Every deferred item needs a rationale.
- Every open question needs an owner and due date if available.

## Save location

Default to `docs/prds/<slug>.md` in the current repo.
Confirm the exact path if the repo has a different PRD convention.

## Review gate

Before saving, summarize:

- the problem statement
- measurable success metrics
- glossary terms
- open questions

If the PM changes scope, revise the draft before saving.

