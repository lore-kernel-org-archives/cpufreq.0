From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH 2/2] Add cpufreq driver for Momentum Maple boards
Date: Tue, 28 Jun 2011 23:43:49 -0400
Message-ID: <20110629034348.GB30973@redhat.com>
References: <1308316207-9075-1-git-send-email-dbaryshkov@gmail.com>
 <1308316207-9075-2-git-send-email-dbaryshkov@gmail.com>
 <1309318110.32158.520.camel@pasglop>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1309318110.32158.520.camel@pasglop>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, linuxppc-dev@lists.ozlabs.org, cpufreq@vger.kernel.org, Paul Mackerras <paulus@samba.org>

On Wed, Jun 29, 2011 at 01:28:30PM +1000, Ben Herrenschmidt wrote:
 > Before I comment on this last one, a quick Q. for Dave: Do you want to
 > handle this or should I merge it via powerpc.git ? (It depends on
 > another change to the arch code to expose the SCOM functions that it
 > uses, and that patch is going to be in my -next branch).

If you're carrying the dependancy, it sounds like it would make more sense
for you to carry this too. There are some changes to the Kconfig/Makefile
in drivers/cpufreq in my tree for 3.1 already, so you might get a collision
when both trees end up in next & subsequently Linus' tree. Just trivial changes though. 

 > > ---
 > >  drivers/cpufreq/Kconfig         |    5 +
 > >  drivers/cpufreq/Kconfig.powerpc |    7 +
 > >  drivers/cpufreq/Makefile        |    5 +
 > >  drivers/cpufreq/maple-cpufreq.c |  314 +++++++++++++++++++++++++++++++++++++++
 > 
 > If we're going to have a Kconfig.powerpc, should we maybe just have a
 > powerpc subdirectory instead with the driver in it ?
 > 
 > I'm happy at some later point to try moving some of my other ones there.

So far we haven't bothered with additional subarch drivers/ directories for x86/arm.
I'm not against the idea. As more archs move over, I could see drivers/cpufreq/
getting more cluttered.
 
	Dave
