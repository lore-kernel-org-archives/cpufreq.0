From: Dominik Brodowski <linux@brodo.de>
Subject: Re: [PATCHSET] 0/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Tue, 21 Oct 2003 22:47:19 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20031021204719.GI26971@brodo.de>
References: <88056F38E9E48644A0F562A38C64FB60077911@scsmsx403.sc.intel.com>
	<yw1xoewb6lqx.fsf@kth.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <yw1xoewb6lqx.fsf@kth.se>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mru@kth.se>
Cc: cpufreq@www.linux.org.uk

On Tue, Oct 21, 2003 at 10:25:10AM +0200, M=E5ns Rullg=E5rd wrote:
> "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com> writes:
>=20
> > Most of the latest CPUs (laptop CPUs in particular) have feature=20
> > which enable very low latency P-state transitions=20
> > (like Enhanced Speedstep Technology-EST). Using this feature,=20
> > we can have a lightweight in kernel cpufreq governor,=20
> > to vary CPU frequency depending on the CPU usage. The=20
> > advantage being low power consumption and also cooler laptops.
>=20
> So, how does this work?  I'd like to be able to set minimum and
> maximum clock frequencies to allow

echo "..." > /sys/devices/system/cpu/0/cpufreq/scaling_min_speed
echo "..." > /sys/devices/system/cpu/0/cpufreq/scaling_max_speed

>, and CPU utilization thresholds at which to switch frequencies.

select the demandbased governor

echo "demandbased" > /sys/devices/system/cpu/0/cpufreq/scaling_governor

and wait for the inclusion of a sysfs interface to the demandbased govern=
or
which lets you override the current switching frequencies of 20% and 80%.

> Is that possible, or is it work yet to be done?=20

Almost done.

> Adjustable polling interval would also be nice.

Should also be adaptable by sysfs. This sysfs interface really will be a
very useful addition, but it's not top priority.
=20
	Dominik
