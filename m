From: Mattia Dongili <dongili@supereva.it>
Subject: Re: [RFC] cpufreqtools
Date: Mon, 25 Oct 2004 11:01:39 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041025090139.GC2998@inferi.kami.home>
References: <20041021172227.GA24663@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041021172227.GA24663@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk

On Thu, Oct 21, 2004 at 07:22:27PM +0200, Dominik Brodowski wrote:
> Hi all,
> 
> The multitude of cpufreq userspace tools is something I like very much: it
> offers the user the choice to use the tools which suits her needs best.
> 
> However, there are three issues which should be addressed, in my humble
> opinion:
[...]
> What needs to be done? The first implementation available at
> 
> http://www.brodo.de/cpufreq/cpufreqtools-0.1-pre0.tar.bz2 
> size: 15k
> [License: GPL v2]
> 
> just "works for me" for A) and B), and has all the code for C) in it. Still
> missing is the following:
> 
> a) discussion about the need of such cpufreqtools, their (first)
>    implementation, further requirements, shortcomings, etc.

I definitely think it's useful. Probably versioned symbols could be a
good idea for the library. Right now I'm (mostly) rewriting cpufreqd and
I'd like to use such a library. It could be just a starting point to
test the library usability :)

[...]
> d) autotoolization and libtoolization. I tried to do so today, but failed

I'm working on it. Anyway I'm not a master autostuff user :) so some
thing I'm going to say may be plainly wrong. I'll send you the result of
my efforts asap.

>                                             I'd like to put the library
>    in a subdirectory "libcpufreq/", only enable "sysfs" input if libsys
>    is present, only enable "proc" input if so explicitely desired by the
>    user; cpufreq-set and cpufreq-info should link against libcpufreq, too;
>    and they should be put in a subdirecoty "utils/"... anybody willing to
>    help me to do this?

Probably we'd need to completely split the package and _first_ install
the library and only then the tools. Right now building both in the same
package is beyond my autostuff knowledge, while having them in two
separate packages is pretty simple to handle.
Also, I don't know if enabling aut (as in latin) sysfs aut procfs
reading is a good idea because you may have many kernels with different
configurations and recompiling the library each time you switch kernel
is not that *friendly*.
Maybe having a function that detects _which_ cpufreq interface is used
and pass its return value everywhere is better? opinions?
Something like:

--- cpufreq.h
#define CPUFREQ_PROC_IFACE  0
#define CPUFREQ_SYSFS_IFACE 1
...
---

--- my_userspace_daemon.c
cpufreq_t which_iface = cpufreq_get_cpu_iface();
if ( cpufreq_set_policy(mycpu, mypolicy, which_iface) ) {
...
}
---

Or maybe provide macros to hide the above code?

> e) The output should be corrected by someone who has better skills in the
>    English language; and some documentation (man-files, README, INSTALL)
>    be added.

I doubt my english is better than yours :)

good job Dominik :)
-- 
mattia
:wq!
