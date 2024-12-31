{ config, pkgs, ... }: {
  services.libinput = {
    enable = false;
    touchpad.naturalScrolling = true;
  };
  services.xserver.synaptics = {
    enable = true;
    palmMinZ = 20;
    palmDetect = true;
    tapButtons = false;
    # scrollDelta = 111;
    twoFingerScroll = true;
    vertTwoFingerScroll = true;
    horizTwoFingerScroll = false;
    accelFactor = "0.0557414"; # don't question
    fingersMap = [
      1
      3
      2
    ];
    palmMinWidth = 5;
    minSpeed = "0.6";
    maxSpeed = "1.0";
    
    additionalOptions = ''
Option "VertScrollDelta" "-111"
Option "HorizScrollDelta" "-111"
Option "FingerLow" "25"
Option "FingerHigh" "30"
Option "MaxTapTime" "0"
    '';
  };
}
