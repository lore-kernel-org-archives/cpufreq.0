From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Acer Aspire  1350 broken PST
Date: Sat, 17 Apr 2004 15:00:21 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040417130021.GB8953@poupinou.org>
References: <c5n0ms$7nc$1@sea.gmane.org> <20040416120519.GT8953@poupinou.org>
	<c5osds$fed$1@sea.gmane.org> <20040416151135.GV8953@poupinou.org>
	<c5otiu$ime$1@sea.gmane.org> <20040416152432.GW8953@poupinou.org>
	<c5p3e0$6js$1@sea.gmane.org> <20040416182013.GZ8953@poupinou.org>
	<20040417093220.GA7975@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040417093220.GA7975@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jy <jy454@yahoo.fr>, cpufreq@www.linux.org.uk

On Sat, Apr 17, 2004 at 11:32:20AM +0200, Dominik Brodowski wrote:
> On Fri, Apr 16, 2004 at 08:20:13PM +0200, Bruno Ducrot wrote:
> > Try with UP kernel.  At that time, cpufreq break TSC timer on SMP
> > kernels.  Or alternatively use the ACPI-timer.
> 
> Why is TSC timer on SMP broken, in your opinion? AFAICS, the problem seen on
> this machine is caused because of actual cpu frequency != frequency the
> cpufreq core thinks the CPU is in.
> 

It's broken if CONFIG_SMP because set_cyc2ns_scale() is not called
in the time_notifer() in timer_tsc.c (and anyway cpu_khz can't be
scaled in an easy fashion if SMP).
Therefore, cyc2ns_scale is not updated, and cycles_2_ns() will give
false values. 

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
