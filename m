From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: [PATCH] Longhaul - Need timer tick
Date: Mon, 05 Mar 2007 23:42:56 +0100
Message-ID: <45EC9CF0.7@interia.pl>
References: <45E89FAA.7050008@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <45E89FAA.7050008@interia.pl>
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
Content-Type: text/plain; charset="iso-8859-9"
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk

> There is no support for dynamic ticks in Longhaul.=20
> Current code is assuming that timer tick is present and=20
> constant.
Please ignore this patch. Somehow NO_HZ option don't change=20
anything. Average tick frequency is reduced to 20% for me=20
(uptime / interrupt 0 count), but somehow when Longhaul=20
is changing CPU frequency it is always equal to value set=20
by "Timer frequency" option. Probably this is how NO_HZ=20
author want it to work. Anyway, tested (with help of ACPI=20
PM timer) and even if help for this option may sound scary=20
for me, there is no change in transition latency. At least=20
on my system.

Sorry
Rafa=B3


----------------------------------------------------------------------
Oficjalne konto pocztowe europejskich internautow!=20
>>> http://link.interia.pl/f19e8
