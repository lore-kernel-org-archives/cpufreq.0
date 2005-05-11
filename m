From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: Re: cpufreq on-demand governor up_treshold?
Date: Wed, 11 May 2005 14:19:03 +0200
Message-ID: <4281F837.5070608@tremplin-utc.net>
References: <200503140829.04750.lkml@kcore.org>	<42354400.7070500@tremplin-utc.net>	<20050511013334.GB8039@redhat.com>
	<20050511023448.GA25506@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20050511023448.GA25506@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@zenii.linux.org.uk, linux@dominikbrodowski.net

Dave Jones a =E9crit :
> On Tue, May 10, 2005 at 09:33:34PM -0400, Dave Jones wrote:
>  >=20
>  > I'm preparing the first cpufreq->linus sync right now.
>  > Can you write up some descriptions & signed-off-by: lines for
>  > these three please ?
>=20
> Additionally, it'll need tweaking to diff on top of whats
> currently in the pending queue. looks like the patch at
> http://www.codemonkey.org.uk/projects/cpufreq/pending-patches/CPUFREQ-0=
4-ondemand-cleanups.patch
> upsets yours a little.
>=20
Here follows the three patches, updated for the last snapshot of=20
cpufreq. I knew there was a conflict (CPUFREQ-04 is also a patch I wrote=20
;-) ) but was too lasy to resend them. Here you are!

Eric
