From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] Add cpufreq driver for Momentum Maple boards
Date: Fri, 17 Jun 2011 13:52:37 +0200
Message-ID: <201106171352.38707.arnd@arndb.de>
References: <1308284088.32158.0.camel@pasglop> <201106171117.14794.arnd@arndb.de> <BANLkTimo6k=Zz+QnP0VaWYf3jDjpFXNL4w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <BANLkTimo6k=Zz+QnP0VaWYf3jDjpFXNL4w@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, davej@redhat.com, paulus@samba.org, cpufreq@vger.kernel.org, benh@kernel.crashing.org

On Friday 17 June 2011 13:12:56 Dmitry Eremin-Solenikov wrote:
> > I think new cpufreq drivers should live in drivers/cpufreq, not in arch/.
> > We've
> > started moving other drivers away from arch/x86 and arch/arm already.
> 
> What about drivers/cpufreq/powerpc, or it's an unnecessary?

drivers/cpufreq is fine by itself, unless Dave has some preference.

> Should I resumbit it, or there will be massive arch/powerpc ->
> drivers/cpufreq move?

My recommendation would be to submit the new driver for drivers/cpufreq
directly and let Ben take care of the others at a convenient time.

	Arnd
