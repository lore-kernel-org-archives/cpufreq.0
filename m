From: Dominik Brodowski <linux@brodo.de>
Subject: Re: Cpufreq 2.4.22-pre6 & Pentium M
Date: Sat, 19 Jul 2003 08:46:50 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030719064650.GB1658@brodo.de>
References: <20030718220937.09d2dc67.eglez@ast.cam.ac.uk> <1058564397.17203.10.camel@sherkaner.pao.digeo.com>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1058564397.17203.10.camel@sherkaner.pao.digeo.com>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: Eduardo Gonzalez-Solares <eglez@ast.cam.ac.uk>, cpufreq list <cpufreq@www.linux.org.uk>

On Fri, Jul 18, 2003 at 02:39:57PM -0700, Jeremy Fitzhardinge wrote:
> On Fri, 2003-07-18 at 14:09, Eduardo Gonzalez-Solares wrote:
> > Nothing in dmesg. It seems the problem is in:
> > 
> >        if (!cpu_has(cpu, X86_FEATURE_EST))
> >                return -ENODEV;
> 
> I'm not sure who maintains the 2.4 port

/me is not maintaining it, but I'm the culprit for this bug.

>, but the problem is that the
> core code which sets up the CPU feature bits doesn't know about the
> extended feature word, so it doesn't read the X86_FEATURE_EST bit from
> the CPU.
> 
> The previous versions of this patch used this functional but ugly code:
>         int dummy, ecx;
>         
>         cpuid(1,&dummy,&dummy,&ecx,&dummy);
>         if (!(ecx & (1<<7)))
>         	return -ENODEV;
> 
> Either the new ports of speedstep-centrino.c need to keep using this
> code, or the X86_FEATURE_EST bit needs to be put into cpu_data.

Will send davej an updated version [for 2.4.22-pre7] early next week.

       Dominik
