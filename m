From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCHSET] 0/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Wed, 22 Oct 2003 11:21:22 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB6007793C@scsmsx403.sc.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Mukesh Rajan <megabyte1024@hotmail.com>
Cc: linux-acpilinux-acpi@intel.com, cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org

=20
Hi,
=20
I do not have any performance numbers taken from actual probes.=20
We have seen in our testing that the the frequency does change based on
the cpu usage.
For example, on a Centrino system,=20
- frequency will be lowest when system is idle=20
- frequency will be somewhere in the mid-range when you run single app
like mp3/mpeg player
- frequency will be maximum when you run multiple apps=20
And with the kind of power savings that comes with these frequency
changes, this behaviour=20
results in  longer battery life. However, as yet I do not have any
numbers to quantify this gain,=20
mainly because I do not have any setup where I can measure actual power.
=20
Thanks,
-Venkatesh =20
=20

	-----Original Message-----
	From: Mukesh Rajan [mailto:megabyte1024@hotmail.com]=20
	Sent: Tuesday, October 21, 2003 4:18 PM
	To: Pallipadi, Venkatesh
	Cc: cpufreq@www.linux.org.uk; linux-kernel@vger.kernel.org;
linux-acpilinux-acpi@intel.com
	Subject: [PATCHSET] 0/3 Dynamic cpufreq governor and updates to
ACPI P-state driver
=09
=09
	Hii,

	I was wondering if you had any numbers (physical measurements)
proving the same. Over an year ago, I had implemented the same idea on a
Compaq IPAQ (Strong ARM based running ARM Linux). I initially had to fix
the CPU freq code which was broken to get everything working right. But
after all the trouble, with actual probes (NI-DAQ board doing voltage
sampling et al) I measured very little savings in power at all. I
attributed those observations to questionable load average calculations
and very small power savings margin and simply moved on.

	~ Mukesh=20

	(Please cc: as I am not in list)

	Hi,

	Most of the latest CPUs (laptop CPUs in particular) have feature


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


  _____ =20

	Surf and talk on the phone at the same time with broadband
Internet access. Get high-speed for as low as $29.95/month.*=20
	<http://g.msn.com/8HMAENUS/2731??PS=3D> *Depending on the local
service providers in your area.=20
