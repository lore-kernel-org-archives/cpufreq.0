From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Problem with cpufreq on my laptop (athlon 64 3700+ socket 754)
Date: Tue, 10 May 2005 20:00:58 +0200
Message-ID: <20050510180058.GT21800@poupinou.org>
References: <1115742607.4280e18ff27eb@imp6-q.free.fr>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1115742607.4280e18ff27eb@imp6-q.free.fr>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: forum.viennet@free.fr
Cc: cpufreq@lists.linux.org.uk

On Tue, May 10, 2005 at 06:30:07PM +0200, forum.viennet@free.fr wrote:
> Hellow
> 
> I've a problem with cpufreq on my laptop (fujitsu-siemens amilo 1630-3702 with
> athlon 64 3700+ scket 754).
> I've installed Mandrake 10.2 32 bits with the kernel 2.6.11-6,
> but the computer won't shutdown.
> 
> When the computer runs, it seems to be OK.
> 
> I've tried the 64 bits version, and there is the same problem.
> The problem is with kernel-2.6.11-6 and kernel-2.6.11-6-smp.

I highly doubt the kernel oops happens with a vanilla
kernel at least for the powernow-k8, but I maybe wrong.
So far, are you able to reproduce this oops with a vanilla kernel?

> Without cpufreq and acpi, it is OK, but it works only 800 Mhz !!
> 
> Help please !
> 
> Excuse my bad english, I'm french.

Personne n'est parfait ;)

BTW I don't think it is actually a problem with cpufreq by itself.
You should describe the shutdown trouble to the acpi mailing-list
instead <acpi-devel@lists.sourceforge.net> if a vanilla kernel
still fail to shutdown properly.  Of course, if removing a cpufreq
driver still fail with a vanilla kernel, we will happy you
report this issue here.

Bon courage,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
