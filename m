From: Dave Jones <davej@redhat.com>
Subject: Re: Suspend to RAM regression tracked down
Date: Sat, 8 Jul 2006 02:23:45 -0400
Message-ID: <20060708062345.GB3356@redhat.com>
References: <1151837268.5358.10.camel@idefix.homelinux.org>
	<44A80B20.1090702@goop.org>
	<1152271537.5163.4.camel@idefix.homelinux.org>
	<20060707162152.GB3223@redhat.com>
	<1152312530.14453.16.camel@idefix.homelinux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1152312530.14453.16.camel@idefix.homelinux.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Jean-Marc Valin <Jean-Marc.Valin@USherbrooke.ca>
Cc: cpufreq@lists.linux.org.uk, Jeremy Fitzhardinge <jeremy@goop.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On Sat, Jul 08, 2006 at 08:48:49AM +1000, Jean-Marc Valin wrote:
 > Le vendredi 07 juillet 2006 =E0 12:21 -0400, Dave Jones a =E9crit :
 > > On Fri, Jul 07, 2006 at 09:25:37PM +1000, Jean-Marc Valin wrote:
 > >  > > There was a race in ondemand and conservative which made them loc=
k up on=20
 > >  > > resume (possibly only on SMP systems though).  There's a patch fo=
r that=20
 > >  > > in current -mm, but I suspect there's another problem (still have=
n't had=20
 > >  > > any time to track it down).
 > >  >=20
 > >  > OK, I tried the patch with 2.6.17 and it didn't work. My laptop fai=
led
 > >  > to resume on the first try, so it must be something else. Could som=
eone
 > >  > actually have a look at the changes in 2.6.12-rc5-git6 (which happe=
n to
 > >  > be cpufreq-related)? I spend months pinpointing the problem to that
 > >  > version (it's takes several days to reproduce). I'd appreciate if
 > >  > someone could at least have a look at what changed there and maybe =
fix
 > >  > it.
 > >=20
 > > Can you show /proc/cpuinfo for the affected system ?
 > > If it's 15/3/4 or 15/4/1, that would explain why this kernel,
 > > as this was when support for those models got introduced to
 > > speedstep-centrino.
 >=20
 > Not sure what's the 15/..., but here's the content:

it was the family, of which yours is 6, so this isn't it.
which means it must be ..

 > > If it's not that, there is a pretty large delta in the ondemand
 > > governor in this update, but I don't see anything blindlingly
 > > obvious from looking over it.
 >=20
 > Well, is there some way of doing a bisection over these changes? As far
 > as I know, the problem probably affects all Dell D600 owners, probably
 > others.

If you're prepared to play around with 'git bisect' a little, it shouldn't
take that many iterations, as you've already narrowed it down quite a lot.

$ git bisect start drivers/cpufreq/cpufreq_ondemand.c
$ git bisect bad
$ git bisect good v2.6.12-rc5

should get you most of the way there.

http://www.kernel.org/pub/software/scm/git/docs/git-bisect.html
has more info.

		Dave

--=20
http://www.codemonkey.org.uk
