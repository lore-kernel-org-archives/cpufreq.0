From: Christian Flamm <alcc@gmx.de>
Subject: Re: I haven't been able to set the chosen policy for CPU0
Date: Mon, 19 May 2008 20:00:25 +0200
Message-ID: <200805192000.26380.alcc@gmx.de>
References: <200805191842.22216.alcc@gmx.de> <200805191916.25692.alcc@gmx.de>
	<924EFEDD5F540B4284297C4DC59F3DEE01119E34@orsmsx423.amr.corp.intel.com>
Reply-To: alcc@gmx.de
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <924EFEDD5F540B4284297C4DC59F3DEE01119E34@orsmsx423.amr.corp.intel.com>
Content-Disposition: inline
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>, cpufreq@lists.linux.org.uk

> >>>I think I can now reproduce that misbehaviour. I happens when
> >>>both of my cores
> >>>are at 100% =A0- than min- *and* max-frequency fall down to
> >>>minimum (1000000Hz)

> >> Looks like the CPUs are being driver to lower freq due to temperature
> >> limits. CPUs being busy is increasing the temp and they go

> >to lower freq

> >> until they reach the lower temp. Looking at
> >> /proc/acpi/thermal_zone/*/*
> >> when this happens can confirm this.

> >First of all, thx for the reply.

> >Before, at, and after the freqency falls doen to minimum:

> >$ cat /proc/acpi/thermal_zone/THM0/state
> >state: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ok

> >So its something else.

> BTW, what does other values in THM0/* look like. Temp, passive, active,
> etc..

Maybe you're right.

Temperature increases up to 83=B0C and then the cpu seems to get auto-throt=
tled.

$ ls /proc/acpi/thermal_zone/THM0/
cooling_mode =A0polling_frequency =A0state =A0temperature =A0trip_points

$cat /proc/acpi/thermal_zone/THM0/cooling_mode
<setting not supported>
