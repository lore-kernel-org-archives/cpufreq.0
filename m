From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCHSET] 0/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Tue, 21 Oct 2003 18:42:03 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB60077929@scsmsx403.sc.intel.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mru@kth.se>, linux-kernel@vger.kernel.org
Cc: cpufreq@www.linux.org.uk



> -----Original Message-----
> From: linux-kernel-owner@vger.kernel.org=20
> [mailto:linux-kernel-owner@vger.kernel.org] On Behalf Of M=E5ns =
Rullg=E5rd
>=20
> So, how does this work?  I'd like to be able to set minimum and
> maximum clock frequencies to allow, and CPU utilization thresholds at
> which to switch frequencies.  Is that possible, or is it work yet to
> be done?  Adjustable polling interval would also be nice.
>=20

Yes. You can set the maximum and minimum allowed frequencies using=20
the standard cpufreq interface. Something like:
echo 800000 >  /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq

However, other interfaces to tune this particular governor is not=20
there yet. Other tunables that will be exported to user in future are=20
Polling interval and CPU utilization thresholds.

> > The patches will work on all laptops with EST technology=20
> > (Centrino) and also on any other system that supports low=20
> > latency frequency change.=20
>=20
> Does Pentium 4 M work?

AFAIK, P4M does not support EST. You can double check with=20
/proc/cpuinfo and look out for EST flag.


Thanks,
-Venkatesh
