From: Jan De Luyck <lkml@kcore.org>
Subject: Re: cpufreq on-demand governor up_treshold?
Date: Mon, 14 Mar 2005 13:40:58 +0100
Message-ID: <200503141340.59714.lkml@kcore.org>
References: <200503140829.04750.lkml@kcore.org>
	<42354400.7070500@tremplin-utc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <42354400.7070500@tremplin-utc.net>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Piel <Eric.Piel@tremplin-utc.net>
Cc: davej@redhat.com, cpufreq@zenii.linux.org.uk, linux-kernel@vger.kernel.org, linux@dominikbrodowski.net

On Monday 14 March 2005 08:57, Eric Piel wrote:
> Jan De Luyck a =E9crit :
> > Hello lists,
> >
> > (please cc me from cpufreq list)
> >
> > I've since yesterday started using the ondemand governor. Seems to work
> > fine, tho I can't seem to find a reason why it keeps scaling my process=
or
> > speed upwards tho the processor use never exceeds 30% (been watching top
> > -d 1).
> >
> >
> > Any hints?
>
> You can try the three attached patches in the order :
> ondemand-cleanup-factorise-idle-measurement-2.6.11.patch
> ondemand-save-idle-up-for-all-cpu-2.6.11.patch
> ondemand-automatic-downscaling-2.6.11-accepted.patch
>
> They are available on the cpufreq list but as it's difficult to access
> it I'm sending them again, all together. These are the last things that
> Venki and I have been working on. It should solve your problem
> (actually, only the last patch, but it depends on the two previous
> patches). Please, let me know if it works.

Okay, now the behaviour of the ondemand governor looks more 'sane'. Thanks,=
 it=20
looks like a huge improvement :)

Jan

=2D-=20
Snow and adolescence are the only problems that disappear if you ignore
them long enough.
