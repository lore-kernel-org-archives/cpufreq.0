From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: cpufreq and P3 speedstep with 2.6.0-test3 kernel
Date: Wed, 13 Aug 2003 16:52:50 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030813145250.GG1372@poupinou.org>
References: <20030813135836.GA28615@via.ecp.fr> <20030813140443.GE1372@poupinou.org> <200308131820.07282.yarick@relex.ru>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200308131820.07282.yarick@relex.ru>
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
To: Yaroslav Rastrigin <yarick@relex.ru>
Cc: cpufreq@www.linux.org.uk

On Wed, Aug 13, 2003 at 06:20:06PM +0400, Yaroslav Rastrigin wrote:
> Hi !
> On Wednesday 13 August 2003 18:04, Ducrot Bruno wrote:
> >
> > could you post the output of
> > lspci -vx -s0:
> > please?
> >
> > Cheers,
> Was speedstep_bx integrated to test3 ?  AFAIK T2x series of laptops are built 
> using BX chipset, and speedstep-ich can't deal with it. I've just checked 
> -test2 sources, and there isn't BX-aware code there. 

No.  That one is still not integrated.  There are at least some known chipset
bugs before even considering to submit to linus or alan.

> BTW, I've manually integrated speedstep_bx into speedstep-ich.c for 2.4.21-rc1 
> vanilla (I can't run -ac for various reasons - some other patches are 
> confilcting with -ac patchset).  There are some problems with cpufreq in 
> general in plain 2.4.21-rc1 (f.e /proc/sys/cpu interface is broken - speed = 
> speed_min = speed_max = 0)

You have to switch to the userspace policy via something like:

echo 0:1000000:userspace > /proc/cpufreq

before using the really old interface under /proc/sys/cpu.

> , but /proc/cpufreq works well, and I could 
> successfully change policies using /proc/cpufreq. Is anyone interested in 
> diff ?

I guess yes, but only if you are using patch from davej at first:
http://www.codemonkey.org.uk/cpufreq/
and if you use the speedstep-piix4.c found on cvs (with a one-liner patch,
though).

I am also surprised that patch for ac do not apply to latter davej one?

Cheers,

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
