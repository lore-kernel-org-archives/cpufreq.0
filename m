From: bugme-daemon@osdl.org
Subject: [Bug 3600] New: Cpu recognization fails after upgrade from 2.6.7 to
	2.6.9
Date: Wed, 20 Oct 2004 07:13:07 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200410201413.i9KED718023481@fire-1.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugme.osdl.org/show_bug.cgi?id=3600

           Summary: Cpu recognization fails after upgrade from 2.6.7 to
                    2.6.9
    Kernel Version: 2.6.9
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: dbonomi@crema.unimi.it


Hardware Environment:
acer 1356 lmi (laptop) with AMD athlon-xp 2800+


Problem Description:
with linux 2.6.7 my processor is correctly recognized, this is the relative
kernel output

powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
powernow: FSB: 132.686 MHz
powernow: Found PSB header at c00f06f0
powernow: Table version: 0x12
powernow: Flags: 0x0 (Mobile voltage regulator)
powernow: Settling Time: 100 microseconds.
powernow: Has 8 PST tables. (Only dumping ones relevant to this CPU).
powernow: PST:3 (@c00f0746)
powernow:  cpuid: 0x7a0^Ifsb: 133^ImaxFID: 0x1a^Istartvid: 0x7
powernow:    FID: 0x0 (11.0x [1459MHz])^IVID: 0xe (1.300V)
powernow:    FID: 0x1 (11.5x [1525MHz])^IVID: 0xd (1.350V)
powernow:    FID: 0x2 (12.0x [1592MHz])^IVID: 0xc (1.400V)
powernow:    FID: 0x3 (12.5x [1658MHz])^IVID: 0xb (1.450V)
powernow:    FID: 0x14 (13.0x [1724MHz])^IVID: 0xa (1.500V)
powernow:    FID: 0x15 (13.5x [1791MHz])^IVID: 0x9 (1.550V)
powernow:    FID: 0x18 (15.0x [1990MHz])^IVID: 0x8 (1.600V)
powernow:    FID: 0x1a (16.0x [2122MHz])^IVID: 0x7 (1.650V)
powernow: SGTC: 13333
powernow: Minimum speed 1459 MHz. Maximum speed 2122 MHz.

with 2.6.9 is not 

powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
powernow: No PST tables match this cpuid (0x7a0)
powernow: This is indicative of a broken BIOS.
powernow: Trying ACPI perflib
powernow: Minimum speed 298 MHz. Maximum speed 796 MHz.

Kernel configuration (for frequency scaling) is equal for both

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_PROC_INTF=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_24_API=y
CONFIG_CPU_FREQ_TABLE=y

#
# CPUFreq processor drivers
#
CONFIG_X86_ACPI_CPUFREQ=y
CONFIG_X86_ACPI_CPUFREQ_PROC_INTF=y
# CONFIG_X86_POWERNOW_K6 is not set
CONFIG_X86_POWERNOW_K7=y
# CONFIG_X86_POWERNOW_K8 is not set
# CONFIG_X86_GX_SUSPMOD is not set
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
# CONFIG_X86_SPEEDSTEP_ICH is not set
# CONFIG_X86_SPEEDSTEP_SMI is not set
# CONFIG_X86_P4_CLOCKMOD is not set
# CONFIG_X86_LONGRUN is not set
# CONFIG_X86_LONGHAUL is not set


lspci output is

00:00.0 Host bridge: VIA Technologies, Inc. VT8378 [KM400] Chipset Host Bridge
00:01.0 PCI bridge: VIA Technologies, Inc. VT8235 PCI Bridge
00:07.0 CardBus bridge: Texas Instruments PCI1410 PC card Cardbus Controller
(rev 02)
00:08.0 FireWire (IEEE 1394): Texas Instruments TSB43AB21 IEEE-1394a-2000
Controller (PHY/Link)
00:09.0 Ethernet controller: Realtek Semiconductor Co., Ltd.: Unknown device
8180 (rev 20)
00:10.0 USB Controller: VIA Technologies, Inc. VT6202 [USB 2.0 controller] (rev 80)
00:10.1 USB Controller: VIA Technologies, Inc. VT6202 [USB 2.0 controller] (rev 80)
00:10.2 USB Controller: VIA Technologies, Inc. VT6202 [USB 2.0 controller] (rev 80)
00:10.3 USB Controller: VIA Technologies, Inc. USB 2.0 (rev 82)
00:11.0 ISA bridge: VIA Technologies, Inc. VT8235 ISA Bridge
00:11.1 IDE interface: VIA Technologies, Inc.
VT82C586A/B/VT82C686/A/B/VT823x/A/C/VT8235 PIPC Bus Master IDE (rev 06)
00:11.5 Multimedia audio controller: VIA Technologies, Inc. VT8233/A/8235/8237
AC97 Audio Controller (rev 50)
00:11.6 Communication controller: VIA Technologies, Inc. Intel 537 [AC97 Modem]
(rev 80)
00:12.0 Ethernet controller: VIA Technologies, Inc. VT6102 [Rhine-II] (rev 74)
01:00.0 VGA compatible controller: ATI Technologies Inc RV250 5c61 [Radeon
Mobility 9200 M9+] (rev 01)

Thanks
Daniele

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
