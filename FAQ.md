# FAQ #

**Q:** I can't get any of the examples to work. i try to run them but nothing happens. I am on windows 64 bit

**A:** au3Irr2 is using 32 bit .dll's. That means you have to run 32bit AutoIt when using them. If your running a 64-bit OS: Right-click your script and run it as x86. Compile it as x86. Add `#AutoIt3Wrapper_UseX64=n` to your script.