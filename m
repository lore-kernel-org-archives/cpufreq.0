From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: [PATCHSET] 0/3 Dynamic cpufreq governor and updates to ACPI P-state
	driver
Date: Mon, 20 Oct 2003 19:56:07 -0700
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB60077911@scsmsx403.sc.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org, linux-acpi <linux-acpi@intel.com>
Cc: "Mallick, Asit K" <asit.k.mallick@intel.com>, "Nakajima,
	Jun" <jun.nakajima@intel.com>, Dominik Brodowski <linux@brodo.de>


Hi,

Most of the latest CPUs (laptop CPUs in particular) have feature=20
which enable very low latency P-state transitions=20
(like Enhanced Speedstep Technology-EST). Using this feature,=20
we can have a lightweight in kernel cpufreq governor,=20
to vary CPU frequency depending on the CPU usage. The=20
advantage being low power consumption and also cooler laptops.

Another related change is enhancing the current ACPI P-state=20
driver to handle:
EST (and MSR based P-state transitions), make the driver SMP=20
aware and introduce HT coordination in the driver (HT siblings=20
share the same CPU frequency).

The patches that follow this mail addresses the above issues.=20
They are against 2.6-test7 kernel. Many thanks to Dominik for=20
his comments and suggestions.

The patches will work on all laptops with EST technology=20
(Centrino) and also on any other system that supports low=20
latency frequency change.=20

Reviews/testing of patches are most welcome.

Thanks,
-Venkatesh


Patches are split as follows:

Patch 1/3: Changes to ACPI P-state driver, to handle MSR=20
based transitions frequency transitions and make the driver=20
SMP aware.

Patch 2/3: Introduce HT-synchronization in the ACPI P-state=20
Driver, to take care of shared CPU frequency between HT siblings.

Patch 3/3: New dynamic cpufreq driver (called=20
DemandBasedSwitch driver), which periodically monitors CPU=20
usage and changes the CPU frequency based on the demand.
