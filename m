From: jorgen@greven.dk
Subject: Power mgmt / CPUFREQ on Via C7 (Esther)
Date: Thu, 4 Jan 2007 11:06:20 +0100 (CET)
Message-ID: <4324.193.3.142.121.1167905180.squirrel@www.jgnet.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

>On Wednesday 03 January 2007 05:22, jorgen at greven.dk wrote:
>> >On Tue, Jan 02, 2007 at 11:16:49PM +0100, jorgen at greven.dk wrote:
>>
>> > > # dmesg
>> > > acpi_cpufreq: disagrees about version of symbol
>> acpi_processor_notify_smm acpi_cpufreq: Unknown symbol
>> acpi_processor_notify_smm
>
>acpi_processor_notify_smm should get built into the processor module --
>assuming CONFIG_ACPI and CONFIG_CPU_FREQ are enabled.
>
>did you do a "make oldconfig" before building?
>what do you see running
>grep ACPI .config
>grep CPU_FREQ .config
>
>-Len

Yes, I have done make oldconfig.
Here is output from lsmod, minus some irelevant entries:
# lsmod
Module                  Size  Used by
autofs4                20996  0
w83627hf               23712  0
hwmon_vid               3200  1 w83627hf
hwmon                   3844  1 w83627hf
eeprom                  7712  0
i2c_isa                 5760  1 w83627hf
dm_mirror              23060  0
dm_mod                 57420  1 dm_mirror
button                  8336  0
battery                10372  0
ac                      5636  0
uhci_hcd               23444  0
ehci_hcd               31000  0
i2c_viapro              9116  0
i2c_core               21248  4 w83627hf,eeprom,i2c_isa,i2c_viapro
sata_via               10244  0
libata                102820  1 sata_via
sd_mod                 20480  0
scsi_mod              136908  2 libata,sd_mod

The acpi_cpufreq module is build and I beleave that the correct options
are enabled:

# grep ACPI .config
CONFIG_ACPI=y
CONFIG_ACPI_SLEEP=y
CONFIG_ACPI_SLEEP_PROC_FS=y
# CONFIG_ACPI_SLEEP_PROC_SLEEP is not set
CONFIG_ACPI_AC=m
CONFIG_ACPI_BATTERY=m
CONFIG_ACPI_BUTTON=m
CONFIG_ACPI_FAN=y
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_THERMAL=y
CONFIG_ACPI_ASUS=m
# CONFIG_ACPI_IBM is not set
CONFIG_ACPI_TOSHIBA=m
CONFIG_ACPI_BLACKLIST_YEAR=2001
CONFIG_ACPI_EC=y
CONFIG_ACPI_POWER=y
CONFIG_ACPI_SYSTEM=y
# CONFIG_ACPI_CONTAINER is not set
# CONFIG_ACPI_SBS is not set
CONFIG_X86_ACPI_CPUFREQ=m
CONFIG_X86_POWERNOW_K7_ACPI=y
CONFIG_X86_POWERNOW_K8_ACPI=y
CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI=y
CONFIG_X86_ACPI_CPUFREQ_PROC_INTF=y
CONFIG_HOTPLUG_PCI_ACPI=m
CONFIG_HOTPLUG_PCI_ACPI_IBM=m
CONFIG_PNPACPI=y

# grep CPU_FREQ .config
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_TABLE=y
CONFIG_CPU_FREQ_STAT=y
CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=m
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=m
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m

Sorry for the long lists, but U ask for them.

Brgds Jorgen
