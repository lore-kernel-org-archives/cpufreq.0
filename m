From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6034] powernow-k8 fails to load on AMD Mobile Sempron 3000+
	system
Date: Fri, 10 Feb 2006 04:34:59 -0800
Message-ID: <200602101234.k1ACYxmX031634@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=6034





------- Additional Comments From never@e-kki.it  2006-02-10 04:34 -------
same problem here, but the message i receive is:

[root@spock ~]# modprobe powernow-k8
FATAL: Error inserting powernow_k8 (/lib/modules/2.6.15-ARCH/kernel/arch/i386/
kernel/cpu/cpufreq/powernow-k8.ko): No such device

and from dmsg :

powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.50.4)
powernow-k8: MP systems not supported by PSB BIOS structure

before kernel 2.6.15.* all worked ok.

this problem happens at HOME where i have (lshw) :
  *-core
       description: Motherboard
       product: K8V-X
       vendor: ASUSTeK Computer Inc.
       physical id: 0
       version: Rev 2.00
       serial: MB-1234567890
     *-firmware
          description: BIOS
          vendor: American Megatrends Inc.
          physical id: 0
          version: 1005.001 (10/09/2004)
          size: 64KB
          capacity: 448KB
          capabilities: isa pci pnp apm upgrade shadowing escd cdboot bootselect 
socketedrom edd int13floppy1200 int13floppy720 int13floppy28
80 int5printscreen int9keyboard int14serial int17printer int10video acpi usb agp 
ls120boot zipboot biosbootspecification

[root@spock ~]# cat /proc/acpi/processor/CPU1/info
processor id:            0
acpi id:                 1
bus mastering control:   no
power management:        no
throttling control:      no
limit interface:         no

at WORK, powernow work ok,same kernel, amd64 but with this lwhw:
  *-core
       description: Motherboard
       product: A8N-SLI Premium
       vendor: ASUSTeK Computer INC.
       physical id: 0
       version: 1.02
       serial: 123456789000
     *-firmware
          description: BIOS
          vendor: Phoenix Technologies, LTD
          physical id: 0
          version: ASUS A8N-SLI Premium ACPI BIOS Revision 1006 (06/30/2005)
          size: 128KB
          capacity: 448KB
          capabilities: pci pnp apm upgrade shadowing cdboot bootselect socketedrom 
edd int13floppy360 int13floppy1200 int13floppy720 int13fl
oppy2880 int5printscreen int9keyboard int14serial int17printer int10video acpi usb 
ls120boot zipboot biosbootspecification

[root@L0cutus ~]# cat /proc/acpi/processor/CPU0/info
processor id:            0
acpi id:                 0
bus mastering control:   yes
power management:        no
throttling control:      no
limit interface:         no


------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
