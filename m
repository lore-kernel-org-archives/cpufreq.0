From: Dave Jones <davej@redhat.com>
Subject: Re: cpufreq on-demand governor up_treshold?
Date: Tue, 10 May 2005 22:34:48 -0400
Message-ID: <20050511023448.GA25506@redhat.com>
References: <200503140829.04750.lkml@kcore.org>
	<42354400.7070500@tremplin-utc.net>
	<20050511013334.GB8039@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050511013334.GB8039@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Piel <Eric.Piel@tremplin-utc.net>, Jan De Luyck <lkml@kcore.org>, cpufreq@zenii.linux.org.uk, linux@dominikbrodowski.net

On Tue, May 10, 2005 at 09:33:34PM -0400, Dave Jones wrote:
 > On Mon, Mar 14, 2005 at 08:57:52AM +0100, Eric Piel wrote:
 >  > Jan De Luyck a =E9crit :
 >  > >Hello lists,
 >  > >
 >  > >(please cc me from cpufreq list)
 >  > >
 >  > >I've since yesterday started using the ondemand governor. Seems to=
 work=20
 >  > >fine, tho I can't seem to find a reason why it keeps scaling my pr=
ocessor=20
 >  > >speed upwards tho the processor use never exceeds 30% (been watchi=
ng top=20
 >  > >-d 1).=20
 >  > :
 >  > :
 >  > >Any hints?
 >  > You can try the three attached patches in the order :
 >  > ondemand-cleanup-factorise-idle-measurement-2.6.11.patch
 >  > ondemand-save-idle-up-for-all-cpu-2.6.11.patch
 >  > ondemand-automatic-downscaling-2.6.11-accepted.patch
 >  >=20
 >  > They are available on the cpufreq list but as it's difficult to acc=
ess=20
 >  > it I'm sending them again, all together. These are the last things =
that=20
 >  > Venki and I have been working on. It should solve your problem=20
 >  > (actually, only the last patch, but it depends on the two previous=20
 >  > patches). Please, let me know if it works.
 >  >=20
 >  > BTW, DaveJ, Dominik, I couldn't find them in the daily-snapshot=20
 >  > available at codemonkey.org.uk. Should I worry, or is it just due t=
o=20
 >  > some latency between your private trees and the public one?
 >=20
 > I'm preparing the first cpufreq->linus sync right now.
 > Can you write up some descriptions & signed-off-by: lines for
 > these three please ?

Additionally, it'll need tweaking to diff on top of whats
currently in the pending queue. looks like the patch at
http://www.codemonkey.org.uk/projects/cpufreq/pending-patches/CPUFREQ-04-=
ondemand-cleanups.patch
upsets yours a little.

Thanks,

		Dave
