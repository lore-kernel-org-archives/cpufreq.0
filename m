From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Tue, 19 Oct 2010 14:13:13 GMT
Message-ID: <201010191413.o9JEDDdf003439@demeter2.kernel.org>
References: <bug-19702-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-19702-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19702





--- Comment #25 from Peter Ganzhorn <peter.ganzhorn@googlemail.com>  2010-10-19 14:13:07 ---
Here's what I have in

# ls /sys/firmware/acpi/tables/
APIC  DSDT     FACP  HPET  SLIC   SSDT2  SSDT4    SSDT6  SSDT8
BOOT  dynamic  FACS  MCFG  SSDT1  SSDT3  SSDT5    SSDT7  TCPA

I guess you want the SSDT* . Do you need any other files from there?

Further I applied your two patches to 2.6.36-rc8 and without the boot parameter
I'm getting:

# cat /sys/devices/system/cpu/cpu*/cpufreq/shared_type
2
2

With processor.disable_hw_coord=1 I'm getting the exact same thing:


# uname -rs
Linux 2.6.36-rc8-pgzh
# dmesg | grep hw_coord
Kernel command line: BOOT_IMAGE=/vmlinuz.exp root=/dev/sda3 ro
processor.disable_hw_coord=1
centauri:/home/pgzh# cat /sys/devices/system/cpu/cpu*/cpufreq/shared_type
2
2

There's no change in CPUFREQ behavior as well - I'm stuck with the lowest freq
unless I lower up_threshold.

In the CPUFREQ drivers section in kconfig I have the following set:
# CONFIG_X86_PCC_CPUFREQ is not set
Should this be enabled?
I only got the ACPI driver enabled right now. (CONFIG_X86_ACPI_CPUFREQ=m)

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
