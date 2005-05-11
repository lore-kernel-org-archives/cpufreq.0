From: Dave Jones <davej@redhat.com>
Subject: Re: cpufreq on-demand governor up_treshold?
Date: Tue, 10 May 2005 21:33:34 -0400
Message-ID: <20050511013334.GB8039@redhat.com>
References: <200503140829.04750.lkml@kcore.org>
	<42354400.7070500@tremplin-utc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <42354400.7070500@tremplin-utc.net>
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
To: Eric Piel <Eric.Piel@tremplin-utc.net>
Cc: cpufreq@zenii.linux.org.uk, Jan De Luyck <lkml@kcore.org>, linux-kernel@vger.kernel.org, linux@dominikbrodowski.net

On Mon, Mar 14, 2005 at 08:57:52AM +0100, Eric Piel wrote:
 > Jan De Luyck a =E9crit :
 > >Hello lists,
 > >
 > >(please cc me from cpufreq list)
 > >
 > >I've since yesterday started using the ondemand governor. Seems to wo=
rk=20
 > >fine, tho I can't seem to find a reason why it keeps scaling my proce=
ssor=20
 > >speed upwards tho the processor use never exceeds 30% (been watching =
top=20
 > >-d 1).=20
 > :
 > :
 > >Any hints?
 > You can try the three attached patches in the order :
 > ondemand-cleanup-factorise-idle-measurement-2.6.11.patch
 > ondemand-save-idle-up-for-all-cpu-2.6.11.patch
 > ondemand-automatic-downscaling-2.6.11-accepted.patch
 >=20
 > They are available on the cpufreq list but as it's difficult to access=
=20
 > it I'm sending them again, all together. These are the last things tha=
t=20
 > Venki and I have been working on. It should solve your problem=20
 > (actually, only the last patch, but it depends on the two previous=20
 > patches). Please, let me know if it works.
 >=20
 > BTW, DaveJ, Dominik, I couldn't find them in the daily-snapshot=20
 > available at codemonkey.org.uk. Should I worry, or is it just due to=20
 > some latency between your private trees and the public one?

I'm preparing the first cpufreq->linus sync right now.
Can you write up some descriptions & signed-off-by: lines for
these three please ?

Thanks,
		Dave
