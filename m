From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [RFC] cpufreqtools
Date: Mon, 25 Oct 2004 13:11:50 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041025111150.GA7655@dominikbrodowski.de>
References: <20041021172227.GA24663@dominikbrodowski.de>
	<20041025090139.GC2998@inferi.kami.home>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041025090139.GC2998@inferi.kami.home>
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
To: cpufreq@www.linux.org.uk, dongili@supereva.it

On Mon, Oct 25, 2004 at 11:01:39AM +0200, Mattia Dongili wrote:
> I definitely think it's useful. Probably versioned symbols could be a
> good idea for the library.

For some stuff yes, for other things like "get current frequency of that
CPU" it seems like overkill. Patches are welcome.

> Right now I'm (mostly) rewriting cpufreqd and
> I'd like to use such a library. It could be just a starting point to
> test the library usability :)

Excellent :)

> > d) autotoolization and libtoolization. I tried to do so today, but failed
> 
> I'm working on it. Anyway I'm not a master autostuff user :) so some
> thing I'm going to say may be plainly wrong. I'll send you the result of
> my efforts asap.

That's great. Thanks for doing this.

> >    in a subdirectory "libcpufreq/", only enable "sysfs" input if libsys
> >    is present, only enable "proc" input if so explicitely desired by the
> >    user; cpufreq-set and cpufreq-info should link against libcpufreq, too;
> >    and they should be put in a subdirecoty "utils/"... anybody willing to
> >    help me to do this?
> 
> Also, I don't know if enabling aut (as in latin) sysfs aut procfs
> reading is a good idea because you may have many kernels with different
> configurations and recompiling the library each time you switch kernel
> is not that *friendly*.
> Maybe having a function that detects _which_ cpufreq interface is used
> and pass its return value everywhere is better? opinions?
> Something like:
> 

Maybe I didn't express my intention too clearly: the code doesn't do "aut"
(as in Latin) or either/or (as in English). It preferres sysfs, but doesn't
find sysfs to be doable, it falls back to proc if possible.

> --- cpufreq.h
> #define CPUFREQ_PROC_IFACE  0
> #define CPUFREQ_SYSFS_IFACE 1

check "interface.h" at the top:
#define INTERFACE_SYSFS
#define INTERFACE_PROC

You can define one of them or both; only both not defined will not work, of
course...


As 2.6. kernels are preferred to use for cpufreq, but it depends on libsyfs
-- and will only link correctly if libsyfs is present -- I'd like to make
#define INTERFACE_SYSFS dependant on libsysfs; and #define INTERFACE_PROC on
some "--enable-proc-interface" passed to ./configure...

Many thanks,
	Dominik
