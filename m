From: mru@kth.se (=?iso-8859-1?q?M=E5ns_Rullg=E5rd?=)
Subject: Re: [PATCHSET] 0/3 Dynamic cpufreq governor and updates to ACPI
 P-state driver
Date: Tue, 21 Oct 2003 10:25:10 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <yw1xoewb6lqx.fsf@kth.se>
References: <88056F38E9E48644A0F562A38C64FB60077911@scsmsx403.sc.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
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
To: cpufreq@www.linux.org.uk
Cc: linux-kernel@vger.kernel.org

"Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com> writes:

> Most of the latest CPUs (laptop CPUs in particular) have feature=20
> which enable very low latency P-state transitions=20
> (like Enhanced Speedstep Technology-EST). Using this feature,=20
> we can have a lightweight in kernel cpufreq governor,=20
> to vary CPU frequency depending on the CPU usage. The=20
> advantage being low power consumption and also cooler laptops.

So, how does this work?  I'd like to be able to set minimum and
maximum clock frequencies to allow, and CPU utilization thresholds at
which to switch frequencies.  Is that possible, or is it work yet to
be done?  Adjustable polling interval would also be nice.

> The patches will work on all laptops with EST technology=20
> (Centrino) and also on any other system that supports low=20
> latency frequency change.=20

Does Pentium 4 M work?

--=20
M=E5ns Rullg=E5rd
mru@kth.se
