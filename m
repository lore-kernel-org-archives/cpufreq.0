From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: cpufreqd not working help?
Date: Thu, 19 Aug 2004 10:45:38 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040819084538.GG29560@poupinou.org>
References: <1092840467.30637.202577436@webmail.messagingengine.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1092840467.30637.202577436@webmail.messagingengine.com>
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
To: Joshua Lowell <joshual@airpost.net>
Cc: cpufreq@www.linux.org.uk

Hi,

On Wed, Aug 18, 2004 at 07:47:47AM -0700, Joshua Lowell wrote:
> Hi, I have a new laptop an hp ze4805, with an amd athlon xp-m 2800+
> I installed and started:  powernow-k7 module, processor module is
> loaded, and 
> cpufreqd is also running. oh ac battery and fan are also running.
> But when I check /proc/cpuinfo after unplugging the laptop, the bogoimp
> and 
> cpu mHz stay the same... no chages are displayed at all.
> any help would be more than appreciated.

It's a problem with userspace space, not kernel space.  Please report
this trouble to the cpufreqd maintainer instead (even though I think
he is subscribed to this ml).

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
