# Branding assets (CAN-45)

Drop **UX-approved** files here after [CAN-45](/CAN/issues/CAN-45) sign-off.

Expected filenames (used by the PDF template):

| File | Role |
|------|------|
| `logo.pdf` **or** `logo.png` | Header logo on body pages |
| (optional) `cover.pdf` | Future: full-bleed cover if needed |

Do **not** invent final margins, logo size, or chart palette in the LaTeX template without UX agreement — the template uses conservative defaults and `\IfFileExists` so builds succeed before assets exist.
