From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: ondemand as default governor
Date: Wed, 7 Mar 2007 07:43:09 -0800
Message-ID: <653FFBB4508B9042B5D43DC9E18836F50E4405@scsmsx415.amr.corp.intel.com>
References: <20070307070208.GB15453@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <20070307070208.GB15453@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@redhat.com>, Len Brown <lenb@kernel.org>
Cc: cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Dave Jones
>Sent: Tuesday, March 06, 2007 11:02 PM
>To: Len Brown
>Cc: cpufreq@lists.linux.org.uk
>Subject: Re: ondemand as default governor
>
>On Wed, Mar 07, 2007 at 01:24:28AM -0500, Len Brown wrote:
> > On Thursday 01 March 2007 12:41, Thomas Renninger wrote:
> > > I just read in drivers/cpufreq/Kconfig:
> > >=20
> > > # Note that it is not currently possible to set the other=20
>governors
> > > (such as ondemand)
> > > # as the default, since if they fail to initialise,=20
>cpufreq will be
> > > # left in an undefined state.
> > >=20
> > > Is this a bigger problem to solve?
> > > Is there already someone working/thinking on/about a solution?
> > >=20
> > > Allowing this would be convenient...
> >=20
> > Yes, it would, then we could delete the other governors,
> > and then delete the concept of multiple governors alltogether.
>
>It's not feasible unless you have a way of making various
>older CPUs transition faster.  Ondemand on=20
>longhaul,powernow-k6,longrun,
>elanfreq, as well as lots of non-x86 implementations is just not
>a feasible option.
>
>However.. conservative might be.  I'd still like to see conservative
>folded into ondemand sometime, and just be a module param.
>

One option I was thinking of doing is to add a rating system to all
governors and to try init'ing all governors in order of their rating
at init time (until one is successful). With that, we can fallback to
performance or userspace if ondemand fails to init.

But, I never got around to implementing something like that.....

Thanks,
Venki
