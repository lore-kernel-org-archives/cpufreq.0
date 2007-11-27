From: "Mauro 'Kenny' Freitas" <maurokenny@gmail.com>
Subject: Re: [PATCH] Eliminate cpufreq_userspace scaling_setspeed deadlock
Date: Tue, 27 Nov 2007 17:11:59 -0400
Message-ID: <ad2eb3320711271311s2832103bhfaf04dcd8e5bbc25@mail.gmail.com>
References: <20071026171821.GA20924@linux-os.sc.intel.com>
	<08DF4D958216244799FC84F3514D70F0B5555C@pdsmsx415.ccr.corp.intel.com>
	<20071107125638.GB27092@inferi.kami.home>
	<924EFEDD5F540B4284297C4DC59F3DEE15F13A@orsmsx423.amr.corp.intel.com>
	<20071120234132.GA9882@redhat.com>
	<bb5d68b20711201904j4566ecf8pf957e273302e3d94@mail.gmail.com>
	<924EFEDD5F540B4284297C4DC59F3DEE2524DC@orsmsx423.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <924EFEDD5F540B4284297C4DC59F3DEE2524DC@orsmsx423.amr.corp.intel.com>
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
To: cpufreq@www.linux.org.uk, claudio <claudioeddy@gmail.com>

I`m trying to understand the same thing as Claudio. I understood how the
deadlock happens but I`d like to know what piece of cpufreq code is in
charge of creating those threads...any help?

On Nov 26, 2007 1:40 PM, Pallipadi, Venkatesh <venkatesh.pallipadi@intel.co=
m>
wrote:

>
> Userspace will still be there. Just the semantics of scaling_setspeed will
> change slightly.
>
> The problem below, userspace did not deadlock the kernel. Userspace
> deadlocks the cpufreq sub system.
> The two threads that can reproduce the problem is: One thread that changes
> the governors across say performance, userspace and ondemand on all CPUs
> continuously and other thread just keeps on doing 'cat
> /sys/devices/system/cpu/cpu*/cpufreq/*' in an infinite loop.
>
> Thanks,
> Venki
>
>
>
> ________________________________
>
>        From: claudio [mailto:claudioeddy@gmail.com]
>        Sent: Tuesday, November 20, 2007 7:05 PM
>        To: Dave Jones; cpufreq@www.linux.org.uk; Yu, Luming; Yu, Fenghua;
> Pallipadi, Venkatesh
>        Subject: Re: [PATCH] Eliminate cpufreq_userspace scaling_setspeed
> deadlock
>
>
>        Is it what I'm reading: userspacer will be over?
>        Sorry I haven't been aware of "how the problem happens", so how has
> "userspace" deadlocked the kernel?I'd like to understand (any link to the
> problem?) it.
>        []s
>
>
>        On Nov 20, 2007 7:41 PM, Dave Jones <davej@redhat.com> wrote:
>
>
>                On Wed, Nov 07, 2007 at 10:45:35PM -0800, Venki Pallipadi
> wrote:
>                 >
>                 >
>                 > >-----Original Message-----
>                 > >From: Mattia Dongili [mailto:malattia@linux.it ]
>                 > >Sent: Wednesday, November 07, 2007 4:57 AM
>                 > >To: Yu, Luming
>                 > >Cc: Pallipadi, Venkatesh; Dave Jones; Yu, Fenghua;
> cpufreq
>                 > >Subject: Re: [PATCH] Eliminate cpufreq_userspace
>                 > >scaling_setspeed deadlock
>                 > >
>                 > >On Mon, Nov 05, 2007 at 04:58:18PM +0800, Yu, Luming
> wrote:
>                 > >> Based on my current testing results, this patch fixes
> my problem.
>                 > >> Please help push it upstream.
>                 > >
>                 > >BTW, this will break some userspace apps. I can think
> of cpufrequtils
>                 > >and some deamons that use the userspace governor to set
> frequencies.
>                 > >
>                 >
>                 > Yes. But, this is the only solution we have for the
> deadlock right now
>                 > and I think it should goto upstream as soon as possible,
> unless we have
>                 > some better alternative. Userspace breakage is better
> bargain than a
>                 > kernel deadlock. Isn't it :-).
>
>                I'm torn over this patch.  I don't see a better way to fix
> this either,
>                but the potential for breaking userspace is there. I think
> I'm going to
>                merge this, and see how things go in -mm for a while.
>
>                       Dave
>
>                --
>                http://www.codemonkey.org.uk
>
>                _______________________________________________
>                Cpufreq mailing list
>                Cpufreq@lists.linux.org.uk
>                http://lists.linux.org.uk/mailman/listinfo/cpufreq
>
>
>
>
>
>        --
>        Claudio Eduardo Marques Gomes
>        Estudante de Engenharia da Computa=E7=E3o
>        Diretor de Tecnologia do CAECOM
>        Projeto DCC-INDT em Baixo Consumo de Energia em Sistemas Embarcados
>        Universidade Federal do Amazonas (UFAM)
>        Tell: 92 3088-3845
>        Cel:  92 9183-8100
>
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@lists.linux.org.uk
> http://lists.linux.org.uk/mailman/listinfo/cpufreq
>
