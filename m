From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH] replace for_each_cpu with for_each_cpu_mask
Date: Fri, 11 Jun 2004 17:40:47 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040611154047.GK1095@poupinou.org>
References: <20040611100912.GG1095@poupinou.org>
	<20040611122714.GA5179@redhat.com>
	<20040611131855.GI1095@poupinou.org>
	<20040611132919.GF8779@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040611132919.GF8779@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk

On Fri, Jun 11, 2004 at 02:29:19PM +0100, Dave Jones wrote:
> On Fri, Jun 11, 2004 at 03:18:55PM +0200, Bruno Ducrot wrote:
>  > On Fri, Jun 11, 2004 at 01:27:14PM +0100, Dave Jones wrote:
>  > > On Fri, Jun 11, 2004 at 12:09:12PM +0200, Bruno Ducrot wrote:
>  > > 
>  > >  > > That's indeed shorter -- don't know why whoever converted p4-clockmod
>  > >  > > to the new sibling mask did use for_each_cpu_mask...
>  > > I think I found out why.
>  > >  
>  > >  > Something like that should be ok, I guess.
>  > > for_each_cpu_mask doesn't exist on non-SMP in mainline.
>  > Well, you mean it's not in 2.6.7-rc3?  I will take a look.
> 
> Yeah, ISTR there's a considerable reworking of the cpu mask stuff
> in -mm, which is what you based on iirc.

Ok.  But I guess mainline is broken somehow then.  for_each_cpu_mask
is the only macro not defined in include/linux/cpumask.h

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
