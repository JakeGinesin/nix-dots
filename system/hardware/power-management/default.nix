{pkgs, ...}: {
  services.thermald.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      # Performance Policy
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "performance";
      # CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      # Intel-pstate gives sluggish performance
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      # CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "performance";

      # CPU Performance Caps
      # CPU_MIN_PERF_ON_AC = 0;
      # CPU_MIN_PERF_ON_BAT = 0;

      CPU_MAX_PERF_ON_AC = 100;
      CPU_MAX_PERF_ON_BAT = 90;

      # Platform Profile
      PLATFORM_PROFILE_ON_AC = "performance";
      # PLATFORM_PROFILE_ON_BAT = "low-power";
      PLATFORM_PROFILE_ON_BAT = "performance";

      # Boost
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 1;

      CPU_HWP_DYN_BOOST_ON_AC = 1;
      CPU_HWP_DYN_BOOST_ON_BAT = 1;

      # Runtime Power Management
      RUNTIME_PM_ON_AC = "auto";
      RUNTIME_PM_ON_BAT = "auto";

      # PCIE ASPM, talking with PCIE devices to save power
      PCIE_ASPM_ON_AC = "default";
      PCIE_ASPM_ON_BAT = "default";

      # Suspend USB devices to save power
      USB_AUTOSUSPEND = 1;

      # ~~Don't~~ disable bluetooth devices
      USB_EXCLUDE_BTUSB = 0;

      # Wifi Power Save
      WIFI_PWR_ON_AC = "off";
      WIFI_PWR_ON_BAT = "off";

      # Hybrid Graphics Management
      RUNTIME_PM_DRIVER_DENYLIST = "mei_me";

      # MEM_SLEEP_ON_AC = "s2idle";
      MEM_SLEEP_ON_BAT = "deep";
    };
  };
}
