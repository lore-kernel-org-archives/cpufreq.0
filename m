From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6034] powernow-k8 fails to load on AMD Mobile Sempron 3000+
	system
Date: Fri, 10 Feb 2006 22:34:45 -0800
Message-ID: <200602110634.k1B6Yjga018163@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=6034





------- Additional Comments From e_val@inbox.ru  2006-02-10 22:34 -------
Yep, this really seems to be BIOS bug - it's not working on earlier kernels (I
was pretty sure I saw it working). My notebook is from the local manufacturer so
I doubt it is well-known in US. Here is the excerpt from lshw output:

laptop
    description: Portable Computer
    product: Mission_A330
    vendor: MaxSelect
    version: 5a
    serial: N0009341
    width: 32 bits
    capabilities: smbios-2.3 dmi-2.3
    configuration: administrator_password=disabled boot=normal chassis=portable
power-on_password=disabled uuid=00000000-0000-0000-0000-0040D074E77B
  *-core
       description: Motherboard
       product: Mission_A330
       vendor: MaxSelect
       physical id: 0
       version: 5a
       serial: N0009341
     *-firmware
          description: BIOS
          vendor: Insyde Software
          physical id: 0
          version: R1.10 (04/20/2005)
          size: 88KB
          capacity: 448KB
          capabilities: isa pci pcmcia pnp apm upgrade shadowing cdboot
bootselect socketedrom edd int13floppynec int13floppy720 int13floppy2880
int5printscreen int9keyboard int14serial int17printer int10video acpi usb
ls120boot zipboot smartbattery netboot
     *-cpu
          description: CPU
          product: Mobile AMD Sempron(tm) Processor 3000+
          vendor: Advanced Micro Devices [AMD]
          physical id: 4
          bus info: cpu@0
          version: 15.12.2
          serial: Processor Serial Number
          slot: PGA758
          size: 1800MHz
          capacity: 1800MHz
          width: 32 bits
          clock: 200MHz
          capabilities: fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic
sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 syscall nx mmxext
fxsr_opt 3dnowext 3dnow pni

I'm sure that MaxSelect is not making motherboards by themselves but rather
license it somehow, but I don't know the original manufacturer name. The only
hint I have is the output from lshwd (Arch Linux specific utility):
 
Multimedia audio controller
  snd-via82xx     : VIA Technologies, Inc.|L7VTA v1.0 Motherboard (KT400-8235)

Maybe I have L7VTA motherboard from ECS? I'm not sure (the specs on the site are
different) and there are no signs for BIOS update at http://en.maxselect.ru

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
