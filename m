From: realded@mail.ru
Subject: Re[2]: Intel Core2Quad Q6600 2,4 GHz Socket775 FSB1066
Date: Fri, 28 Sep 2007 10:37:17 +0400
Message-ID: <994125581.20070928103717@mail.ru>
References: <200709272259.18445.ederstefan@gmx.de>
	<46FC1E3E.6070200@redhat.com>
	<200709272333.14046.ederstefan@gmx.de>
	<46FC25C8.4020005@redhat.com>
Reply-To: realded@mail.ru
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <46FC25C8.4020005@redhat.com>
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
To: cpufreq@lists.linux.org.uk

Jarod> Stefan Eder wrote:
>> Am Donnerstag, 27. September 2007 23:18:54 schrieb Jarod Wilson:
>>> Stefan Eder wrote:
>>>> Hallo everyone,
>>>> ist there a chance for powersaving with the following CPU?
>>> Yes.
>>>
>>>> And if so, what are
>>>> the related modules to load?
>>> acpi-cpufreq for freq scaling support, cpufreq-ondemand for your
>>> governor (may be built-in though)
>> 
>> Hallo, tried this module on openSUSE 10.3 RC1:
>> 
>> modprobe acpi-cpufreq
>> FATAL: Error inserting acpi_cpufreq 
>> (/lib/modules/2.6.22.5-29-bigsmp/kernel/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.ko): 
>> No such device

Jarod> Boot with the added kernel param cpufreq.debug=7 and check dmesg after
Jarod> trying to load the module. Should say a bit more about what's going
Jarod> awry. It works fine under a Fedora 2.6.22.7 kernel, so I think your
Jarod> kernel should be fine, and I'm inclined to think its your BIOS at fault.

uname -a
Linux 2.6.22-gentoo-r5 #25 SMP ... i686 Intel(R) Core(TM)2 Quad
CPU Q6600 @ 2.40Ghz

Added cpufreq.debug=7
modprobe acpi-cpufreq
FATAL: Error inserting acpi_cpufreq
(.../acpi-cpufreq.ko):
No such device

dmesg | grep freq
conf cpufreq.debug=7
acpi-cpufreq: acpi_cpufreq_init
acpi-cpufreq: acpi_cpufreq_early_init
cpufreq-core: trying to register friver acpi-cpufreq
cpufreq-core: adding CPU 0
acpi-cpufreq: acpi_cpufreq_cpu_init
cpufreq-core: initialization failed
.... same for CPU1,CPU2,CPU3
cpufreq-core: unregistering CPU0,CPU1,CPU2,CPU3

modprobe centrino-speedstep
cpufreq-core: trying to register driver centrino
cpufreq-core: adding CPU0
speedstep-centrino: found unsupported CPU with Enhanced SpeedStep:
send /proc/cpuinfo to cpufreq@lists.linux.org.uk

Hardware: Intel DG33TL with latest BIOS.
