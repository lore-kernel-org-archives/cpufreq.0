From: Ross Lagerwall <rosslagerwall@gmail.com>
Subject: NULL pointer dereference
Date: Mon, 20 May 2013 08:03:50 +0100
Message-ID: <20130520070350.GA741@hobo.wolfson.cam.ac.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="bp/iNruPH9dso1Pn"
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:subject:message-id:mime-version:content-type
         :content-disposition:user-agent;
        bh=RKlqYITNPDR1nrx6q7ccNVZXCuwwvJd4kCNjEIaoK14=;
        b=CTnVZiPaU9F/nDrDaVF1wyMqCryrLBc8s3JU4x/EETisSnq5NpRel4/sYyi9XrqjUi
         +kf+C5UlrvvIGC/qeMLEIIEJ679KHKSu6WV7FSum5jv+Se0oDCfNwO4G/nTY9d2xST3T
         3+Ki+6S7U/qep8kdM3hGgeAl5uGvwcuvRJ0Bn3TLgk2e5vji242QJuwXyzF557GnBzgH
         h5PMuX4OkVlYhzZZASYor1KHvVjW+uDA9jIS5KknsIp0IQmfHupw7HzJdGYmuq3IeMB1
         TLVTkXpslpClHLcj6eKPBF6VBhy8F7qCNNNAavhgi6hSwKoib0uf8RVwopBjnJb/vt/t
         NjpQ==
Content-Disposition: inline
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: cpufreq@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

Booting 3.10-rc1, I got a warning, then a stack dump then a NULL pointer
dereference all apparently in cpufreq code:
WARNING: at drivers/cpufreq/cpufreq_governor.c:251
cpufreq_governor_dbs+0x61e/0x680()
...

It seems to have happened during the initialization of udev.
This has only happened once out of several boots.

I have attached the boot log for completeness. I'm not sure if any other
information is needed.

Regards
-- 
Ross Lagerwall

--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="dump.txt"

-- Logs begin at Sun 2013-05-05 20:48:38 BST, end at Mon 2013-05-20 07:25:19 BST. --
May 20 07:22:59 hobo kernel: init_memory_mapping: [mem 0xdaff4000-0xdaffffff]
May 20 07:22:59 hobo kernel:  [mem 0xdaff4000-0xdaffffff] page 4k
May 20 07:22:59 hobo kernel: init_memory_mapping: [mem 0x100000000-0x1ffffffff]
May 20 07:22:59 hobo kernel:  [mem 0x100000000-0x1ffffffff] page 2M
May 20 07:22:59 hobo kernel: RAMDISK: [mem 0x37a40000-0x37d17fff]
May 20 07:22:59 hobo kernel: ACPI: RSDP 00000000000f0490 00024 (v02 ALASKA)
May 20 07:22:59 hobo kernel: ACPI: XSDT 00000000d9414078 0006C (v01 ALASKA    A M I 01072009 AMI  00010013)
May 20 07:22:59 hobo kernel: ACPI: FACP 00000000d941dee0 0010C (v05 ALASKA    A M I 01072009 AMI  00010013)
May 20 07:22:59 hobo kernel: ACPI: DSDT 00000000d9414178 09D63 (v02 ALASKA    A M I 00000021 INTL 20051117)
May 20 07:22:59 hobo kernel: ACPI: FACS 00000000d9421080 00040
May 20 07:22:59 hobo kernel: ACPI: APIC 00000000d941dff0 00072 (v03 ALASKA    A M I 01072009 AMI  00010013)
May 20 07:22:59 hobo kernel: ACPI: FPDT 00000000d941e068 00044 (v01 ALASKA    A M I 01072009 AMI  00010013)
May 20 07:22:59 hobo kernel: ACPI: MCFG 00000000d941e0b0 0003C (v01 ALASKA    A M I 01072009 MSFT 00000097)
May 20 07:22:59 hobo kernel: ACPI: HPET 00000000d941e0f0 00038 (v01 ALASKA    A M I 01072009 AMI. 00000005)
May 20 07:22:59 hobo kernel: ACPI: SSDT 00000000d941e128 0036D (v01 SataRe SataTabl 00001000 INTL 20091112)
May 20 07:22:59 hobo kernel: ACPI: SSDT 00000000d941e498 009AA (v01  PmRef  Cpu0Ist 00003000 INTL 20051117)
May 20 07:22:59 hobo kernel: ACPI: SSDT 00000000d941ee48 00A92 (v01  PmRef    CpuPm 00003000 INTL 20051117)
May 20 07:22:59 hobo kernel: ACPI: ASF! 00000000d941f8e0 000A5 (v32 INTEL       HCG 00000001 TFSM 000F4240)
May 20 07:22:59 hobo kernel: ACPI: Local APIC address 0xfee00000
May 20 07:22:59 hobo kernel: No NUMA configuration found
May 20 07:22:59 hobo kernel: Faking a node at [mem 0x0000000000000000-0x000000021e5fffff]
May 20 07:22:59 hobo kernel: Initmem setup node 0 [mem 0x00000000-0x21e5fffff]
May 20 07:22:59 hobo kernel:   NODE_DATA [mem 0x21e5ef000-0x21e5f3fff]
May 20 07:22:59 hobo kernel:  [ffffea0000000000-ffffea00087fffff] PMD -> [ffff880215c00000-ffff88021dbfffff] on node 0
May 20 07:22:59 hobo kernel: Zone ranges:
May 20 07:22:59 hobo kernel:   DMA      [mem 0x00001000-0x00ffffff]
May 20 07:22:59 hobo kernel:   DMA32    [mem 0x01000000-0xffffffff]
May 20 07:22:59 hobo kernel:   Normal   [mem 0x100000000-0x21e5fffff]
May 20 07:22:59 hobo kernel: Movable zone start for each node
May 20 07:22:59 hobo kernel: Early memory node ranges
May 20 07:22:59 hobo kernel:   node   0: [mem 0x00001000-0x0009cfff]
May 20 07:22:59 hobo kernel:   node   0: [mem 0x00100000-0x1fffffff]
May 20 07:22:59 hobo kernel:   node   0: [mem 0x20200000-0x40003fff]
May 20 07:22:59 hobo kernel:   node   0: [mem 0x40005000-0xd8e8afff]
May 20 07:22:59 hobo kernel:   node   0: [mem 0xda5dc000-0xda5dcfff]
May 20 07:22:59 hobo kernel:   node   0: [mem 0xda620000-0xdaa32fff]
May 20 07:22:59 hobo kernel:   node   0: [mem 0xdaff4000-0xdaffffff]
May 20 07:22:59 hobo kernel:   node   0: [mem 0x100000000-0x21e5fffff]
May 20 07:22:59 hobo kernel: On node 0 totalpages: 2061894
May 20 07:22:59 hobo kernel:   DMA zone: 64 pages used for memmap
May 20 07:22:59 hobo kernel:   DMA zone: 21 pages reserved
May 20 07:22:59 hobo kernel:   DMA zone: 3996 pages, LIFO batch:0
May 20 07:22:59 hobo kernel:   DMA32 zone: 13827 pages used for memmap
May 20 07:22:59 hobo kernel:   DMA32 zone: 884906 pages, LIFO batch:31
May 20 07:22:59 hobo kernel:   Normal zone: 18328 pages used for memmap
May 20 07:22:59 hobo kernel:   Normal zone: 1172992 pages, LIFO batch:31
May 20 07:22:59 hobo kernel: ACPI: PM-Timer IO Port: 0x408
May 20 07:22:59 hobo kernel: ACPI: Local APIC address 0xfee00000
May 20 07:22:59 hobo kernel: ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
May 20 07:22:59 hobo kernel: ACPI: LAPIC (acpi_id[0x02] lapic_id[0x02] enabled)
May 20 07:22:59 hobo kernel: ACPI: LAPIC (acpi_id[0x03] lapic_id[0x04] enabled)
May 20 07:22:59 hobo kernel: ACPI: LAPIC (acpi_id[0x04] lapic_id[0x06] enabled)
May 20 07:22:59 hobo kernel: ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
May 20 07:22:59 hobo kernel: ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[0])
May 20 07:22:59 hobo kernel: IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-23
May 20 07:22:59 hobo kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
May 20 07:22:59 hobo kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
May 20 07:22:59 hobo kernel: ACPI: IRQ0 used by override.
May 20 07:22:59 hobo kernel: ACPI: IRQ2 used by override.
May 20 07:22:59 hobo kernel: ACPI: IRQ9 used by override.
May 20 07:22:59 hobo kernel: Using ACPI (MADT) for SMP configuration information
May 20 07:22:59 hobo kernel: ACPI: HPET id: 0x8086a701 base: 0xfed00000
May 20 07:22:59 hobo kernel: smpboot: Allowing 4 CPUs, 0 hotplug CPUs
May 20 07:22:59 hobo kernel: nr_irqs_gsi: 40
May 20 07:22:59 hobo kernel: PM: Registered nosave memory: 000000000009d000 - 000000000009e000
May 20 07:22:59 hobo kernel: PM: Registered nosave memory: 000000000009e000 - 00000000000a0000
May 20 07:22:59 hobo kernel: PM: Registered nosave memory: 00000000000a0000 - 00000000000e0000
May 20 07:22:59 hobo kernel: PM: Registered nosave memory: 00000000000e0000 - 0000000000100000
May 20 07:22:59 hobo kernel: PM: Registered nosave memory: 0000000020000000 - 0000000020200000
May 20 07:22:59 hobo kernel: PM: Registered nosave memory: 0000000040004000 - 0000000040005000
May 20 07:22:59 hobo kernel: PM: Registered nosave memory: 00000000d8e8b000 - 00000000d930b000
May 20 07:22:59 hobo kernel: PM: Registered nosave memory: 00000000d930b000 - 00000000d9423000
May 20 07:22:59 hobo kernel: PM: Registered nosave memory: 00000000d9423000 - 00000000da5dc000
May 20 07:22:59 hobo kernel: PM: Registered nosave memory: 00000000da5dd000 - 00000000da620000
May 20 07:22:59 hobo kernel: PM: Registered nosave memory: 00000000daa33000 - 00000000daff4000
May 20 07:22:59 hobo kernel: PM: Registered nosave memory: 00000000db000000 - 00000000db800000
May 20 07:22:59 hobo kernel: PM: Registered nosave memory: 00000000db800000 - 00000000dfa00000
May 20 07:22:59 hobo kernel: PM: Registered nosave memory: 00000000dfa00000 - 00000000f8000000
May 20 07:22:59 hobo kernel: PM: Registered nosave memory: 00000000f8000000 - 00000000fc000000
May 20 07:22:59 hobo kernel: PM: Registered nosave memory: 00000000fc000000 - 00000000fec00000
May 20 07:22:59 hobo kernel: PM: Registered nosave memory: 00000000fec00000 - 00000000fec01000
May 20 07:22:59 hobo kernel: PM: Registered nosave memory: 00000000fec01000 - 00000000fed00000
May 20 07:22:59 hobo kernel: PM: Registered nosave memory: 00000000fed00000 - 00000000fed04000
May 20 07:22:59 hobo kernel: PM: Registered nosave memory: 00000000fed04000 - 00000000fed1c000
May 20 07:22:59 hobo kernel: PM: Registered nosave memory: 00000000fed1c000 - 00000000fed20000
May 20 07:22:59 hobo kernel: PM: Registered nosave memory: 00000000fed20000 - 00000000fee00000
May 20 07:22:59 hobo kernel: PM: Registered nosave memory: 00000000fee00000 - 00000000fee01000
May 20 07:22:59 hobo kernel: PM: Registered nosave memory: 00000000fee01000 - 00000000ff000000
May 20 07:22:59 hobo kernel: PM: Registered nosave memory: 00000000ff000000 - 0000000100000000
May 20 07:22:59 hobo kernel: e820: [mem 0xdfa00000-0xf7ffffff] available for PCI devices
May 20 07:22:59 hobo kernel: setup_percpu: NR_CPUS:64 nr_cpumask_bits:64 nr_cpu_ids:4 nr_node_ids:1
May 20 07:22:59 hobo kernel: PERCPU: Embedded 27 pages/cpu @ffff88021e200000 s81664 r8192 d20736 u524288
May 20 07:22:59 hobo kernel: pcpu-alloc: s81664 r8192 d20736 u524288 alloc=1*2097152
May 20 07:22:59 hobo kernel: pcpu-alloc: [0] 0 1 2 3 
May 20 07:22:59 hobo kernel: Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 2029654
May 20 07:22:59 hobo kernel: Policy zone: Normal
May 20 07:22:59 hobo kernel: Kernel command line: BOOT_IMAGE=/boot/vmlinuz-linux root=UUID=a841157f-ef03-40da-8e97-1ede0ad49925 ro verbose debug
May 20 07:22:59 hobo kernel: PID hash table entries: 4096 (order: 3, 32768 bytes)
May 20 07:22:59 hobo kernel: xsave: enabled xstate_bv 0x7, cntxt size 0x340
May 20 07:22:59 hobo kernel: Checking aperture...
May 20 07:22:59 hobo kernel: No AGP bridge found
May 20 07:22:59 hobo kernel: Calgary: detecting Calgary via BIOS EBDA area
May 20 07:22:59 hobo kernel: Calgary: Unable to locate Rio Grande table in EBDA - bailing!
May 20 07:22:59 hobo kernel: Memory: 8035288k/8886272k available (4842k kernel code, 638696k absent, 212288k reserved, 4099k data, 1036k init)
May 20 07:22:59 hobo kernel: SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
May 20 07:22:59 hobo kernel: Preemptible hierarchical RCU implementation.
May 20 07:22:59 hobo kernel: 	RCU dyntick-idle grace-period acceleration is enabled.
May 20 07:22:59 hobo kernel: 	Dump stacks of tasks blocking RCU-preempt GP.
May 20 07:22:59 hobo kernel: 	RCU restricting CPUs from NR_CPUS=64 to nr_cpu_ids=4.
May 20 07:22:59 hobo kernel: NR_IRQS:4352 nr_irqs:712 16
May 20 07:22:59 hobo kernel: Console: colour dummy device 80x25
May 20 07:22:59 hobo kernel: console [tty0] enabled
May 20 07:22:59 hobo kernel: allocated 33554432 bytes of page_cgroup
May 20 07:22:59 hobo kernel: please try 'cgroup_disable=memory' option if you don't want memory cgroups
May 20 07:22:59 hobo kernel: hpet clockevent registered
May 20 07:22:59 hobo kernel: tsc: Fast TSC calibration using PIT
May 20 07:22:59 hobo kernel: tsc: Detected 3392.175 MHz processor
May 20 07:22:59 hobo kernel: Calibrating delay loop (skipped), value calculated using timer frequency.. 6787.03 BogoMIPS (lpj=11307250)
May 20 07:22:59 hobo kernel: pid_max: default: 32768 minimum: 301
May 20 07:22:59 hobo kernel: Security Framework initialized
May 20 07:22:59 hobo kernel: AppArmor: AppArmor disabled by boot time parameter
May 20 07:22:59 hobo kernel: Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes)
May 20 07:22:59 hobo kernel: Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes)
May 20 07:22:59 hobo kernel: Mount-cache hash table entries: 256
May 20 07:22:59 hobo kernel: Initializing cgroup subsys memory
May 20 07:22:59 hobo kernel: Initializing cgroup subsys devices
May 20 07:22:59 hobo kernel: Initializing cgroup subsys freezer
May 20 07:22:59 hobo kernel: Initializing cgroup subsys net_cls
May 20 07:22:59 hobo kernel: Initializing cgroup subsys blkio
May 20 07:22:59 hobo kernel: CPU: Physical Processor ID: 0
May 20 07:22:59 hobo kernel: CPU: Processor Core ID: 0
May 20 07:22:59 hobo kernel: ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
ENERGY_PERF_BIAS: View and update with x86_energy_perf_policy(8)
May 20 07:22:59 hobo kernel: mce: CPU supports 9 MCE banks
May 20 07:22:59 hobo kernel: CPU0: Thermal monitoring enabled (TM1)
May 20 07:22:59 hobo kernel: Last level iTLB entries: 4KB 512, 2MB 0, 4MB 0
Last level dTLB entries: 4KB 512, 2MB 32, 4MB 32
tlb_flushall_shift: 1
May 20 07:22:59 hobo kernel: Freeing SMP alternatives: 20k freed
May 20 07:22:59 hobo kernel: ACPI: Core revision 20130328
May 20 07:22:59 hobo kernel: ACPI: All ACPI Tables successfully acquired
May 20 07:22:59 hobo kernel: ftrace: allocating 19274 entries in 76 pages
May 20 07:22:59 hobo kernel: ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
May 20 07:22:59 hobo kernel: smpboot: CPU0: Intel(R) Core(TM) i5-3570K CPU @ 3.40GHz (fam: 06, model: 3a, stepping: 09)
May 20 07:22:59 hobo kernel: TSC deadline timer enabled
May 20 07:22:59 hobo kernel: Performance Events: PEBS fmt1+, 16-deep LBR, IvyBridge events, Intel PMU driver.
May 20 07:22:59 hobo kernel: ... version:                3
May 20 07:22:59 hobo kernel: ... bit width:              48
May 20 07:22:59 hobo kernel: ... generic registers:      8
May 20 07:22:59 hobo kernel: ... value mask:             0000ffffffffffff
May 20 07:22:59 hobo kernel: ... max period:             000000007fffffff
May 20 07:22:59 hobo kernel: ... fixed-purpose events:   3
May 20 07:22:59 hobo kernel: ... event mask:             00000007000000ff
May 20 07:22:59 hobo kernel: NMI watchdog: enabled on all CPUs, permanently consumes one hw-PMU counter.
May 20 07:22:59 hobo kernel: smpboot: Booting Node   0, Processors  #1 #2 #3 OK
May 20 07:22:59 hobo kernel: Brought up 4 CPUs
May 20 07:22:59 hobo kernel: smpboot: Total of 4 processors activated (27148.12 BogoMIPS)
May 20 07:22:59 hobo kernel: devtmpfs: initialized
May 20 07:22:59 hobo kernel: PM: Registering ACPI NVS region [mem 0xd930b000-0xd9422fff] (1146880 bytes)
May 20 07:22:59 hobo kernel: PM: Registering ACPI NVS region [mem 0xda5dd000-0xda61ffff] (274432 bytes)
May 20 07:22:59 hobo kernel: RTC time:  6:22:52, date: 05/20/13
May 20 07:22:59 hobo kernel: NET: Registered protocol family 16
May 20 07:22:59 hobo kernel: ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
May 20 07:22:59 hobo kernel: ACPI: bus type PCI registered
May 20 07:22:59 hobo kernel: PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem 0xf8000000-0xfbffffff] (base 0xf8000000)
May 20 07:22:59 hobo kernel: PCI: MMCONFIG at [mem 0xf8000000-0xfbffffff] reserved in E820
May 20 07:22:59 hobo kernel: PCI: Using configuration type 1 for base access
May 20 07:22:59 hobo kernel: bio: create slab <bio-0> at 0
May 20 07:22:59 hobo kernel: ACPI: Added _OSI(Module Device)
May 20 07:22:59 hobo kernel: ACPI: Added _OSI(Processor Device)
May 20 07:22:59 hobo kernel: ACPI: Added _OSI(3.0 _SCP Extensions)
May 20 07:22:59 hobo kernel: ACPI: Added _OSI(Processor Aggregator Device)
May 20 07:22:59 hobo kernel: ACPI: EC: Look up EC in DSDT
May 20 07:22:59 hobo kernel: ACPI: Executed 1 blocks of module-level executable AML code
May 20 07:22:59 hobo kernel: ACPI: SSDT 00000000d92b8018 0083B (v01  PmRef  Cpu0Cst 00003001 INTL 20051117)
May 20 07:22:59 hobo kernel: ACPI: Dynamic OEM Table Load:
May 20 07:22:59 hobo kernel: ACPI: SSDT           (null) 0083B (v01  PmRef  Cpu0Cst 00003001 INTL 20051117)
May 20 07:22:59 hobo kernel: ACPI: SSDT 00000000d92b9a98 00303 (v01  PmRef    ApIst 00003000 INTL 20051117)
May 20 07:22:59 hobo kernel: ACPI: Dynamic OEM Table Load:
May 20 07:22:59 hobo kernel: ACPI: SSDT           (null) 00303 (v01  PmRef    ApIst 00003000 INTL 20051117)
May 20 07:22:59 hobo kernel: ACPI: SSDT 00000000d92bac18 00119 (v01  PmRef    ApCst 00003000 INTL 20051117)
May 20 07:22:59 hobo kernel: ACPI: Dynamic OEM Table Load:
May 20 07:22:59 hobo kernel: ACPI: SSDT           (null) 00119 (v01  PmRef    ApCst 00003000 INTL 20051117)
May 20 07:22:59 hobo kernel: ACPI: Interpreter enabled
May 20 07:22:59 hobo kernel: ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State [\_S1_] (20130328/hwxface-568)
May 20 07:22:59 hobo kernel: ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State [\_S2_] (20130328/hwxface-568)
May 20 07:22:59 hobo kernel: ACPI: (supports S0 S3 S4 S5)
May 20 07:22:59 hobo kernel: ACPI: Using IOAPIC for interrupt routing
May 20 07:22:59 hobo kernel: PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
May 20 07:22:59 hobo kernel: ACPI: Power Resource [FN00] (off)
May 20 07:22:59 hobo kernel: ACPI: Power Resource [FN01] (off)
May 20 07:22:59 hobo kernel: ACPI: Power Resource [FN02] (off)
May 20 07:22:59 hobo kernel: ACPI: Power Resource [FN03] (off)
May 20 07:22:59 hobo kernel: ACPI: Power Resource [FN04] (off)
May 20 07:22:59 hobo kernel: ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-3e])
May 20 07:22:59 hobo kernel: PCI host bridge to bus 0000:00
May 20 07:22:59 hobo kernel: pci_bus 0000:00: root bus resource [bus 00-3e]
May 20 07:22:59 hobo kernel: pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7]
May 20 07:22:59 hobo kernel: pci_bus 0000:00: root bus resource [io  0x0d00-0xffff]
May 20 07:22:59 hobo kernel: pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff]
May 20 07:22:59 hobo kernel: pci_bus 0000:00: root bus resource [mem 0x000d0000-0x000d3fff]
May 20 07:22:59 hobo kernel: pci_bus 0000:00: root bus resource [mem 0x000d4000-0x000d7fff]
May 20 07:22:59 hobo kernel: pci_bus 0000:00: root bus resource [mem 0x000d8000-0x000dbfff]
May 20 07:22:59 hobo kernel: pci_bus 0000:00: root bus resource [mem 0x000dc000-0x000dffff]
May 20 07:22:59 hobo kernel: pci_bus 0000:00: root bus resource [mem 0x000e0000-0x000e3fff]
May 20 07:22:59 hobo kernel: pci_bus 0000:00: root bus resource [mem 0x000e4000-0x000e7fff]
May 20 07:22:59 hobo kernel: pci_bus 0000:00: root bus resource [mem 0xdfa00000-0xfeafffff]
May 20 07:22:59 hobo kernel: pci 0000:00:00.0: [8086:0150] type 00 class 0x060000
May 20 07:22:59 hobo kernel: pci 0000:00:02.0: [8086:0162] type 00 class 0x030000
May 20 07:22:59 hobo kernel: pci 0000:00:02.0: reg 10: [mem 0xf7800000-0xf7bfffff 64bit]
May 20 07:22:59 hobo kernel: pci 0000:00:02.0: reg 18: [mem 0xe0000000-0xefffffff 64bit pref]
May 20 07:22:59 hobo kernel: pci 0000:00:02.0: reg 20: [io  0xf000-0xf03f]
May 20 07:22:59 hobo kernel: pci 0000:00:14.0: [8086:1e31] type 00 class 0x0c0330
May 20 07:22:59 hobo kernel: pci 0000:00:14.0: reg 10: [mem 0xf7c00000-0xf7c0ffff 64bit]
May 20 07:22:59 hobo kernel: pci 0000:00:14.0: PME# supported from D3hot D3cold
May 20 07:22:59 hobo kernel: pci 0000:00:14.0: System wakeup disabled by ACPI
May 20 07:22:59 hobo kernel: pci 0000:00:16.0: [8086:1e3a] type 00 class 0x078000
May 20 07:22:59 hobo kernel: pci 0000:00:16.0: reg 10: [mem 0xf7c1a000-0xf7c1a00f 64bit]
May 20 07:22:59 hobo kernel: pci 0000:00:16.0: PME# supported from D0 D3hot D3cold
May 20 07:22:59 hobo kernel: pci 0000:00:1a.0: [8086:1e2d] type 00 class 0x0c0320
May 20 07:22:59 hobo kernel: pci 0000:00:1a.0: reg 10: [mem 0xf7c17000-0xf7c173ff]
May 20 07:22:59 hobo kernel: pci 0000:00:1a.0: PME# supported from D0 D3hot D3cold
May 20 07:22:59 hobo kernel: pci 0000:00:1a.0: System wakeup disabled by ACPI
May 20 07:22:59 hobo kernel: pci 0000:00:1b.0: [8086:1e20] type 00 class 0x040300
May 20 07:22:59 hobo kernel: pci 0000:00:1b.0: reg 10: [mem 0xf7c10000-0xf7c13fff 64bit]
May 20 07:22:59 hobo kernel: pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
May 20 07:22:59 hobo kernel: pci 0000:00:1b.0: System wakeup disabled by ACPI
May 20 07:22:59 hobo kernel: pci 0000:00:1c.0: [8086:1e10] type 01 class 0x060400
May 20 07:22:59 hobo kernel: pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
May 20 07:22:59 hobo kernel: pci 0000:00:1c.0: System wakeup disabled by ACPI
May 20 07:22:59 hobo kernel: pci 0000:00:1c.1: [8086:1e12] type 01 class 0x060400
May 20 07:22:59 hobo kernel: pci 0000:00:1c.1: PME# supported from D0 D3hot D3cold
May 20 07:22:59 hobo kernel: pci 0000:00:1c.1: System wakeup disabled by ACPI
May 20 07:22:59 hobo kernel: pci 0000:00:1d.0: [8086:1e26] type 00 class 0x0c0320
May 20 07:22:59 hobo kernel: pci 0000:00:1d.0: reg 10: [mem 0xf7c16000-0xf7c163ff]
May 20 07:22:59 hobo kernel: pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
May 20 07:22:59 hobo kernel: pci 0000:00:1d.0: System wakeup disabled by ACPI
May 20 07:22:59 hobo kernel: pci 0000:00:1e.0: [8086:244e] type 01 class 0x060401
May 20 07:22:59 hobo kernel: pci 0000:00:1e.0: System wakeup disabled by ACPI
May 20 07:22:59 hobo kernel: pci 0000:00:1f.0: [8086:1e49] type 00 class 0x060100
May 20 07:22:59 hobo kernel: pci 0000:00:1f.2: [8086:1e02] type 00 class 0x010601
May 20 07:22:59 hobo kernel: pci 0000:00:1f.2: reg 10: [io  0xf0b0-0xf0b7]
May 20 07:22:59 hobo kernel: pci 0000:00:1f.2: reg 14: [io  0xf0a0-0xf0a3]
May 20 07:22:59 hobo kernel: pci 0000:00:1f.2: reg 18: [io  0xf090-0xf097]
May 20 07:22:59 hobo kernel: pci 0000:00:1f.2: reg 1c: [io  0xf080-0xf083]
May 20 07:22:59 hobo kernel: pci 0000:00:1f.2: reg 20: [io  0xf060-0xf07f]
May 20 07:22:59 hobo kernel: pci 0000:00:1f.2: reg 24: [mem 0xf7c15000-0xf7c157ff]
May 20 07:22:59 hobo kernel: pci 0000:00:1f.2: PME# supported from D3hot
May 20 07:22:59 hobo kernel: pci 0000:00:1f.3: [8086:1e22] type 00 class 0x0c0500
May 20 07:22:59 hobo kernel: pci 0000:00:1f.3: reg 10: [mem 0xf7c14000-0xf7c140ff 64bit]
May 20 07:22:59 hobo kernel: pci 0000:00:1f.3: reg 20: [io  0xf040-0xf05f]
May 20 07:22:59 hobo kernel: pci 0000:00:1c.0: PCI bridge to [bus 01]
May 20 07:22:59 hobo kernel: pci 0000:02:00.0: [10ec:8168] type 00 class 0x020000
May 20 07:22:59 hobo kernel: pci 0000:02:00.0: reg 10: [io  0xe000-0xe0ff]
May 20 07:22:59 hobo kernel: pci 0000:02:00.0: reg 18: [mem 0xf0004000-0xf0004fff 64bit pref]
May 20 07:22:59 hobo kernel: pci 0000:02:00.0: reg 20: [mem 0xf0000000-0xf0003fff 64bit pref]
May 20 07:22:59 hobo kernel: pci 0000:02:00.0: supports D1 D2
May 20 07:22:59 hobo kernel: pci 0000:02:00.0: PME# supported from D0 D1 D2 D3hot D3cold
May 20 07:22:59 hobo kernel: pci 0000:02:00.0: System wakeup disabled by ACPI
May 20 07:22:59 hobo kernel: pci 0000:00:1c.1: PCI bridge to [bus 02]
May 20 07:22:59 hobo kernel: pci 0000:00:1c.1:   bridge window [io  0xe000-0xefff]
May 20 07:22:59 hobo kernel: pci 0000:00:1c.1:   bridge window [mem 0xf0000000-0xf00fffff 64bit pref]
May 20 07:22:59 hobo kernel: pci 0000:00:1e.0: PCI bridge to [bus 03] (subtractive decode)
May 20 07:22:59 hobo kernel: pci 0000:00:1e.0:   bridge window [io  0x0000-0x0cf7] (subtractive decode)
May 20 07:22:59 hobo kernel: pci 0000:00:1e.0:   bridge window [io  0x0d00-0xffff] (subtractive decode)
May 20 07:22:59 hobo kernel: pci 0000:00:1e.0:   bridge window [mem 0x000a0000-0x000bffff] (subtractive decode)
May 20 07:22:59 hobo kernel: pci 0000:00:1e.0:   bridge window [mem 0x000d0000-0x000d3fff] (subtractive decode)
May 20 07:22:59 hobo kernel: pci 0000:00:1e.0:   bridge window [mem 0x000d4000-0x000d7fff] (subtractive decode)
May 20 07:22:59 hobo kernel: pci 0000:00:1e.0:   bridge window [mem 0x000d8000-0x000dbfff] (subtractive decode)
May 20 07:22:59 hobo kernel: pci 0000:00:1e.0:   bridge window [mem 0x000dc000-0x000dffff] (subtractive decode)
May 20 07:22:59 hobo kernel: pci 0000:00:1e.0:   bridge window [mem 0x000e0000-0x000e3fff] (subtractive decode)
May 20 07:22:59 hobo kernel: pci 0000:00:1e.0:   bridge window [mem 0x000e4000-0x000e7fff] (subtractive decode)
May 20 07:22:59 hobo kernel: pci 0000:00:1e.0:   bridge window [mem 0xdfa00000-0xfeafffff] (subtractive decode)
May 20 07:22:59 hobo kernel: acpi PNP0A08:00: Requesting ACPI _OSC control (0x1d)
May 20 07:22:59 hobo kernel: acpi PNP0A08:00: ACPI _OSC control (0x18) granted
May 20 07:22:59 hobo kernel: ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 10 *11 12 14 15)
May 20 07:22:59 hobo kernel: ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 10 *11 12 14 15)
May 20 07:22:59 hobo kernel: ACPI: PCI Interrupt Link [LNKC] (IRQs *3 4 5 6 10 11 12 14 15)
May 20 07:22:59 hobo kernel: ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 *10 11 12 14 15)
May 20 07:22:59 hobo kernel: ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 10 11 12 14 15) *0, disabled.
May 20 07:22:59 hobo kernel: ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 10 11 12 14 15) *0, disabled.
May 20 07:22:59 hobo kernel: ACPI: PCI Interrupt Link [LNKG] (IRQs *3 4 5 6 10 11 12 14 15)
May 20 07:22:59 hobo kernel: ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 *10 11 12 14 15)
May 20 07:22:59 hobo kernel: ACPI: Enabled 4 GPEs in block 00 to 3F
May 20 07:22:59 hobo kernel: acpi root: \_SB_.PCI0 notify handler is installed
May 20 07:22:59 hobo kernel: Found 1 acpi root devices
May 20 07:22:59 hobo kernel: ACPI: No dock devices found.
May 20 07:22:59 hobo kernel: vgaarb: device added: PCI:0000:00:02.0,decodes=io+mem,owns=io+mem,locks=none
May 20 07:22:59 hobo kernel: vgaarb: loaded
May 20 07:22:59 hobo kernel: vgaarb: bridge control possible 0000:00:02.0
May 20 07:22:59 hobo kernel: PCI: Using ACPI for IRQ routing
May 20 07:22:59 hobo kernel: PCI: pci_cache_line_size set to 64 bytes
May 20 07:22:59 hobo kernel: e820: reserve RAM buffer [mem 0x0009d800-0x0009ffff]
May 20 07:22:59 hobo kernel: e820: reserve RAM buffer [mem 0x40004000-0x43ffffff]
May 20 07:22:59 hobo kernel: e820: reserve RAM buffer [mem 0xd8e8b000-0xdbffffff]
May 20 07:22:59 hobo kernel: e820: reserve RAM buffer [mem 0xda5dd000-0xdbffffff]
May 20 07:22:59 hobo kernel: e820: reserve RAM buffer [mem 0xdaa33000-0xdbffffff]
May 20 07:22:59 hobo kernel: e820: reserve RAM buffer [mem 0xdb000000-0xdbffffff]
May 20 07:22:59 hobo kernel: e820: reserve RAM buffer [mem 0x21e600000-0x21fffffff]
May 20 07:22:59 hobo kernel: NetLabel: Initializing
May 20 07:22:59 hobo kernel: NetLabel:  domain hash size = 128
May 20 07:22:59 hobo kernel: NetLabel:  protocols = UNLABELED CIPSOv4
May 20 07:22:59 hobo kernel: NetLabel:  unlabeled traffic allowed by default
May 20 07:22:59 hobo kernel: hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
May 20 07:22:59 hobo kernel: hpet0: 8 comparators, 64-bit 14.318180 MHz counter
May 20 07:22:59 hobo kernel: Switching to clocksource hpet
May 20 07:22:59 hobo kernel: pnp: PnP ACPI init
May 20 07:22:59 hobo kernel: ACPI: bus type PNP registered
May 20 07:22:59 hobo kernel: system 00:00: [mem 0xfed40000-0xfed44fff] has been reserved
May 20 07:22:59 hobo kernel: system 00:00: Plug and Play ACPI device, IDs PNP0c01 (active)
May 20 07:22:59 hobo kernel: pnp 00:01: [dma 4]
May 20 07:22:59 hobo kernel: pnp 00:01: Plug and Play ACPI device, IDs PNP0200 (active)
May 20 07:22:59 hobo kernel: pnp 00:02: Plug and Play ACPI device, IDs INT0800 (active)
May 20 07:22:59 hobo kernel: pnp 00:03: Plug and Play ACPI device, IDs PNP0103 (active)
May 20 07:22:59 hobo kernel: system 00:04: [io  0x0680-0x069f] has been reserved
May 20 07:22:59 hobo kernel: system 00:04: [io  0x1000-0x100f] has been reserved
May 20 07:22:59 hobo kernel: system 00:04: [io  0xffff] has been reserved
May 20 07:22:59 hobo kernel: system 00:04: [io  0xffff] has been reserved
May 20 07:22:59 hobo kernel: system 00:04: [io  0x0400-0x0453] has been reserved
May 20 07:22:59 hobo kernel: system 00:04: [io  0x0458-0x047f] has been reserved
May 20 07:22:59 hobo kernel: system 00:04: [io  0x0500-0x057f] has been reserved
May 20 07:22:59 hobo kernel: system 00:04: [io  0x164e-0x164f] has been reserved
May 20 07:22:59 hobo kernel: system 00:04: Plug and Play ACPI device, IDs PNP0c02 (active)
May 20 07:22:59 hobo kernel: pnp 00:05: Plug and Play ACPI device, IDs PNP0b00 (active)
May 20 07:22:59 hobo kernel: system 00:06: [io  0x0454-0x0457] has been reserved
May 20 07:22:59 hobo kernel: system 00:06: Plug and Play ACPI device, IDs INT3f0d PNP0c02 (active)
May 20 07:22:59 hobo kernel: system 00:07: [io  0x0a00-0x0a1f] has been reserved
May 20 07:22:59 hobo kernel: system 00:07: [io  0x0a30-0x0a3f] has been reserved
May 20 07:22:59 hobo kernel: system 00:07: Plug and Play ACPI device, IDs PNP0c02 (active)
May 20 07:22:59 hobo kernel: pnp 00:08: [dma 0 disabled]
May 20 07:22:59 hobo kernel: pnp 00:08: Plug and Play ACPI device, IDs PNP0501 (active)
May 20 07:22:59 hobo kernel: system 00:09: [io  0x04d0-0x04d1] has been reserved
May 20 07:22:59 hobo kernel: system 00:09: Plug and Play ACPI device, IDs PNP0c02 (active)
May 20 07:22:59 hobo kernel: pnp 00:0a: Plug and Play ACPI device, IDs PNP0c04 (active)
May 20 07:22:59 hobo kernel: pnp 00:0b: [dma 3]
May 20 07:22:59 hobo kernel: pnp 00:0b: Plug and Play ACPI device, IDs PNP0400 (active)
May 20 07:22:59 hobo kernel: system 00:0c: [mem 0xfed1c000-0xfed1ffff] has been reserved
May 20 07:22:59 hobo kernel: system 00:0c: [mem 0xfed10000-0xfed17fff] has been reserved
May 20 07:22:59 hobo kernel: system 00:0c: [mem 0xfed18000-0xfed18fff] has been reserved
May 20 07:22:59 hobo kernel: system 00:0c: [mem 0xfed19000-0xfed19fff] has been reserved
May 20 07:22:59 hobo kernel: system 00:0c: [mem 0xf8000000-0xfbffffff] has been reserved
May 20 07:22:59 hobo kernel: system 00:0c: [mem 0xfed20000-0xfed3ffff] has been reserved
May 20 07:22:59 hobo kernel: system 00:0c: [mem 0xfed90000-0xfed93fff] has been reserved
May 20 07:22:59 hobo kernel: system 00:0c: [mem 0xfed45000-0xfed8ffff] has been reserved
May 20 07:22:59 hobo kernel: system 00:0c: [mem 0xff000000-0xffffffff] has been reserved
May 20 07:22:59 hobo kernel: system 00:0c: [mem 0xfee00000-0xfeefffff] could not be reserved
May 20 07:22:59 hobo kernel: system 00:0c: Plug and Play ACPI device, IDs PNP0c02 (active)
May 20 07:22:59 hobo kernel: system 00:0d: [mem 0x20000000-0x201fffff] has been reserved
May 20 07:22:59 hobo kernel: system 00:0d: [mem 0x40004000-0x40004fff] has been reserved
May 20 07:22:59 hobo kernel: system 00:0d: Plug and Play ACPI device, IDs PNP0c01 (active)
May 20 07:22:59 hobo kernel: pnp: PnP ACPI: found 14 devices
May 20 07:22:59 hobo kernel: ACPI: bus type PNP unregistered
May 20 07:22:59 hobo kernel: pci 0000:00:1c.0: PCI bridge to [bus 01]
May 20 07:22:59 hobo kernel: pci 0000:00:1c.1: PCI bridge to [bus 02]
May 20 07:22:59 hobo kernel: pci 0000:00:1c.1:   bridge window [io  0xe000-0xefff]
May 20 07:22:59 hobo kernel: pci 0000:00:1c.1:   bridge window [mem 0xf0000000-0xf00fffff 64bit pref]
May 20 07:22:59 hobo kernel: pci 0000:00:1e.0: PCI bridge to [bus 03]
May 20 07:22:59 hobo kernel: pci 0000:00:1e.0: setting latency timer to 64
May 20 07:22:59 hobo kernel: pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7]
May 20 07:22:59 hobo kernel: pci_bus 0000:00: resource 5 [io  0x0d00-0xffff]
May 20 07:22:59 hobo kernel: pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff]
May 20 07:22:59 hobo kernel: pci_bus 0000:00: resource 7 [mem 0x000d0000-0x000d3fff]
May 20 07:22:59 hobo kernel: pci_bus 0000:00: resource 8 [mem 0x000d4000-0x000d7fff]
May 20 07:22:59 hobo kernel: pci_bus 0000:00: resource 9 [mem 0x000d8000-0x000dbfff]
May 20 07:22:59 hobo kernel: pci_bus 0000:00: resource 10 [mem 0x000dc000-0x000dffff]
May 20 07:22:59 hobo kernel: pci_bus 0000:00: resource 11 [mem 0x000e0000-0x000e3fff]
May 20 07:22:59 hobo kernel: pci_bus 0000:00: resource 12 [mem 0x000e4000-0x000e7fff]
May 20 07:22:59 hobo kernel: pci_bus 0000:00: resource 13 [mem 0xdfa00000-0xfeafffff]
May 20 07:22:59 hobo kernel: pci_bus 0000:02: resource 0 [io  0xe000-0xefff]
May 20 07:22:59 hobo kernel: pci_bus 0000:02: resource 2 [mem 0xf0000000-0xf00fffff 64bit pref]
May 20 07:22:59 hobo kernel: pci_bus 0000:03: resource 4 [io  0x0000-0x0cf7]
May 20 07:22:59 hobo kernel: pci_bus 0000:03: resource 5 [io  0x0d00-0xffff]
May 20 07:22:59 hobo kernel: pci_bus 0000:03: resource 6 [mem 0x000a0000-0x000bffff]
May 20 07:22:59 hobo kernel: pci_bus 0000:03: resource 7 [mem 0x000d0000-0x000d3fff]
May 20 07:22:59 hobo kernel: pci_bus 0000:03: resource 8 [mem 0x000d4000-0x000d7fff]
May 20 07:22:59 hobo kernel: pci_bus 0000:03: resource 9 [mem 0x000d8000-0x000dbfff]
May 20 07:22:59 hobo kernel: pci_bus 0000:03: resource 10 [mem 0x000dc000-0x000dffff]
May 20 07:22:59 hobo kernel: pci_bus 0000:03: resource 11 [mem 0x000e0000-0x000e3fff]
May 20 07:22:59 hobo kernel: pci_bus 0000:03: resource 12 [mem 0x000e4000-0x000e7fff]
May 20 07:22:59 hobo kernel: pci_bus 0000:03: resource 13 [mem 0xdfa00000-0xfeafffff]
May 20 07:22:59 hobo kernel: NET: Registered protocol family 2
May 20 07:22:59 hobo kernel: TCP established hash table entries: 65536 (order: 8, 1048576 bytes)
May 20 07:22:59 hobo kernel: TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
May 20 07:22:59 hobo kernel: TCP: Hash tables configured (established 65536 bind 65536)
May 20 07:22:59 hobo kernel: TCP: reno registered
May 20 07:22:59 hobo kernel: UDP hash table entries: 4096 (order: 5, 131072 bytes)
May 20 07:22:59 hobo kernel: UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes)
May 20 07:22:59 hobo kernel: NET: Registered protocol family 1
May 20 07:22:59 hobo kernel: pci 0000:00:02.0: Boot video device
May 20 07:22:59 hobo kernel: PCI: CLS 64 bytes, default 64
May 20 07:22:59 hobo kernel: Unpacking initramfs...
May 20 07:22:59 hobo kernel: Freeing initrd memory: 2912k freed
May 20 07:22:59 hobo kernel: PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
May 20 07:22:59 hobo kernel: software IO TLB [mem 0xd4e8b000-0xd8e8b000] (64MB) mapped at [ffff8800d4e8b000-ffff8800d8e8afff]
May 20 07:22:59 hobo kernel: Scanning for low memory corruption every 60 seconds
May 20 07:22:59 hobo kernel: audit: initializing netlink socket (disabled)
May 20 07:22:59 hobo kernel: type=2000 audit(1369030972.253:1): initialized
May 20 07:22:59 hobo kernel: HugeTLB registered 2 MB page size, pre-allocated 0 pages
May 20 07:22:59 hobo kernel: VFS: Disk quotas dquot_6.5.2
May 20 07:22:59 hobo kernel: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
May 20 07:22:59 hobo kernel: msgmni has been set to 15699
May 20 07:22:59 hobo kernel: Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
May 20 07:22:59 hobo kernel: io scheduler noop registered
May 20 07:22:59 hobo kernel: io scheduler deadline registered
May 20 07:22:59 hobo kernel: io scheduler cfq registered (default)
May 20 07:22:59 hobo kernel: vesafb: mode is 1920x1080x32, linelength=7680, pages=0
May 20 07:22:59 hobo kernel: vesafb: scrolling: redraw
May 20 07:22:59 hobo kernel: vesafb: Truecolor: size=8:8:8:8, shift=24:16:8:0
May 20 07:22:59 hobo kernel: vesafb: framebuffer at 0xe0000000, mapped to 0xffffc90004f00000, using 8128k, total 8128k
May 20 07:22:59 hobo kernel: Console: switching to colour frame buffer device 240x67
May 20 07:22:59 hobo kernel: fb0: VESA VGA frame buffer device
May 20 07:22:59 hobo kernel: intel_idle: MWAIT substates: 0x1120
May 20 07:22:59 hobo kernel: intel_idle: v0.4 model 0x3A
May 20 07:22:59 hobo kernel: intel_idle: lapic_timer_reliable_states 0xffffffff
May 20 07:22:59 hobo kernel: GHES: HEST is not enabled!
May 20 07:22:59 hobo kernel: Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
May 20 07:22:59 hobo kernel: 00:08: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
May 20 07:22:59 hobo kernel: Linux agpgart interface v0.103
May 20 07:22:59 hobo kernel: mei_me 0000:00:16.0: setting latency timer to 64
May 20 07:22:59 hobo kernel: mei_me 0000:00:16.0: irq 40 for MSI/MSI-X
May 20 07:22:59 hobo kernel: i8042: PNP: No PS/2 controller found. Probing ports directly.
May 20 07:22:59 hobo kernel: serio: i8042 KBD port at 0x60,0x64 irq 1
May 20 07:22:59 hobo kernel: serio: i8042 AUX port at 0x60,0x64 irq 12
May 20 07:22:59 hobo kernel: mousedev: PS/2 mouse device common for all mice
May 20 07:22:59 hobo kernel: rtc_cmos 00:05: RTC can wake from S4
May 20 07:22:59 hobo kernel: rtc_cmos 00:05: rtc core: registered rtc_cmos as rtc0
May 20 07:22:59 hobo kernel: rtc_cmos 00:05: alarms up to one month, y3k, 242 bytes nvram, hpet irqs
May 20 07:22:59 hobo kernel: cpuidle: using governor ladder
May 20 07:22:59 hobo kernel: cpuidle: using governor menu
May 20 07:22:59 hobo kernel: drop_monitor: Initializing network drop monitor service
May 20 07:22:59 hobo kernel: TCP: cubic registered
May 20 07:22:59 hobo kernel: NET: Registered protocol family 10
May 20 07:22:59 hobo kernel: NET: Registered protocol family 17
May 20 07:22:59 hobo kernel: Key type dns_resolver registered
May 20 07:22:59 hobo kernel: PM: Hibernation image not present or could not be loaded.
May 20 07:22:59 hobo kernel: registered taskstats version 1
May 20 07:22:59 hobo kernel:   Magic number: 13:951:367
May 20 07:22:59 hobo kernel: Freeing unused kernel memory: 1036k freed
May 20 07:22:59 hobo kernel: Write protecting the kernel read-only data: 8192k
May 20 07:22:59 hobo kernel: Freeing unused kernel memory: 1292k freed
May 20 07:22:59 hobo kernel: Freeing unused kernel memory: 436k freed
May 20 07:22:59 hobo systemd-udevd[57]: starting version 204
May 20 07:22:59 hobo kernel: ACPI: bus type USB registered
May 20 07:22:59 hobo kernel: usbcore: registered new interface driver usbfs
May 20 07:22:59 hobo kernel: usbcore: registered new interface driver hub
May 20 07:22:59 hobo kernel: usbcore: registered new device driver usb
May 20 07:22:59 hobo kernel: xhci_hcd 0000:00:14.0: setting latency timer to 64
May 20 07:22:59 hobo kernel: SCSI subsystem initialized
May 20 07:22:59 hobo kernel: xhci_hcd 0000:00:14.0: xHCI Host Controller
May 20 07:22:59 hobo kernel: ACPI: bus type ATA registered
May 20 07:22:59 hobo kernel: ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
May 20 07:22:59 hobo kernel: ehci-pci: EHCI PCI platform driver
May 20 07:22:59 hobo kernel: libata version 3.00 loaded.
May 20 07:22:59 hobo kernel: xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
May 20 07:22:59 hobo kernel: xhci_hcd 0000:00:14.0: cache line size of 64 is not supported
May 20 07:22:59 hobo kernel: xhci_hcd 0000:00:14.0: irq 41 for MSI/MSI-X
May 20 07:22:59 hobo kernel: xHCI xhci_add_endpoint called for root hub
May 20 07:22:59 hobo kernel: xHCI xhci_check_bandwidth called for root hub
May 20 07:22:59 hobo kernel: hub 1-0:1.0: USB hub found
May 20 07:22:59 hobo kernel: hub 1-0:1.0: 4 ports detected
May 20 07:22:59 hobo kernel: xhci_hcd 0000:00:14.0: xHCI Host Controller
May 20 07:22:59 hobo kernel: xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
May 20 07:22:59 hobo kernel: xHCI xhci_add_endpoint called for root hub
May 20 07:22:59 hobo kernel: xHCI xhci_check_bandwidth called for root hub
May 20 07:22:59 hobo kernel: hub 2-0:1.0: USB hub found
May 20 07:22:59 hobo kernel: hub 2-0:1.0: 4 ports detected
May 20 07:22:59 hobo kernel: ehci-pci 0000:00:1a.0: setting latency timer to 64
May 20 07:22:59 hobo kernel: ehci-pci 0000:00:1a.0: EHCI Host Controller
May 20 07:22:59 hobo kernel: ehci-pci 0000:00:1a.0: new USB bus registered, assigned bus number 3
May 20 07:22:59 hobo kernel: ehci-pci 0000:00:1a.0: debug port 2
May 20 07:22:59 hobo kernel: ehci-pci 0000:00:1a.0: cache line size of 64 is not supported
May 20 07:22:59 hobo kernel: ehci-pci 0000:00:1a.0: irq 16, io mem 0xf7c17000
May 20 07:22:59 hobo kernel: usb 1-3: new low-speed USB device number 2 using xhci_hcd
May 20 07:22:59 hobo kernel: ehci-pci 0000:00:1a.0: USB 2.0 started, EHCI 1.00
May 20 07:22:59 hobo kernel: hub 3-0:1.0: USB hub found
May 20 07:22:59 hobo kernel: hub 3-0:1.0: 2 ports detected
May 20 07:22:59 hobo kernel: ehci-pci 0000:00:1d.0: setting latency timer to 64
May 20 07:22:59 hobo kernel: ehci-pci 0000:00:1d.0: EHCI Host Controller
May 20 07:22:59 hobo kernel: ehci-pci 0000:00:1d.0: new USB bus registered, assigned bus number 4
May 20 07:22:59 hobo kernel: ehci-pci 0000:00:1d.0: debug port 2
May 20 07:22:59 hobo kernel: ehci-pci 0000:00:1d.0: cache line size of 64 is not supported
May 20 07:22:59 hobo kernel: ehci-pci 0000:00:1d.0: irq 23, io mem 0xf7c16000
May 20 07:22:59 hobo kernel: ehci-pci 0000:00:1d.0: USB 2.0 started, EHCI 1.00
May 20 07:22:59 hobo kernel: hub 4-0:1.0: USB hub found
May 20 07:22:59 hobo kernel: hub 4-0:1.0: 2 ports detected
May 20 07:22:59 hobo kernel: ahci 0000:00:1f.2: version 3.0
May 20 07:22:59 hobo kernel: ahci 0000:00:1f.2: irq 42 for MSI/MSI-X
May 20 07:22:59 hobo kernel: ahci 0000:00:1f.2: AHCI 0001.0300 32 slots 6 ports 6 Gbps 0x9 impl SATA mode
May 20 07:22:59 hobo kernel: ahci 0000:00:1f.2: flags: 64bit ncq pm led clo pio slum part ems apst 
May 20 07:22:59 hobo kernel: ahci 0000:00:1f.2: setting latency timer to 64
May 20 07:22:59 hobo kernel: scsi0 : ahci
May 20 07:22:59 hobo kernel: scsi1 : ahci
May 20 07:22:59 hobo kernel: scsi2 : ahci
May 20 07:22:59 hobo kernel: scsi3 : ahci
May 20 07:22:59 hobo kernel: scsi4 : ahci
May 20 07:22:59 hobo kernel: scsi5 : ahci
May 20 07:22:59 hobo kernel: ata1: SATA max UDMA/133 abar m2048@0xf7c15000 port 0xf7c15100 irq 42
May 20 07:22:59 hobo kernel: ata2: DUMMY
May 20 07:22:59 hobo kernel: ata3: DUMMY
May 20 07:22:59 hobo kernel: ata4: SATA max UDMA/133 abar m2048@0xf7c15000 port 0xf7c15280 irq 42
May 20 07:22:59 hobo kernel: ata5: DUMMY
May 20 07:22:59 hobo kernel: ata6: DUMMY
May 20 07:22:59 hobo kernel: tsc: Refined TSC clocksource calibration: 3392.293 MHz
May 20 07:22:59 hobo kernel: Switching to clocksource tsc
May 20 07:22:59 hobo kernel: usb 1-3: ep 0x81 - rounding interval to 64 microframes, ep desc says 80 microframes
May 20 07:22:59 hobo kernel: ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
May 20 07:22:59 hobo kernel: ata4: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
May 20 07:22:59 hobo kernel: ACPI Error: [DSSP] Namespace lookup failure, AE_NOT_FOUND (20130328/psargs-359)
May 20 07:22:59 hobo kernel: ACPI Error: Method parse/execution failed [\_SB_.PCI0.SAT0.SPT0._GTF] (Node ffff88021287ae10), AE_NOT_FOUND (20130328/psparse-537)
May 20 07:22:59 hobo kernel: ACPI Error: [DSSP] Namespace lookup failure, AE_NOT_FOUND (20130328/psargs-359)
May 20 07:22:59 hobo kernel: usb 1-4: new low-speed USB device number 3 using xhci_hcd
May 20 07:22:59 hobo kernel: ACPI Error: Method parse/execution failed [\_SB_.PCI0.SAT0.SPT3._GTF] (Node ffff88021287af78), AE_NOT_FOUND (20130328/psparse-537)
May 20 07:22:59 hobo kernel: ata4.00: ATAPI: TSSTcorp CDDVDW SH-222BB, SB00, max UDMA/100
May 20 07:22:59 hobo kernel: ata1.00: ATA-8: ST31000524AS, JC4B, max UDMA/133
May 20 07:22:59 hobo kernel: ata1.00: 1953525168 sectors, multi 16: LBA48 NCQ (depth 31/32)
May 20 07:22:59 hobo kernel: ACPI Error: [DSSP] Namespace lookup failure, AE_NOT_FOUND (20130328/psargs-359)
May 20 07:22:59 hobo kernel: ACPI Error: Method parse/execution failed [\_SB_.PCI0.SAT0.SPT0._GTF] (Node ffff88021287ae10), AE_NOT_FOUND (20130328/psparse-537)
May 20 07:22:59 hobo kernel: usb 1-4: ep 0x81 - rounding interval to 64 microframes, ep desc says 80 microframes
May 20 07:22:59 hobo kernel: ACPI Error: [DSSP] Namespace lookup failure, AE_NOT_FOUND (20130328/psargs-359)
May 20 07:22:59 hobo kernel: hidraw: raw HID events driver (C) Jiri Kosina
May 20 07:22:59 hobo kernel: ACPI Error: Method parse/execution failed [\_SB_.PCI0.SAT0.SPT3._GTF] (Node ffff88021287af78), AE_NOT_FOUND (20130328/psparse-537)
May 20 07:22:59 hobo kernel: ata4.00: configured for UDMA/100
May 20 07:22:59 hobo kernel: ata1.00: configured for UDMA/133
May 20 07:22:59 hobo kernel: usb 3-1: new high-speed USB device number 2 using ehci-pci
May 20 07:22:59 hobo kernel: usbcore: registered new interface driver usbhid
May 20 07:22:59 hobo kernel: usbhid: USB HID core driver
May 20 07:22:59 hobo kernel: input: USB OPTICAL MOUSE as /devices/pci0000:00/0000:00:14.0/usb1/1-3/1-3:1.0/input/input0
May 20 07:22:59 hobo kernel: hid-generic 0003:093A:2521.0001: input,hidraw0: USB HID v1.11 Mouse [USB OPTICAL MOUSE] on usb-0000:00:14.0-3/input0
May 20 07:22:59 hobo kernel: input: DELL Dell USB Entry Keyboard as /devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0/input/input1
May 20 07:22:59 hobo kernel: hid-generic 0003:413C:2107.0002: input,hidraw1: USB HID v1.10 Keyboard [DELL Dell USB Entry Keyboard] on usb-0000:00:14.0-4/input0
May 20 07:22:59 hobo kernel: scsi 0:0:0:0: Direct-Access     ATA      ST31000524AS     JC4B PQ: 0 ANSI: 5
May 20 07:22:59 hobo kernel: scsi 3:0:0:0: CD-ROM            TSSTcorp CDDVDW SH-222BB  SB00 PQ: 0 ANSI: 5
May 20 07:22:59 hobo kernel: sd 0:0:0:0: [sda] 1953525168 512-byte logical blocks: (1.00 TB/931 GiB)
May 20 07:22:59 hobo kernel: sd 0:0:0:0: [sda] Write Protect is off
May 20 07:22:59 hobo kernel: sr0: scsi3-mmc drive: 48x/48x writer dvd-ram cd/rw xa/form2 cdda tray
May 20 07:22:59 hobo kernel: cdrom: Uniform CD-ROM driver Revision: 3.20
May 20 07:22:59 hobo kernel: sr 3:0:0:0: Attached scsi CD-ROM sr0
May 20 07:22:59 hobo kernel: sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
May 20 07:22:59 hobo kernel: sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
May 20 07:22:59 hobo kernel: hub 3-1:1.0: USB hub found
May 20 07:22:59 hobo kernel: hub 3-1:1.0: 6 ports detected
May 20 07:22:59 hobo kernel:  sda: sda1 sda2 sda3 sda4 sda5 sda6 sda7 sda8 sda9 sda10
May 20 07:22:59 hobo kernel: sd 0:0:0:0: [sda] Attached SCSI disk
May 20 07:22:59 hobo kernel: usb 4-1: new high-speed USB device number 2 using ehci-pci
May 20 07:22:59 hobo kernel: hub 4-1:1.0: USB hub found
May 20 07:22:59 hobo kernel: hub 4-1:1.0: 6 ports detected
May 20 07:22:59 hobo kernel: EXT4-fs (sda2): mounted filesystem with ordered data mode. Opts: (null)
May 20 07:22:59 hobo systemd[1]: systemd 204 running in system mode. (+PAM -LIBWRAP -AUDIT -SELINUX -IMA -SYSVINIT +LIBCRYPTSETUP +GCRYPT +ACL +XZ)
May 20 07:22:59 hobo systemd[1]: Set hostname to <hobo>.
May 20 07:22:59 hobo systemd[1]: Starting Forward Password Requests to Wall Directory Watch.
May 20 07:22:59 hobo systemd[1]: Started Forward Password Requests to Wall Directory Watch.
May 20 07:22:59 hobo systemd[1]: Starting Remote File Systems.
May 20 07:22:59 hobo systemd[1]: Reached target Remote File Systems.
May 20 07:22:59 hobo systemd[1]: Expecting device sys-subsystem-net-devices-enp2s0.device...
May 20 07:22:59 hobo systemd[1]: Starting Device-mapper event daemon FIFOs.
May 20 07:22:59 hobo systemd[1]: Listening on Device-mapper event daemon FIFOs.
May 20 07:22:59 hobo systemd[1]: Starting /dev/initctl Compatibility Named Pipe.
May 20 07:22:59 hobo systemd[1]: Listening on /dev/initctl Compatibility Named Pipe.
May 20 07:22:59 hobo systemd[1]: Starting Delayed Shutdown Socket.
May 20 07:22:59 hobo systemd[1]: Listening on Delayed Shutdown Socket.
May 20 07:22:59 hobo systemd[1]: Starting Arbitrary Executable File Formats File System Automount Point.
May 20 07:22:59 hobo systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
May 20 07:22:59 hobo systemd[1]: Starting Encrypted Volumes.
May 20 07:22:59 hobo systemd[1]: Reached target Encrypted Volumes.
May 20 07:22:59 hobo systemd[1]: Starting Dispatch Password Requests to Console Directory Watch.
May 20 07:22:59 hobo systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
May 20 07:22:59 hobo systemd[1]: Starting Paths.
May 20 07:22:59 hobo systemd[1]: Reached target Paths.
May 20 07:22:59 hobo systemd[1]: Starting udev Kernel Socket.
May 20 07:22:59 hobo systemd[1]: Listening on udev Kernel Socket.
May 20 07:22:59 hobo systemd[1]: Starting udev Control Socket.
May 20 07:22:59 hobo systemd[1]: Listening on udev Control Socket.
May 20 07:22:59 hobo systemd[1]: Starting Journal Socket.
May 20 07:22:59 hobo systemd[1]: Listening on Journal Socket.
May 20 07:22:59 hobo systemd[1]: Starting Setup Virtual Console...
May 20 07:22:59 hobo systemd[1]: Started Set Up Additional Binary Formats.
May 20 07:22:59 hobo systemd[1]: Started Load Kernel Modules.
May 20 07:22:59 hobo systemd[1]: Mounting Configuration File System...
May 20 07:22:59 hobo systemd[1]: Mounted FUSE Control File System.
May 20 07:22:59 hobo systemd[1]: Starting Apply Kernel Variables...
May 20 07:22:59 hobo systemd[1]: Starting Create static device nodes in /dev...
May 20 07:22:59 hobo systemd[1]: Mounting Huge Pages File System...
May 20 07:22:59 hobo systemd[1]: Starting udev Coldplug all Devices...
May 20 07:22:59 hobo systemd[1]: Mounting Debug File System...
May 20 07:22:59 hobo systemd[1]: Starting Journal Service...
May 20 07:22:59 hobo systemd[1]: Started Journal Service.
May 20 07:22:59 hobo systemd[1]: Mounting POSIX Message Queue File System...
May 20 07:22:59 hobo systemd[1]: Expecting device dev-disk-by\x2duuid-0bd636af\x2dcec2\x2d425d\x2dbabe\x2d03aa4efca3ee.device...
May 20 07:22:59 hobo systemd[1]: Started File System Check on Root Device.
May 20 07:22:59 hobo systemd[1]: Starting Remount Root and Kernel File Systems...
May 20 07:22:59 hobo systemd[1]: Expecting device dev-disk-by\x2duuid-2ff31edf\x2de1c3\x2d43a1\x2d95d8\x2dc43627dce06b.device...
May 20 07:22:59 hobo systemd-journal[129]: Journal started
May 20 07:22:59 hobo systemd-sysctl[118]: Duplicate assignment of kernel/sysrq in file '/usr/lib/sysctl.d/50-default.conf', ignoring.
May 20 07:22:59 hobo kernel: EXT4-fs (sda2): re-mounted. Opts: data=ordered
May 20 07:22:59 hobo systemd[1]: Started Setup Virtual Console.
May 20 07:22:59 hobo systemd[1]: Mounted Configuration File System.
May 20 07:22:59 hobo systemd[1]: Started Apply Kernel Variables.
May 20 07:22:59 hobo systemd[1]: Started Create static device nodes in /dev.
May 20 07:22:59 hobo systemd[1]: Mounted Huge Pages File System.
May 20 07:22:59 hobo systemd[1]: Mounted Debug File System.
May 20 07:22:59 hobo systemd[1]: Mounted POSIX Message Queue File System.
May 20 07:22:59 hobo systemd[1]: Started Remount Root and Kernel File Systems.
May 20 07:22:59 hobo systemd[1]: Started udev Coldplug all Devices.
May 20 07:22:59 hobo systemd[1]: Starting Load Random Seed...
May 20 07:23:00 hobo systemd[1]: Starting udev Kernel Device Manager...
May 20 07:23:00 hobo systemd[1]: Started Load Random Seed.
May 20 07:23:00 hobo systemd-udevd[143]: starting version 204
May 20 07:23:00 hobo systemd[1]: Started udev Kernel Device Manager.
May 20 07:23:00 hobo systemd[1]: Starting Local File Systems (Pre).
May 20 07:23:00 hobo systemd[1]: Reached target Local File Systems (Pre).
May 20 07:23:00 hobo systemd[1]: Mounting /tmp...
May 20 07:23:00 hobo systemd[1]: Mounted /tmp.
May 20 07:23:00 hobo kernel: ACPI: Requesting acpi_cpufreq
May 20 07:23:00 hobo kernel: ACPI Warning: 0x0000000000000428-0x000000000000042f SystemIO conflicts with Region \PMIO 1 (20130328/utaddress-251)
May 20 07:23:00 hobo kernel: ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
May 20 07:23:00 hobo kernel: ACPI Warning: 0x0000000000000530-0x000000000000053f SystemIO conflicts with Region \GPIO 1 (20130328/utaddress-251)
May 20 07:23:00 hobo kernel: ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
May 20 07:23:01 hobo kernel: [drm] Initialized drm 1.1.0 20060810
May 20 07:23:01 hobo kernel: ACPI Warning: 0x0000000000000500-0x000000000000052f SystemIO conflicts with Region \GPIO 1 (20130328/utaddress-251)
May 20 07:23:01 hobo kernel: ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
May 20 07:23:01 hobo kernel: lpc_ich: Resource conflict(s) found affecting gpio_ich
May 20 07:23:01 hobo kernel: ACPI Warning: 0x000000000000f040-0x000000000000f05f SystemIO conflicts with Region \_SB_.PCI0.SBUS.SMBI 1 (20130328/utaddress-251)
May 20 07:23:01 hobo kernel: ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
May 20 07:23:01 hobo kernel: input: Power Button as /devices/LNXSYSTM:00/device:00/PNP0C0C:00/input/input2
May 20 07:23:01 hobo kernel: ACPI: Power Button [PWRB]
May 20 07:23:01 hobo kernel: input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input3
May 20 07:23:01 hobo kernel: ACPI: Power Button [PWRF]
May 20 07:23:01 hobo kernel: cpufreq_ondemand: od_init: tuners ffff880211c58760
May 20 07:23:01 hobo kernel: thermal LNXTHERM:00: registered as thermal_zone0
May 20 07:23:01 hobo kernel: ACPI: Thermal Zone [TZ00] (28 C)
May 20 07:23:01 hobo kernel: ------------[ cut here ]------------
May 20 07:23:01 hobo kernel: input: PC Speaker as /devices/platform/pcspkr/input/input4
May 20 07:23:01 hobo kernel: parport_pc 00:0b: reported by Plug and Play ACPI
May 20 07:23:01 hobo kernel: parport0: PC-style at 0x378, irq 5 [PCSPP]
May 20 07:23:01 hobo kernel: WARNING: at drivers/cpufreq/cpufreq_governor.c:251 cpufreq_governor_dbs+0x61e/0x680()
May 20 07:23:01 hobo kernel: microcode: CPU0 sig=0x306a9, pf=0x2, revision=0x12
May 20 07:23:01 hobo kernel: r8169 Gigabit Ethernet driver 2.3LK-NAPI loaded
May 20 07:23:01 hobo kernel: r8169 0000:02:00.0: irq 43 for MSI/MSI-X
May 20 07:23:01 hobo kernel: r8169 0000:02:00.0 eth0: RTL8168evl/8111evl at 0xffffc90005cd2000, d4:3d:7e:2c:aa:8c, XID 0c900800 IRQ 43
May 20 07:23:01 hobo kernel: r8169 0000:02:00.0 eth0: jumbo features [frames: 9200 bytes, tx checksumming: ko]
May 20 07:23:01 hobo kernel: Modules linked in: parport_pc parport microcode(+) pcspkr evdev fan(+) acpi_cpufreq mii psmouse intel_agp thermal(+) intel_gtt serio_raw drm_kms_helper button mperf drm video i2c_i801 i2c_algo_bit i2c_core lpc_ich processor ext4 crc16 mbcache jbd2 sr_mod cdrom sd_mod hid_generic usbhid hid ahci libahci ehci_pci libata scsi_mod ehci_hcd xhci_hcd usbcore usb_common
May 20 07:23:01 hobo kernel: CPU: 2 PID: 154 Comm: systemd-udevd Not tainted 3.10.0-1-ARCH #1
May 20 07:23:01 hobo kernel: Hardware name: MSI MS-7808/B75MA-E33 (MS-7808), BIOS V1.1 07/30/2012
May 20 07:23:02 hobo kernel: microcode: CPU1 sig=0x306a9, pf=0x2, revision=0x12
May 20 07:23:02 hobo kernel: iTCO_vendor_support: vendor-support=0
May 20 07:23:02 hobo kernel: iTCO_wdt: Intel TCO WatchDog Timer Driver v1.10
May 20 07:23:02 hobo kernel: iTCO_wdt: Found a Panther Point TCO device (Version=2, TCOBASE=0x0460)
May 20 07:23:02 hobo kernel: iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
May 20 07:23:02 hobo kernel: ppdev: user-space parallel port driver
May 20 07:23:02 hobo kernel: microcode: CPU2 sig=0x306a9, pf=0x2, revision=0x12
May 20 07:23:02 hobo kernel: microcode: CPU3 sig=0x306a9, pf=0x2, revision=0x12
May 20 07:23:02 hobo kernel: microcode: Microcode Update Driver: v2.00 <tigran@aivazian.fsnet.co.uk>, Peter Oruba
May 20 07:23:02 hobo kernel: [drm] Memory usable by graphics device = 2048M
May 20 07:23:02 hobo kernel: checking generic (e0000000 7f0000) vs hw (e0000000 10000000)
May 20 07:23:02 hobo kernel: fb: conflicting fb hw usage inteldrmfb vs VESA VGA - removing generic driver
May 20 07:23:02 hobo kernel:  0000000000000009 ffff880211b75810 ffffffff814aa0c4 ffff880211b75848
May 20 07:23:02 hobo kernel:  ffffffff81041501
May 20 07:23:02 hobo kernel:  0000000000000000
May 20 07:23:02 hobo kernel:  ffff880211bc8a00
May 20 07:23:02 hobo kernel:  0000000000000000
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  0000000000000002
May 20 07:23:02 hobo kernel:  ffffffff81888260
May 20 07:23:02 hobo kernel:  ffff880211b75858
May 20 07:23:02 hobo kernel:  ffffffff810415da
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel: Call Trace:
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff814aa0c4>] dump_stack+0x19/0x1b
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff81041501>] warn_slowpath_common+0x61/0x80
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff810415da>] warn_slowpath_null+0x1a/0x20
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff81374a1e>] cpufreq_governor_dbs+0x61e/0x680
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff814acc9e>] ? mutex_unlock+0xe/0x10
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffffa02a0472>] ? acpi_processor_ppc_notifier+0xa6/0xab [processor]
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff814b2fcc>] ? notifier_call_chain+0x4c/0x70
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff813733b7>] od_cpufreq_governor_dbs+0x17/0x20
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff8137146f>] __cpufreq_governor+0x4f/0x120
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo systemd-udevd[143]: worker [154] terminated by signal 9 (Killed)
May 20 07:23:02 hobo systemd-udevd[143]: worker [154] failed while handling '/devices/LNXSYSTM:00/device:51/LNXTHERM:00'
May 20 07:23:02 hobo kernel:  [<ffffffff81371689>] __cpufreq_set_policy+0x149/0x2c0
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff81372e73>] cpufreq_update_policy+0xe3/0x180
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff81372f10>] ? cpufreq_update_policy+0x180/0x180
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffffa029f68c>] cpufreq_set_cur_state.part.3+0x8a/0x93 [processor]
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffffa029f7a2>] processor_set_cur_state+0xa1/0xdb [processor]
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff8136cb05>] thermal_cdev_update+0x95/0xb0
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff8136ebe9>] step_wise_throttle+0x59/0x90
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff8136d6c8>] handle_thermal_trip+0x48/0x140
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff8136d835>] thermal_zone_device_update+0x75/0xb0
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff8136e347>] thermal_zone_device_register+0x8b7/0xac0
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffffa03c117c>] acpi_thermal_add+0x27e/0x442 [thermal]
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff812bf461>] acpi_device_probe+0x4e/0x10f
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff8132ce57>] driver_probe_device+0x87/0x3a0
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff8132d243>] __driver_attach+0x93/0xa0
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff8132d1b0>] ? __device_attach+0x40/0x40
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff8132ae13>] bus_for_each_dev+0x63/0xa0
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff8132c8ce>] driver_attach+0x1e/0x20
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff8132c418>] bus_add_driver+0x1e8/0x2a0
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffffa03c4000>] ? 0xffffffffa03c3fff
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff8132d8b1>] driver_register+0x71/0x150
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffffa03c4000>] ? 0xffffffffa03c3fff
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff812bf9dc>] acpi_bus_register_driver+0x3b/0x43
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffffa03c403a>] acpi_thermal_init+0x3a/0x42 [thermal]
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff810002aa>] do_one_initcall+0xda/0x190
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff810a76a7>] load_module+0x1b17/0x2620
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff81272920>] ? ddebug_proc_write+0xf0/0xf0
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff810a8252>] SyS_init_module+0xa2/0xf0
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel:  [<ffffffff814b6e06>] system_call_fastpath+0x1a/0x1f
May 20 07:23:02 hobo kernel: ---[ end trace fbf03bdeb06726ee ]---
May 20 07:23:02 hobo kernel: BUG: unable to handle kernel 
May 20 07:23:02 hobo kernel: NULL pointer dereference
May 20 07:23:02 hobo kernel:  at           (null)
May 20 07:23:02 hobo kernel: IP:
May 20 07:23:02 hobo kernel:  [<ffffffff81374452>] cpufreq_governor_dbs+0x52/0x680
May 20 07:23:02 hobo kernel: PGD 21277b067 
May 20 07:23:02 hobo kernel: PUD 212785067 
May 20 07:23:02 hobo kernel: PMD 0 
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel: Oops: 0000 [#1] 
May 20 07:23:02 hobo kernel: PREEMPT 
May 20 07:23:02 hobo kernel: SMP 
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel: Modules linked in:
May 20 07:23:02 hobo kernel:  cryptd
May 20 07:23:02 hobo kernel:  snd_hda_intel(+)
May 20 07:23:02 hobo kernel:  snd_hda_codec
May 20 07:23:02 hobo kernel:  ppdev
May 20 07:23:02 hobo kernel:  snd_hwdep
May 20 07:23:02 hobo kernel:  snd_pcm
May 20 07:23:02 hobo kernel:  snd_page_alloc
May 20 07:23:02 hobo kernel:  i915(+)
May 20 07:23:02 hobo kernel:  snd_timer
May 20 07:23:02 hobo kernel:  snd
May 20 07:23:02 hobo kernel:  iTCO_wdt
May 20 07:23:02 hobo kernel:  iTCO_vendor_support
May 20 07:23:02 hobo kernel:  soundcore
May 20 07:23:02 hobo kernel:  r8169
May 20 07:23:02 hobo kernel:  parport_pc
May 20 07:23:02 hobo kernel:  parport
May 20 07:23:02 hobo kernel:  microcode
May 20 07:23:02 hobo kernel:  pcspkr
May 20 07:23:02 hobo kernel:  evdev
May 20 07:23:02 hobo kernel:  fan(+)
May 20 07:23:02 hobo kernel:  acpi_cpufreq
May 20 07:23:02 hobo kernel:  mii
May 20 07:23:02 hobo kernel:  psmouse
May 20 07:23:02 hobo kernel:  intel_agp
May 20 07:23:02 hobo kernel:  thermal(+)
May 20 07:23:02 hobo kernel:  intel_gtt
May 20 07:23:02 hobo kernel:  serio_raw
May 20 07:23:02 hobo kernel:  drm_kms_helper
May 20 07:23:02 hobo kernel:  button
May 20 07:23:02 hobo kernel:  mperf
May 20 07:23:02 hobo kernel:  drm
May 20 07:23:02 hobo kernel:  video
May 20 07:23:02 hobo kernel:  i2c_i801
May 20 07:23:02 hobo kernel:  i2c_algo_bit
May 20 07:23:02 hobo kernel:  i2c_core
May 20 07:23:02 hobo kernel:  lpc_ich
May 20 07:23:02 hobo kernel:  processor
May 20 07:23:02 hobo kernel:  ext4
May 20 07:23:02 hobo kernel:  crc16
May 20 07:23:02 hobo kernel:  mbcache
May 20 07:23:02 hobo kernel:  jbd2
May 20 07:23:02 hobo kernel:  sr_mod
May 20 07:23:02 hobo kernel:  cdrom
May 20 07:23:02 hobo kernel:  sd_mod
May 20 07:23:02 hobo kernel:  hid_generic
May 20 07:23:02 hobo kernel:  usbhid
May 20 07:23:02 hobo kernel:  hid
May 20 07:23:02 hobo kernel:  ahci
May 20 07:23:02 hobo kernel:  libahci
May 20 07:23:02 hobo kernel:  ehci_pci
May 20 07:23:02 hobo kernel:  libata
May 20 07:23:02 hobo kernel:  scsi_mod
May 20 07:23:02 hobo kernel:  ehci_hcd
May 20 07:23:02 hobo kernel:  xhci_hcd
May 20 07:23:02 hobo kernel:  usbcore
May 20 07:23:02 hobo kernel:  usb_common
May 20 07:23:02 hobo kernel: 
May 20 07:23:02 hobo kernel: CPU: 2 PID: 154 Comm: systemd-udevd Tainted: G        W    3.10.0-1-ARCH #1
May 20 07:23:02 hobo kernel: Hardware name: MSI MS-7808/B75MA-E33 (MS-7808), BIOS V1.1 07/30/2012
May 20 07:23:02 hobo kernel: task: ffff88021106dc20 ti: ffff880211b74000 task.ti: ffff880211b74000
May 20 07:23:02 hobo kernel: Console: switching 
May 20 07:23:02 hobo kernel: RIP: 0010:[<ffffffff81374452>] 
May 20 07:23:02 hobo kernel: to colour dummy device 80x25
May 20 07:23:02 hobo kernel:  [<ffffffff81374452>] cpufreq_governor_dbs+0x52/0x680
May 20 07:23:02 hobo kernel: RSP: 0018:ffff880211b75868  EFLAGS: 00010293
May 20 07:23:02 hobo kernel: RAX: 0000000000000024 RBX: 0000000000000000 RCX: 000000000000009f
May 20 07:23:02 hobo kernel: RDX: 0000000000009f9f RSI: 0000000000000000 RDI: 0000000000000009
May 20 07:23:02 hobo kernel: RBP: ffff880211b758d8 R08: ffffffff819fdf10 R09: ffffffff81a0d3ac
May 20 07:23:02 hobo kernel: R10: 0000000000070b98 R11: 0000000000000000 R12: ffff880211bc8a00
May 20 07:23:02 hobo kernel: R13: 0000000000000000 R14: 0000000000000002 R15: ffffffff81888260
May 20 07:23:02 hobo kernel: FS:  00007f5f71a66780(0000) GS:ffff88021e300000(0000) knlGS:0000000000000000
May 20 07:23:02 hobo kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
May 20 07:23:02 hobo kernel: CR2: 0000000000000000 CR3: 000000021277a000 CR4: 00000000001407e0
May 20 07:23:02 hobo kernel: DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
May 20 07:23:02 hobo kernel: DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
May 20 07:23:02 hobo kernel: Stack:
May 20 07:23:02 hobo kernel:  ffffffff814acc9e ffff880211b75888 ffffffffa02a0472 00000000fffffffe
May 20 07:23:02 hobo kernel:  ffff880211b758c0 ffffffff814b2fcc ffffffff81887ee0 0000000000000000
May 20 07:23:02 hobo kernel:  0000000000000002 ffff880211bc8a00 0000000000000002 0000000000000000
May 20 07:23:02 hobo kernel: Call Trace:
May 20 07:23:02 hobo kernel:  [<ffffffff814acc9e>] ? mutex_unlock+0xe/0x10
May 20 07:23:02 hobo kernel:  [<ffffffffa02a0472>] ? acpi_processor_ppc_notifier+0xa6/0xab [processor]
May 20 07:23:02 hobo kernel:  [<ffffffff814b2fcc>] ? notifier_call_chain+0x4c/0x70
May 20 07:23:02 hobo kernel:  [<ffffffff813733b7>] od_cpufreq_governor_dbs+0x17/0x20
May 20 07:23:02 hobo kernel:  [<ffffffff8137146f>] __cpufreq_governor+0x4f/0x120
May 20 07:23:02 hobo kernel:  [<ffffffff81371689>] __cpufreq_set_policy+0x149/0x2c0
May 20 07:23:02 hobo kernel:  [<ffffffff81372e73>] cpufreq_update_policy+0xe3/0x180
May 20 07:23:02 hobo kernel:  [<ffffffff81372f10>] ? cpufreq_update_policy+0x180/0x180
May 20 07:23:02 hobo kernel:  [<ffffffffa029f68c>] cpufreq_set_cur_state.part.3+0x8a/0x93 [processor]
May 20 07:23:02 hobo kernel:  [<ffffffffa029f7a2>] processor_set_cur_state+0xa1/0xdb [processor]
May 20 07:23:02 hobo kernel:  [<ffffffff8136cb05>] thermal_cdev_update+0x95/0xb0
May 20 07:23:02 hobo kernel:  [<ffffffff8136ebe9>] step_wise_throttle+0x59/0x90
May 20 07:23:02 hobo kernel:  [<ffffffff8136d6c8>] handle_thermal_trip+0x48/0x140
May 20 07:23:02 hobo kernel:  [<ffffffff8136d835>] thermal_zone_device_update+0x75/0xb0
May 20 07:23:02 hobo kernel:  [<ffffffff8136e347>] thermal_zone_device_register+0x8b7/0xac0
May 20 07:23:02 hobo kernel:  [<ffffffffa03c117c>] acpi_thermal_add+0x27e/0x442 [thermal]
May 20 07:23:02 hobo kernel:  [<ffffffff812bf461>] acpi_device_probe+0x4e/0x10f
May 20 07:23:02 hobo kernel:  [<ffffffff8132ce57>] driver_probe_device+0x87/0x3a0
May 20 07:23:02 hobo kernel:  [<ffffffff8132d243>] __driver_attach+0x93/0xa0
May 20 07:23:02 hobo kernel:  [<ffffffff8132d1b0>] ? __device_attach+0x40/0x40
May 20 07:23:02 hobo kernel:  [<ffffffff8132ae13>] bus_for_each_dev+0x63/0xa0
May 20 07:23:02 hobo kernel:  [<ffffffff8132c8ce>] driver_attach+0x1e/0x20
May 20 07:23:02 hobo kernel:  [<ffffffff8132c418>] bus_add_driver+0x1e8/0x2a0
May 20 07:23:02 hobo kernel:  [<ffffffffa03c4000>] ? 0xffffffffa03c3fff
May 20 07:23:02 hobo kernel:  [<ffffffff8132d8b1>] driver_register+0x71/0x150
May 20 07:23:02 hobo kernel:  [<ffffffffa03c4000>] ? 0xffffffffa03c3fff
May 20 07:23:02 hobo kernel:  [<ffffffff812bf9dc>] acpi_bus_register_driver+0x3b/0x43
May 20 07:23:02 hobo kernel:  [<ffffffffa03c403a>] acpi_thermal_init+0x3a/0x42 [thermal]
May 20 07:23:02 hobo kernel:  [<ffffffff810002aa>] do_one_initcall+0xda/0x190
May 20 07:23:02 hobo kernel:  [<ffffffff810a76a7>] load_module+0x1b17/0x2620
May 20 07:23:02 hobo kernel:  [<ffffffff81272920>] ? ddebug_proc_write+0xf0/0xf0
May 20 07:23:02 hobo kernel:  [<ffffffff810a8252>] SyS_init_module+0xa2/0xf0
May 20 07:23:02 hobo kernel:  [<ffffffff814b6e06>] system_call_fastpath+0x1a/0x1f
May 20 07:23:02 hobo kernel: Code: ff 84 c0 0f 84 40 02 00 00 49 8b 5c 24 40 48 85 db 0f 84 c5 05 00 00 41 83 fe 04 0f 84 c0 02 00 00 41 83 fe 05 0f 84 2e 02 00 00 <48> 8b 03 44 89 ef ff 50 20 48 89 45 c0 48 8b 03 83 38 01 0f 84 
May 20 07:23:02 hobo kernel: RIP  [<ffffffff81374452>] cpufreq_governor_dbs+0x52/0x680
May 20 07:23:02 hobo kernel:  RSP <ffff880211b75868>
May 20 07:23:02 hobo kernel: CR2: 0000000000000000
May 20 07:23:02 hobo kernel: ---[ end trace fbf03bdeb06726ef ]---
May 20 07:23:02 hobo kernel: i915 0000:00:02.0: setting latency timer to 64
May 20 07:23:02 hobo systemd-sysctl[169]: Duplicate assignment of kernel/sysrq in file '/usr/lib/sysctl.d/50-default.conf', ignoring.
May 20 07:23:02 hobo systemd[1]: Found device RTL8111/8168 PCI Express Gigabit Ethernet controller.
May 20 07:23:02 hobo systemd-udevd[148]: renamed network interface eth0 to enp2s0
May 20 07:23:02 hobo systemd-sysctl[170]: Duplicate assignment of kernel/sysrq in file '/usr/lib/sysctl.d/50-default.conf', ignoring.
May 20 07:23:02 hobo kernel: i915 0000:00:02.0: irq 44 for MSI/MSI-X
May 20 07:23:02 hobo kernel: [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
May 20 07:23:02 hobo kernel: [drm] Driver supports precise vblank timestamp query.
May 20 07:23:02 hobo kernel: vgaarb: device changed decodes: PCI:0000:00:02.0,olddecodes=io+mem,decodes=io+mem:owns=io+mem
May 20 07:23:02 hobo kernel: fbcon: inteldrmfb (fb0) is primary device
May 20 07:23:02 hobo kernel: Console: switching to colour frame buffer device 240x67
May 20 07:23:02 hobo kernel: i915 0000:00:02.0: fb0: inteldrmfb frame buffer device
May 20 07:23:02 hobo kernel: i915 0000:00:02.0: registered panic notifier
May 20 07:23:02 hobo kernel: acpi device:4a: registered as cooling_device4
May 20 07:23:02 hobo kernel: ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
May 20 07:23:02 hobo kernel: input: Video Bus as /devices/LNXSYSTM:00/device:00/PNP0A08:00/LNXVIDEO:00/input/input5
May 20 07:23:02 hobo kernel: [drm] Initialized i915 1.6.0 20080730 for 0000:00:02.0 on minor 0
May 20 07:23:02 hobo kernel: snd_hda_intel 0000:00:1b.0: irq 45 for MSI/MSI-X
May 20 07:23:02 hobo systemd[1]: Found device ST31000524AS.
May 20 07:23:02 hobo systemd[1]: Starting File System Check on /dev/disk/by-uuid/2ff31edf-e1c3-43a1-95d8-c43627dce06b...
May 20 07:23:02 hobo systemd[1]: Found device ST31000524AS.
May 20 07:23:02 hobo systemd[1]: Activating swap /dev/disk/by-uuid/0bd636af-cec2-425d-babe-03aa4efca3ee...
May 20 07:23:03 hobo kernel: input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1b.0/sound/card0/input6
May 20 07:23:03 hobo kernel: input: HDA Intel PCH Front Headphone as /devices/pci0000:00/0000:00:1b.0/sound/card0/input7
May 20 07:23:03 hobo kernel: input: HDA Intel PCH Line Out as /devices/pci0000:00/0000:00:1b.0/sound/card0/input8
May 20 07:23:03 hobo kernel: input: HDA Intel PCH Line as /devices/pci0000:00/0000:00:1b.0/sound/card0/input9
May 20 07:23:03 hobo kernel: input: HDA Intel PCH Rear Mic as /devices/pci0000:00/0000:00:1b.0/sound/card0/input10
May 20 07:23:03 hobo kernel: input: HDA Intel PCH Front Mic as /devices/pci0000:00/0000:00:1b.0/sound/card0/input11
May 20 07:23:03 hobo kernel: Adding 8388604k swap on /dev/sda4.  Priority:-1 extents:1 across:8388604k FS
May 20 07:23:03 hobo systemd[1]: Starting Sound Card.
May 20 07:23:03 hobo systemd[1]: Reached target Sound Card.
May 20 07:23:03 hobo systemd[1]: Activated swap /dev/disk/by-uuid/0bd636af-cec2-425d-babe-03aa4efca3ee.
May 20 07:23:03 hobo systemd[1]: Starting Swap.
May 20 07:23:03 hobo systemd[1]: Reached target Swap.
May 20 07:23:03 hobo kernel: [drm] Enabling RC6 states: RC6 on, RC6p on, RC6pp off
May 20 07:23:03 hobo kernel: xor: automatically using best checksumming function:
May 20 07:23:03 hobo kernel:    avx       : 15379.200 MB/sec
May 20 07:23:03 hobo kernel: raid6: sse2x1    7638 MB/s
May 20 07:23:03 hobo kernel: raid6: sse2x2   11551 MB/s
May 20 07:23:04 hobo kernel: raid6: sse2x4    6291 MB/s
May 20 07:23:04 hobo kernel: raid6: using algorithm sse2x2 (11551 MB/s)
May 20 07:23:04 hobo kernel: raid6: using ssse3x2 recovery algorithm
May 20 07:23:04 hobo systemd-fsck[197]: /dev/sda3: clean, 1063882/49152000 files, 138367433/196608000 blocks
May 20 07:23:04 hobo systemd[1]: Started File System Check on /dev/disk/by-uuid/2ff31edf-e1c3-43a1-95d8-c43627dce06b.
May 20 07:23:04 hobo systemd[1]: Mounting /home...
May 20 07:23:04 hobo kernel: Btrfs loaded
May 20 07:23:04 hobo kernel: device fsid 13b0f10a-0df0-4e3a-966e-fbc361d1382a devid 1 transid 112 /dev/sda10
May 20 07:23:04 hobo systemd[1]: Mounted /home.
May 20 07:23:04 hobo systemd[1]: Starting Local File Systems.
May 20 07:23:04 hobo systemd[1]: Reached target Local File Systems.
May 20 07:23:04 hobo systemd[1]: Starting Trigger Flushing of Journal to Persistent Storage...
May 20 07:23:04 hobo systemd[1]: Starting Recreate Volatile Files and Directories...
May 20 07:23:04 hobo kernel: EXT4-fs (sda3): mounted filesystem with ordered data mode. Opts: data=ordered
May 20 07:23:04 hobo systemd[1]: Started Recreate Volatile Files and Directories.
May 20 07:23:04 hobo systemd[1]: Starting Update UTMP about System Reboot/Shutdown...
May 20 07:23:04 hobo systemd-journal[129]: Allowing system journal files to grow to 4.0G.
May 20 07:23:04 hobo systemd[1]: Started Trigger Flushing of Journal to Persistent Storage.
May 20 07:23:04 hobo systemd[1]: Started Update UTMP about System Reboot/Shutdown.
May 20 07:23:04 hobo systemd[1]: Starting System Initialization.
May 20 07:23:04 hobo systemd[1]: Reached target System Initialization.
May 20 07:23:04 hobo systemd[1]: Starting Daily Cleanup of Temporary Directories.
May 20 07:23:04 hobo systemd[1]: Started Daily Cleanup of Temporary Directories.
May 20 07:23:04 hobo systemd[1]: Starting Timers.
May 20 07:23:04 hobo systemd[1]: Reached target Timers.
May 20 07:23:04 hobo systemd[1]: Started Manage Sound Card State (restore and store).
May 20 07:23:04 hobo systemd[1]: Starting Restore Sound Card State...
May 20 07:23:04 hobo systemd[1]: Starting D-Bus System Message Bus Socket.
May 20 07:23:04 hobo dhcpcd[219]: version 5.6.8 starting
May 20 07:23:05 hobo dhcpcd[219]: enp2s0: waiting for carrier
May 20 07:23:06 hobo kernel: r8169 0000:02:00.0 enp2s0: link down
May 20 07:23:06 hobo kernel: r8169 0000:02:00.0 enp2s0: link down
May 20 07:23:06 hobo kernel: IPv6: ADDRCONF(NETDEV_UP): enp2s0: link is not ready
May 20 07:23:06 hobo systemd-logind[220]: Watching system buttons on /dev/input/event3 (Power Button)
May 20 07:23:06 hobo systemd-logind[220]: Watching system buttons on /dev/input/event5 (Video Bus)
May 20 07:23:06 hobo systemd-logind[220]: Watching system buttons on /dev/input/event2 (Power Button)
May 20 07:23:06 hobo kernel: r8169 0000:02:00.0 enp2s0: link up
May 20 07:23:06 hobo kernel: IPv6: ADDRCONF(NETDEV_CHANGE): enp2s0: link becomes ready
May 20 07:23:06 hobo dhcpcd[219]: enp2s0: carrier acquired
May 20 07:23:06 hobo dhcpcd[219]: enp2s0: sending IPv6 Router Solicitation
May 20 07:23:06 hobo dhcpcd[219]: enp2s0: sendmsg: Cannot assign requested address
May 20 07:23:06 hobo dhcpcd[219]: enp2s0: rebinding lease of 131.111.218.166
May 20 07:23:10 hobo dhcpcd[219]: enp2s0: sending IPv6 Router Solicitation
May 20 07:23:11 hobo dhcpcd[219]: enp2s0: broadcasting for a lease
May 20 07:23:14 hobo login[224]: pam_unix(login:session): session opened for user ross by LOGIN(uid=0)
May 20 07:23:14 hobo systemd-logind[220]: New session 1 of user ross.
May 20 07:23:14 hobo login[224]: LOGIN ON tty1 BY ross
May 20 07:23:14 hobo dhcpcd[219]: enp2s0: sending IPv6 Router Solicitation
May 20 07:23:14 hobo dhcpcd[219]: enp2s0: Router Advertisement from fe80::5:73ff:fea0:501
May 20 07:23:14 hobo dhcpcd[219]: enp2s0: did not fork due to an absent RDNSS option in the RA
May 20 07:23:16 hobo dhcpcd[219]: enp2s0: offered 131.111.218.166 from 131.111.242.253
May 20 07:23:16 hobo dhcpcd[219]: enp2s0: ignoring offer of 131.111.218.166 from 131.111.242.8
May 20 07:23:16 hobo dhcpcd[219]: enp2s0: acknowledged 131.111.218.166 from 131.111.242.8
May 20 07:23:16 hobo dhcpcd[219]: enp2s0: checking for 131.111.218.166
May 20 07:23:21 hobo dhcpcd[219]: enp2s0: leased 131.111.218.166 for 216000 seconds
May 20 07:23:21 hobo dhcpcd[219]: forked to background, child pid 277
May 20 07:23:21 hobo systemd[1]: Started dhcpcd on enp2s0.
May 20 07:23:21 hobo systemd[1]: Starting Multi-User System.
May 20 07:23:21 hobo systemd[1]: Reached target Multi-User System.
May 20 07:23:21 hobo systemd[1]: Starting Network.
May 20 07:23:21 hobo systemd[1]: Reached target Network.
May 20 07:23:21 hobo systemd[1]: Startup finished in 4.691s (kernel) + 24.896s (userspace) = 29.588s.
May 20 07:23:25 hobo sudo[278]: ross : TTY=tty1 ; PWD=/home/ross ; USER=root ; COMMAND=/usr/bin/pacman -Syu
May 20 07:23:25 hobo sudo[278]: pam_unix(sudo:session): session opened for user root by ross(uid=0)
May 20 07:23:32 hobo systemd-udevd[143]: worker [146] /devices/LNXSYSTM:00/device:51/LNXTHERM:01 timeout; kill it
May 20 07:23:32 hobo systemd-udevd[143]: seq 1362 '/devices/LNXSYSTM:00/device:51/LNXTHERM:01' killed
May 20 07:23:32 hobo systemd-udevd[143]: worker [152] /devices/LNXSYSTM:00/device:51/PNP0C0B:04 timeout; kill it
May 20 07:23:32 hobo systemd-udevd[143]: seq 1367 '/devices/LNXSYSTM:00/device:51/PNP0C0B:04' killed
May 20 07:23:32 hobo systemd-udevd[143]: worker [157] /devices/LNXSYSTM:00/device:51/PNP0C0B:00 timeout; kill it
May 20 07:23:32 hobo systemd-udevd[143]: seq 1363 '/devices/LNXSYSTM:00/device:51/PNP0C0B:00' killed
May 20 07:23:32 hobo systemd-udevd[143]: worker [159] /devices/LNXSYSTM:00/device:51/PNP0C0B:01 timeout; kill it
May 20 07:23:32 hobo systemd-udevd[143]: seq 1364 '/devices/LNXSYSTM:00/device:51/PNP0C0B:01' killed
May 20 07:23:32 hobo systemd-udevd[143]: worker [160] /devices/LNXSYSTM:00/device:51/PNP0C0B:02 timeout; kill it
May 20 07:23:32 hobo systemd-udevd[143]: seq 1365 '/devices/LNXSYSTM:00/device:51/PNP0C0B:02' killed
May 20 07:23:32 hobo systemd-udevd[143]: worker [161] /devices/LNXSYSTM:00/device:51/PNP0C0B:03 timeout; kill it
May 20 07:23:32 hobo systemd-udevd[143]: seq 1366 '/devices/LNXSYSTM:00/device:51/PNP0C0B:03' killed
May 20 07:23:32 hobo systemd-udevd[143]: worker [146] terminated by signal 9 (Killed)
May 20 07:23:32 hobo systemd-udevd[143]: worker [159] terminated by signal 9 (Killed)
May 20 07:23:32 hobo systemd-udevd[143]: worker [152] terminated by signal 9 (Killed)
May 20 07:23:32 hobo systemd-udevd[143]: worker [157] terminated by signal 9 (Killed)
May 20 07:23:32 hobo systemd-udevd[143]: worker [160] terminated by signal 9 (Killed)
May 20 07:23:36 hobo sudo[278]: pam_unix(sudo:session): session closed for user root
May 20 07:23:53 hobo sudo[297]: ross : TTY=tty1 ; PWD=/home/ross ; USER=root ; COMMAND=/usr/bin/journalctl -a -n 10000
May 20 07:23:53 hobo sudo[297]: pam_unix(sudo:session): session opened for user root by ross(uid=0)
May 20 07:23:54 hobo sudo[297]: pam_unix(sudo:session): session closed for user root
May 20 07:23:55 hobo sudo[311]: ross : TTY=tty1 ; PWD=/home/ross ; USER=root ; COMMAND=/usr/bin/journalctl -a -n 1000
May 20 07:23:55 hobo sudo[311]: pam_unix(sudo:session): session opened for user root by ross(uid=0)
May 20 07:25:19 hobo sudo[311]: pam_unix(sudo:session): session closed for user root

--bp/iNruPH9dso1Pn--
