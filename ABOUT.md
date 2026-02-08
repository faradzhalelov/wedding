Generate a production-quality Flutter Web application for a responsive wedding invitation website.

Wedding: Riza & Farkhat
Location: Astana
Date: June
Venue: cozy guest house

Core Requirements

Flutter 3+

Null safety

Clean architecture

Modular folder structure

Responsive for mobile, tablet, desktop

No deprecated widgets

Fast loading

SEO-friendly for web

Design Style

Premium minimalist design

Color palette: white, black, soft neutral tones

Luxury editorial aesthetic (similar to Apple / modern event websites)

Lots of spacing

Smooth animations (not excessive)

Avoid template-looking UI

Use:

Google Fonts (elegant serif for titles + modern sans-serif for body)

Subtle shadows

Soft section transitions

App Structure

Create reusable widgets:

✅ Navbar (sticky on desktop, compact on mobile)
✅ HeroSection
✅ GallerySection
✅ EventDetailsSection
✅ DressCodeSection
✅ RSVPSection
✅ MoodSection
✅ Footer

Use a single scroll landing page with smooth scrolling navigation.

Hero Section

Fullscreen.

Show:

Riza & Farkhat
Wedding Invitation
Astana — June


Optional subtle background animation or gradient.

Add a CTA button:
"Confirm Attendance" → scrolls to RSVP.

Gallery Section

Display childhood and memory photos.

Requirements:

Grid on desktop

Swipe carousel on mobile

Lazy loading images

Rounded corners

Use placeholder assets.

Event Details

Show as elegant cards:

Date

City

Guest House venue

Timeline of the day

Include a map placeholder container.

Dress Code

Title: Free Classic / Smart Casual

Show monochrome outfit examples using cards.

RSVP Section (IMPORTANT)

Create a premium-looking form:

Fields:

Name

Will you attend? (Yes / No toggle)

Bringing a guest?

Number of guests

Dietary restrictions (optional)

Use:

Form validation

Modern inputs

Success state UI

Mock submission logic is enough.

Responsiveness

Use LayoutBuilder / MediaQuery.

Breakpoints:

<600 mobile

600–1100 tablet

1100 desktop

Avoid simply stacking everything — redesign layouts per breakpoint.

Animations

Use:

AnimatedContainer

Fade-in on scroll

Hover effects for desktop

Keep performance high.

Code Quality

✔ Well-structured
✔ Split into files
✔ Reusable widgets
✔ Const constructors where possible
✔ Avoid massive build methods

Provide the full folder structure.

Extras (if possible)

Dark/light subtle theme

Scroll-to-section navigation

Hero animation

Elegant loading indicator

Do NOT generate a basic template.
The app must look like a high-end modern wedding website.