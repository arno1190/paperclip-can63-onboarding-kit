# Figures for the PDF kit

Export charts and diagrams here (PNG or PDF) once the visual system from [CAN-45](/CAN/issues/CAN-45) is approved. Reference them from markdown with paths relative to the chapter file, for example:

```markdown
![](../../assets/figures/mix-example.png)
```

`pandoc` resolves images using `--resource-path` (see `build/build.sh`).
