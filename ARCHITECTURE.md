Act as a Staff Flutter Engineer and Mobile Architect.

Design a production-ready, scalable Flutter architecture using a feature-first structure for Flutter 3.x+.

This architecture must support a serious product with long lifecycle, multiple developers, CI/CD, and rapid feature growth.

Do NOT generate a beginner architecture.

Before generating the architecture:

Think step-by-step

Evaluate tradeoffs

Prefer proven industry patterns

Avoid hype-driven decisions

Optimize for team productivity and long-term maintainability

Explain WHY decisions are made.

Architecture Goals

Design for:

scalability

readability

low coupling

high cohesion

testability

fast onboarding of new developers

safe refactoring

Avoid monolithic structures.

Structural Style

Use:

👉 Feature-first + Clean Architecture hybrid
👉 Vertical slicing
👉 Modular thinking

NOT layer-first.

Required Root Structure

Explain and generate:

lib/
 ├── app/
 ├── core/
 ├── common/
 └── features/


Provide a full folder tree.

app/

Application composition layer.

Include:

App bootstrap

Dependency initialization

Router setup

Global providers

Theme injection

Explain why this layer should stay thin.

core/

Global technical foundation.

Rules:

Must NEVER depend on features.

Must be stable.

Include:

networking (Dio)

interceptors

error mapping

result types

environment configs

feature flags

analytics hooks

logging

extensions

base classes

DI container

Explain how to prevent “core becoming a garbage dump”.

common/

Shared UI and cross-feature elements.

Include:

design system

token-based styling

reusable widgets

form system

dialogs

loaders

spacing

typography

Explain how to avoid over-sharing.

Golden rule:

If only 1–2 features use it → keep it inside the feature.

features/

Each feature must be fully isolated.

Generate a professional feature template:

features/
   auth/
      data/
      domain/
      presentation/


Explain responsibilities of each layer.

domain

entities

repository contracts

use cases

STRICT RULE:

No Flutter imports.

Explain why.

data

DTOs

mappers

remote/local sources

repository implementations

Explain mapping boundaries.

presentation

pages

widgets

controllers/viewmodels

state

Keep UI thin.

State Management (CRITICAL DECISION)

Pick ONE primary solution and justify deeply:

👉 Riverpod (preferred)
OR
👉 Bloc

Your explanation MUST include:

scaling behavior

rebuild control

dev experience

testability

team safety

async handling

Explain where providers/blocs should live.

Avoid recommending Provider.

Dependency Injection

Choose between:

Riverpod as DI

get_it + injectable

Explain tradeoffs like a senior engineer.

Routing

Use GoRouter.

Design:

feature-based route registration

typed routes

guards

deep linking ready

Avoid Navigator 1.0.

Design System Strategy

Explain token architecture:

colors

typography

radius

spacing

elevation

Prevent design drift.

Scaling Strategy (VERY IMPORTANT)

Explain how this architecture supports:

50+ features

multiple teams

package extraction later

micro-app direction

code ownership

Discuss modular future.

Performance Rules

Provide hard guidelines:

const everywhere possible

split widgets

avoid rebuild storms

prefer selectors

isolate expensive trees

Think like a performance engineer.

Testing Strategy

Design test boundaries:

unit

widget

integration

repository

use cases

Make the architecture test-friendly by default.

Anti-Patterns to Prevent

List dangerous mistakes such as:

business logic inside widgets

feature leakage

god repositories

global mutable state

over-engineering

Explain WHY they hurt scaling.

Deliverables

Generate:

✅ Full folder tree
✅ Architecture diagram (text)
✅ Dependency flow
✅ Example feature
✅ Example use case flow
✅ State placement
✅ DI graph

Act like you are designing architecture for a startup expected to scale.

Challenge your own decisions.
Mention what you deliberately chose NOT to use and why.
Prefer boring, proven architecture over trendy patterns.