From: Jiri Hladky <hladky.jiri@seznam.cz>
Subject: Re: Pentium III Coppermine
Date: Fri, 15 Oct 2004 12:01:35 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200410151201.35260.hladky.jiri@seznam.cz>
References: <33222.14179-2631-1010294146-1097668908@email.seznam.cz>
	<200410141622.05561.hladky.jiri@seznam.cz>
	<20041014152346.GA7447@dominikbrodowski.de>
Reply-To: hladky.jiri@seznam.cz
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20041014152346.GA7447@dominikbrodowski.de>
Content-Disposition: inline
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
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: aeriksson@fastmail.fm, cpufreq@www.linux.org.uk

Hi Anders,

I'm trying to do it right now. 
I did:

make odlconfig
make xconfig

But I do not see 
CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK
in xconfig menu. Should I just edit .config by hand? If yes, what exactly 
should I add to .config?

Thanks a lot!
Jiri


> Did you follow through on Dominik's suggestion, and recompiled the kernel?
> 
> 
> /Anders
