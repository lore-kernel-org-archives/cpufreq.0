From: Jean-Marc Valin <Jean-Marc.Valin@USherbrooke.ca>
Subject: Re: Suspend to RAM regression tracked down
Date: Sat, 08 Jul 2006 08:48:49 +1000
Message-ID: <1152312530.14453.16.camel@idefix.homelinux.org>
References: <1151837268.5358.10.camel@idefix.homelinux.org>
	 <44A80B20.1090702@goop.org> <1152271537.5163.4.camel@idefix.homelinux.org>
	 <20060707162152.GB3223@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932369AbWGGWsy@vger.kernel.org>
In-Reply-To: <20060707162152.GB3223@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dave Jones <davej@redhat.com>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, Linux Kernel <linux-kernel@vger.kernel.org>, cpufreq@lists.linux.org.uk

Le vendredi 07 juillet 2006 =E0 12:21 -0400, Dave Jones a =E9crit :
> On Fri, Jul 07, 2006 at 09:25:37PM +1000, Jean-Marc Valin wrote:
>  > > There was a race in ondemand and conservative which made them lo=
ck up on=20
>  > > resume (possibly only on SMP systems though).  There's a patch f=
or that=20
>  > > in current -mm, but I suspect there's another problem (still hav=
en't had=20
>  > > any time to track it down).
>  >=20
>  > OK, I tried the patch with 2.6.17 and it didn't work. My laptop fa=
iled
>  > to resume on the first try, so it must be something else. Could so=
meone
>  > actually have a look at the changes in 2.6.12-rc5-git6 (which happ=
en to
>  > be cpufreq-related)? I spend months pinpointing the problem to tha=
t
>  > version (it's takes several days to reproduce). I'd appreciate if
>  > someone could at least have a look at what changed there and maybe=
 fix
>  > it.
>=20
> Can you show /proc/cpuinfo for the affected system ?
> If it's 15/3/4 or 15/4/1, that would explain why this kernel,
> as this was when support for those models got introduced to
> speedstep-centrino.

Not sure what's the 15/..., but here's the content:
% cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 9
model name      : Intel(R) Pentium(R) M processor 1600MHz
stepping        : 5
cpu MHz         : 598.132
cache size      : 1024 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr mce cx8 sep mtrr pge mca cmov
pat clflush dts acpi mmx fxsr sse sse2 tm pbe est tm2
bogomips        : 1197.24

BTW, speedstep worked fine on my laptop with 2.6.12-rc5-git5 and
earlier.

> If it's not that, there is a pretty large delta in the ondemand
> governor in this update, but I don't see anything blindlingly
> obvious from looking over it.

Well, is there some way of doing a bisection over these changes? As far
as I know, the problem probably affects all Dell D600 owners, probably
others.

	Jean-Marc
