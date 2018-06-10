# Examples on GrovePi

These projects are copied from [adkron/grovepi](https://github.com/adkron/grovepi).  
This memo is a summary of each project.

## [alarm](./alarm)

- Description
  - Buzz 1000ms when button is pushed
- Setup on GrovePi
  - ButtonGrove to PortA0
  - BuzzerGrove to PortD2
- Build
```
$ cd alarm/
$ mix deps.get
$ MIX_ENV=prod mix compile
```
- Run
```
$ MIX_ENV=prod iex -S mix
```

## [led_fade](./led_fade)

- Description
  - Blight LED according to the analog value of RotaryAngle
- Setup on GrovePi
  - RotaryAngleGrove to PortA2
  - LEDGrove to PortD3
- Build
```
$ cd led_fade/
$ mix deps.get
$ MIX_ENV=prod mix compile
```
- Run
```
$ MIX_ENV=prod iex -S mix
```

## [demo_rgblcd](./demo_rgblcd)

- Description
  - Several demonstration of controlling LCD with RBG Backlight
- Setup on GrovePi
  - LCDGrove to I2C (I2C-1 is recommended)
- Build
```
$ cd demo_rgblcd/
$ mix deps.get
$ MIX_ENV=prod mix compile
```
- Run
```
$ MIX_ENV=prod iex -S mix
```
  - iex(1)> DemoRGBLCD.autoscroll()
    - Print and autoscroll 0-9 numbers both ways
  - iex(2)> DemoRGBLCD.blink()
    - Say "Hello World!" and toggles cursor blinking on and off every 3000ms
  - iex(3)> DemoRGBLCD.cursor()
    - Say "Hello World!" and toggles the cursor on and off every 1500ms
  - iex(4)> DemoRGBLCD.colors()
    - Blink backlight to the RBG color
  - iex(5)> DemoRGBLCD.display()
    - Toggles the display on and off every 1500ms
  - iex(6)> DemoRGBLCD.text_direction()
    - Demonstrates text direction both ways
  - iex(7)> DemoRGBLCD.set_cursor()
    - Demonstrates moving the cursor to the second line



