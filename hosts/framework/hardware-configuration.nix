{ config, lib, pkgs, modulesPath, ... }:
{

  imports =
  [ (modulesPath + "/installer/scan/not-detected.nix")
  ];

  fileSystems = {
    "/" ={ 
      device = "/dev/disk/by-uuid/b183e5d3-8679-4e45-88e6-bc1393323dfd";
      fsType = "btrfs";
    };
    "/boot" ={ 
      device = "/dev/disk/by-uuid/9829-2BBA";
      fsType = "vfat";
    };
  };

  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "usbhid" "sd_mod" ];
      kernelModules = [ "dm-snapshot" ];
      luks.devices."luks" = { 
        device = "/dev/disk/by-uuid/6c40ab71-86cd-40ff-82f6-0936ad7eb61d";
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

  swapDevices =
    [ { device = "/dev/disk/by-uuid/9a231275-fc03-40c1-8c7b-a14f1592f185"; }
    ];

  networking.useDHCP = lib.mkDefault true;

  networking.firewall = {
    enable = true;
  #  # 1714 to 1764 are used by kdeconnect
  #  # 21027 and 22000 are used by syncthing
  #  allowedTCPPorts = [ 22000 ];
  #  allowedUDPPorts = [ 22000 21027 ];
  #  allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
  #  allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware = {
    opengl.enable = true;
    pulseaudio.enable = false;
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
