From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] 3/3 Dynamic cpufreq governor and updates to ACPIP-state
	driver
Date: Tue, 21 Oct 2003 10:41:30 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB6007791B@scsmsx403.sc.intel.com>
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
To: arjanv@redhat.com
Cc: cpufreq@www.linux.org.uk, "Nakajima, Jun" <jun.nakajima@intel.com>, linux-acpi <linux-acpi@intel.com>, "Mallick,
	Asit K" <asit.k.mallick@intel.com>, linux-kernel@vger.kernel.org, Dominik Brodowski <linux@brodo.de>



We can have a userspace governor and take decisions using
top, /proc/interrupts etc. But issue is mostly the rate
at which we want to monitor. In kernel governor can afford
to do more frequent checks and use the low latency P-state=20
change feature quite effectively.

The patch does take care of all kinds of loads, process or irq
as we look at the cpu idle time in kstat. However it waits until
scheduled work (schedule_work()) gets to run. As you say,=20
another advantage of having this in kernel is, kernel has=20
all the information to take such decisions quickly. At present,
The patch tries to keep this governor simple and cover the=20
common cases. However, once we have the infrastructure in place,
further optimizations with more advanced things can be done=20
based on actual performance data.

Thanks,
-Venkatesh

> -----Original Message-----
> From: Arjan van de Ven [mailto:arjanv@redhat.com]=20
> Sent: Tuesday, October 21, 2003 1:39 AM
> To: Pallipadi, Venkatesh
> Cc: cpufreq@www.linux.org.uk; linux-kernel@vger.kernel.org;=20
> linux-acpi; Mallick, Asit K; Nakajima, Jun; Dominik Brodowski
> Subject: Re: [PATCH] 3/3 Dynamic cpufreq governor and updates=20
> to ACPIP-state driver
>=20
>=20
> On Tue, 2003-10-21 at 04:56, Pallipadi, Venkatesh wrote:
> > Patch 3/3: New dynamic cpufreq driver (called=20
> > DemandBasedSwitch driver), which periodically monitors CPU=20
> > usage and changes the CPU frequency based on the demand.
>=20
>=20
> it's all nice code and such, but I still wonder why this can't be done
> by a userland policy daemon. The 2.6 kernel has the infrastructure to
> give very detailed information to userspace (eg top etc) about idle
> percentages...... I didn't see anything in this driver that=20
> couldn't be
> done from userspace.
>=20
> Note that I'm not totally against doing some of this in the kernel; I
> can well see the point of say, detecting an IRQ overload and based on
> that, go to max speed in the kernel because it's a situation where
> userspace doesn't even run; but the patch as is doesn't do any such
> advanced things...
>=20
