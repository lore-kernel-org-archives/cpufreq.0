From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: cpufreq on Toshiba Portege M100 Laptop
Date: Mon, 16 Jul 2007 14:17:09 -0700
Message-ID: <653FFBB4508B9042B5D43DC9E18836F501249977@scsmsx415.amr.corp.intel.com>
References: <4696137A.1010701@nachtwindheim.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <4696137A.1010701@nachtwindheim.de>
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
Content-Type: text/plain; charset="us-ascii"
To: Henne <henne@nachtwindheim.de>, cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Henne
>Sent: Thursday, July 12, 2007 4:42 AM
>To: cpufreq@lists.linux.org.uk
>Subject: cpufreq on Toshiba Portege M100 Laptop
>
>Hello,
>this week I got a Toshiba Portege M100 Laptop. I installed=20
>Debian (sid) and everything was great.
>I could see the P-States on powertop, which were 600MHz - 1200=20
>MHz in 100MHz steps.
>Then I upgraded the firmware of the Laptop and then it happend:
>
>acpi-cpufreq: acpi_cpufreq_init
>acpi-cpufreq: acpi_cpufreq_early_init
>cpufreq-core: trying to register driver acpi-cpufreq
>cpufreq-core: adding CPU 0
>acpi-cpufreq: acpi_cpufreq_cpu_init
>acpi-cpufreq: No P-States 1
>cpufreq-core: initialization failed
>cpufreq-core: no CPU initialized for driver acpi-cpufreq
>cpufreq-core: unregistering CPU 0
>
>That 1 in the line after "No P-States" is the value of=20
>perf->state_count from acpi_cpufreq_cpu_init(),
>which I added to acpi-cpufreq to see whats wrong. I used the=20
>latest kernel-2.6.22-git2 via git.
>

Hmmm.
Looks like the new BIOS decided to take away the support for
Speedstep. Can you look into the BIOS setup menu and check
whether there are any options to enable speedstep.

Thanks,
Venki
