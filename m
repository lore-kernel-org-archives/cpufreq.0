From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq thoughts.txt,1.10,1.11
Date: Thu, 26 Jun 2003 14:49:38 +0100
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <E19VX86-00045d-VT@flint.arm.linux.org.uk>
Return-path: <cpufreq-admin@www.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq
In directory flint:/tmp/cvs-serv15718

Modified Files:
	thoughts.txt 
Log Message:
More thoughts from Dominik.


Index: thoughts.txt
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/thoughts.txt,v
retrieving revision 1.10
retrieving revision 1.11
diff -u -r1.10 -r1.11
--- thoughts.txt	21 Sep 2002 09:05:29 -0000	1.10
+++ thoughts.txt	26 Jun 2003 13:49:36 -0000	1.11
@@ -1,51 +1,27 @@
 A scratchpad for random thoughts re spudstop.
 --------------------------------------------------------------
 
+Note to users:
+If none of the speedstep drivers work, you may want to test whether
+the ACPI P-States driver works.
+
+--------------------------------------------------------------
+
 ICH2-M and ICH3-M chipsets (mobile Camino 2 and 3) are fully supported
-by CPUFreq speedstep.c - a mostly documented interface (a read/write
+by CPUFreq's speedstep-ich.c - a mostly documented interface (a read/write
 register in the LPC bridge function of the chipset) allows for
 switching and reading state.
 
 --------------------------------------------------------------
 
-Some notes on the detection whether a Coppermine PIII is SpeedStep
-capable:
-
-higher 32 bits of MSR 0x17 (MSR 0x2a doesn't tell us):
-
-         	 	  60 				     32
-	 	           x    z zzzy yy                     x
-mobile P3 coppermines:
-high speed settings:
-600 MHz - 0x5a540000 -> 0101 1010 0101 0100 0000 0000 0000 0000
-850 MHz - 0x33550000 -> 0011 0011 0101 0101 0000 0000 0000 0000
-750 MHz - 0x6b560000 -> 0011 1011 0101 0110 0000 0000 0000 0000
-low speed settings:
-500 MHz - 0x02540000 -> 0000 0010 0101 0100 0000 0000 0000 0000
-700 MHz - 0x4b550000 -> 0100 1011 0101 0101 0000 0000 0000 0000
-
-non-mobile P3 coppermines (first has 100MHz FSB, second 133 MHz)
-700 MHz - 0x4a400000 -> 0100 1010 0100 0000 0000 0000 0000 0000
-850 MHz - 0x79530000 -> 0111 1001 0101 0011 0000 0000 0000 0000
-
-bit 60 (x)	     : "Clock Frequency Ratio read" (according to 
-		       an Intel doc). But what does this mean?
-bits 53-56 (z)	     : L2 Cache latency read
-bits 50-52 (y)	     : Processor Flag / Platform ID
+Mobile Pentium-M (a.k.a. "Banias", part of "Centrino") is fully
+supported by CPUFreq's speedstep-centrino.c, but that driver is not
+vendor-approved.
 
 --------------------------------------------------------------
 
-On some chipsets, and certain BIOSes, it might be possible to use the
-"0xB2 APM interface" reverse engineered by Martin Malik
-<martin.malik@siemens.at>. You can find an user-space interface
-developed by Marc A. Lehmann <pcg@goof.com> at
-http://www.goof.com/pcg/marc/speedstep.html
-
-If you find a chipset / BIOS that works with his implementation but
-not the CPUFreq interface, please let me know. (Dominik Brodowski,
-<linux@brodo.de>)
-
---------------------------------------------------------------
+There is an ongoing progress to support PIIX4 chipsets. See
+http://www.poupinou.org/cpufreq/ for details. 
 
 Intel PIIX4 (BX/MX chipsets) support still has to be 
 reverse-engineered as Intel continues to withhold the documentation 
@@ -59,29 +35,18 @@
 transitions. An entry signal called GPO (LO/HI#) [p. 25] or G_LO_HI# 
 [p.26], pin "14" [p.50] decides which frequency to select. 
 
-Before a transition is called, CPU_LCK and CPU_SEL [e.g. to be found
-at config register 0x48 of the power management module of the piix4
-chipset] has to be set to 256 us, and after the transition it should
-be set again to the default value, 100 us.
-
-The deciding question on 440BX/MX chipsets now seems to be where the
-GPO (LO/HI#) signal is connected to. Intel's document 2730401.pdf
-helps with that, too: According to the 400MX Reference Platform
-described in that document, it is connected to IO_GPIO13 - the 13th
-General Purpose Output signal. [p.50]; it is further mentioned on p.72:
-"IO_GPIO13 currently used for Intel SpeedStep Technology". 
-
-Of course, I've tried switching IO_GPIO13 on my 440BX/AGPSet based
-Clevo/Gericom NB3420 notebook. Unfortunately, the speed does not
-change; the only GPO bit that changes is GPO#0, but switching that
-does not change speed either.
-
-So it seems that every motherboard designer was able to connect the
-GPO (LO/HI#) signal to a GPO (or even Embedded Controller?) pin of his
-choice.
+--------------------------------------------------------------
+
+On some chipsets, and certain BIOSes, it might be possible to use the
+"0xB2 APM interface" reverse engineered by Martin Malik
+<martin.malik@siemens.at>. You can find an user-space interface
+developed by Marc A. Lehmann <pcg@goof.com> at
+http://www.goof.com/pcg/marc/speedstep.html
 
 --------------------------------------------------------------
 
 I couldn't find any useful information on other vendor 
 chipsets (VIA etc.) publicly available. Maybe I'll ask VIA sometimes,
 but I really don't want to sign a NDA. 
+
+--------------------------------------------------------------
