From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: Cpufreq 2.4.22-pre6 & Pentium M
Date: 18 Jul 2003 14:39:57 -0700
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <1058564397.17203.10.camel@sherkaner.pao.digeo.com>
References: <20030718220937.09d2dc67.eglez@ast.cam.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030718220937.09d2dc67.eglez@ast.cam.ac.uk>
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
To: Eduardo Gonzalez-Solares <eglez@ast.cam.ac.uk>
Cc: Dominik Brodowski <linux@brodo.de>, cpufreq list <cpufreq@www.linux.org.uk>

On Fri, 2003-07-18 at 14:09, Eduardo Gonzalez-Solares wrote:
> Nothing in dmesg. It seems the problem is in:
> 
>        if (!cpu_has(cpu, X86_FEATURE_EST))
>                return -ENODEV;

I'm not sure who maintains the 2.4 port, but the problem is that the
core code which sets up the CPU feature bits doesn't know about the
extended feature word, so it doesn't read the X86_FEATURE_EST bit from
the CPU.

The previous versions of this patch used this functional but ugly code:
        int dummy, ecx;
        
        cpuid(1,&dummy,&dummy,&ecx,&dummy);
        if (!(ecx & (1<<7)))
        	return -ENODEV;

Either the new ports of speedstep-centrino.c need to keep using this
code, or the X86_FEATURE_EST bit needs to be put into cpu_data.

    J
