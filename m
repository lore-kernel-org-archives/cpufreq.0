From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] Add cpufreq driver for Momentum Maple boards
Date: Fri, 17 Jun 2011 16:07:40 -0400
Message-ID: <20110617200740.GA31457@redhat.com>
References: <1308284088.32158.0.camel@pasglop>
 <1308300556-4463-1-git-send-email-dbaryshkov@gmail.com>
 <201106171117.14794.arnd@arndb.de>
 <BANLkTimo6k=Zz+QnP0VaWYf3jDjpFXNL4w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BANLkTimo6k=Zz+QnP0VaWYf3jDjpFXNL4w@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, paulus@samba.org, cpufreq@vger.kernel.org

On Fri, Jun 17, 2011 at 03:12:56PM +0400, Dmitry Eremin-Solenikov wrote:
 > What about drivers/cpufreq/powerpc, or it's an unnecessary?

We haven't done it so far for x86 & arm, so for now at least, just keeping
them in drivers/cpufreq/ should be sufficient.

 > Should I resumbit it, or there will be massive arch/powerpc ->
 > drivers/cpufreq move?

Good question. I haven't heard anything from any of the PPC maintainers
on this subject, but I'll be happy to help out where I can if they
decide to follow suit with x86/arm.

	Dave

