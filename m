From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: cpufreq-LINUX-20030828.tar.bz2 and linux-2.4.22
Date: Thu, 28 Aug 2003 18:21:13 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030828162113.GB4401@poupinou.org>
References: <20030828134117.GA11495@sigbjoernson.orion.toppoint.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030828134117.GA11495@sigbjoernson.orion.toppoint.de>
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
To: Wilfried Klaebe <wk-reply@orion.toppoint.de>
Cc: cpufreq@www.linux.org.uk

On Thu, Aug 28, 2003 at 03:41:17PM +0200, Wilfried Klaebe wrote:
> Hi!
> 
> I got the following errors:
> 
> make[2]: Entering directory `/usr/src/kernel/linux-2.4.22/arch/i386/kernel'
> make[2]: *** No rule to make target `speedstep-lib.c', needed by
>         `/usr/src/kernel/linux-2.4.22/include/linux/modules/speedstep-lib.ver'.
>         Stop.
> make[2]: Leaving directory `/usr/src/kernel/linux-2.4.22/arch/i386/kernel'
> make[1]: *** [_sfdep_arch/i386/kernel] Error 2
> make[1]: Leaving directory `/usr/src/kernel/linux-2.4.22'
> make: *** [dep-files] Error 2
> 
> I then did a
> 
> mv arch/i386/kernel/cpufreq/speedstep-ich.c
>         arch/i386/kernel/cpufreq/speedstep-lib.[ch] arch/i386/kernel/
> 

I can not reproduce this with cvs, so maybe it should be ok tomorrow?


-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
