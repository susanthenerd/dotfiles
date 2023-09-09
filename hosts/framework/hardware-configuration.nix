{ config, lib, pkgs, modulesPath, ... }:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  fileSystems = {
    "/" ={ 
      device = "/dev/disk/by-uuid/d71bf142-e8b1-4dbe-a5ba-ed99a4a3320b";
      fsType = "btrfs";
    };
    "/data" ={ 
      device = "/dev/disk/by-uuid/d4e49e77-74eb-4acb-b52c-144d6bc4fa06";
      fsType = "btrfs";
    };
    "/home" ={ 
      device = "/dev/disk/by-uuid/8b84cc95-9f12-4cd6-9504-81ac42471119";
      fsType = "btrfs";
    };
    "/boot" ={ 
      device = "/dev/disk/by-uuid/D13E-83BD";
      fsType = "vfat";
    };
  };

  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "usbhid" "sd_mod" ];
      kernelModules = [ "dm-snapshot" ];
      luks.devices."luks" = { 
        device = "/dev/disk/by-uuid/2de82026-9bbe-4ef6-bea7-7b163c0345e6";
        preLVM = true;
      };
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  swapDevices = [ { device = "/dev/disk/by-uuid/aa146de9-d8c4-4473-9b5b-a8ba28676184"; } ];

  networking.useDHCP = lib.mkDefault true;

  networking.firewall = {
    enable = true;
    # 1714 to 1764 are used by kdeconnect
    # 21027 and 22000 are used by syncthing
    allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
    allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware = {
    opengl.enable = true; 
    pulseaudio.enable = false;
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
