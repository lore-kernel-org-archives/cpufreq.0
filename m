From: "Claudio Eduardo" <claudioeddy@gmail.com>
Subject: Re: [PATCH] Eliminate cpufreq_userspace scaling_setspeed deadlock
Date: Mon, 26 Nov 2007 09:05:39 -0400
Message-ID: <bb5d68b20711260505y659865a0u3de01c6bbb68b76f@mail.gmail.com>
References: <20071026171821.GA20924@linux-os.sc.intel.com>
	<08DF4D958216244799FC84F3514D70F0B5555C@pdsmsx415.ccr.corp.intel.com>
	<20071107125638.GB27092@inferi.kami.home>
	<924EFEDD5F540B4284297C4DC59F3DEE15F13A@orsmsx423.amr.corp.intel.com>
	<20071120234132.GA9882@redhat.com>
	<20071121120245.GA4609@inferi.kami.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20071121120245.GA4609@inferi.kami.home>
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
To: Mattia Dongili <malattia@linux.it>, cpufreq-owner@lists.linux.org.uk, cpufreq@www.linux.org.uk

I'm trying to understand  cpufreq  more deeply ,  and then I'd like to know
what sysfs_get_active and sysfs_deactivate does and what "processs" would
"trigger" the second thread which cats /sys/devices/.../cpufreq related
above. Could someone help me =3DD ?

On Nov 21, 2007 8:02 AM, Mattia Dongili <malattia@linux.it> wrote:

> On Tue, Nov 20, 2007 at 06:41:33PM -0500, Dave Jones wrote:
> > On Wed, Nov 07, 2007 at 10:45:35PM -0800, Venki Pallipadi wrote:
> >  >
> >  >
> >  > >-----Original Message-----
> >  > >From: Mattia Dongili [mailto:malattia@linux.it]
> >  > >Sent: Wednesday, November 07, 2007 4:57 AM
> >  > >To: Yu, Luming
> >  > >Cc: Pallipadi, Venkatesh; Dave Jones; Yu, Fenghua; cpufreq
> >  > >Subject: Re: [PATCH] Eliminate cpufreq_userspace
> >  > >scaling_setspeed deadlock
> >  > >
> >  > >On Mon, Nov 05, 2007 at 04:58:18PM +0800, Yu, Luming wrote:
> >  > >> Based on my current testing results, this patch fixes my problem.
> >  > >> Please help push it upstream.
> >  > >
> >  > >BTW, this will break some userspace apps. I can think of
> cpufrequtils
> >  > >and some deamons that use the userspace governor to set frequencies.
> >  > >
> >  >
> >  > Yes. But, this is the only solution we have for the deadlock right
> now
> >  > and I think it should goto upstream as soon as possible, unless we
> have
> >  > some better alternative. Userspace breakage is better bargain than a
> >  > kernel deadlock. Isn't it :-).
> >
> > I'm torn over this patch.  I don't see a better way to fix this either,
> > but the potential for breaking userspace is there. I think I'm going to
> > merge this, and see how things go in -mm for a while.
>
> I have to reconsider my words actually.
> It's probably not breaking anything (AFAICT) as the scaling_setspeed
> file will just sit there forever. In the beginning I thought the file
> would move somewhere else but that is not the case.
>
> No userspace chould rely on the presence of the file as an indicator of
> which governor is being used so hopefully the patch will do much more
> good than bad ;)
>
> cheers
> --
> mattia
> :wq!
>
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@lists.linux.org.uk
> http://lists.linux.org.uk/mailman/listinfo/cpufreq
>



-- =

Claudio Eduardo Marques Gomes
Estudante de Engenharia da Computa=E7=E3o
Diretor de Tecnologia do CAECOM
Projeto DCC-INDT em Baixo Consumo de Energia em Sistemas Embarcados
Universidade Federal do Amazonas (UFAM)
Tell: 92 3088-3845
Cel:  92 9183-8100
