From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Pentium III Coppermine
Date: Fri, 15 Oct 2004 12:36:46 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041015103646.GA4941@dominikbrodowski.de>
References: <33222.14179-2631-1010294146-1097668908@email.seznam.cz>
	<200410141622.05561.hladky.jiri@seznam.cz>
	<20041014152346.GA7447@dominikbrodowski.de>
	<200410151201.35260.hladky.jiri@seznam.cz>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200410151201.35260.hladky.jiri@seznam.cz>
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
To: Jiri Hladky <hladky.jiri@seznam.cz>
Cc: aeriksson@fastmail.fm, cpufreq@www.linux.org.uk

On Fri, Oct 15, 2004 at 12:01:35PM +0200, Jiri Hladky wrote:
> Hi Anders,
> 
> I'm trying to do it right now. 
> I did:
> 
> make odlconfig
> make xconfig
> 
> But I do not see 
> CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK
> in xconfig menu. Should I just edit .config by hand? If yes, what exactly 
> should I add to .config?

What kernel are you using?

make menuconfig
-> Power management options (ACPI, APM) --->
-> CPU Frequency scaling --->

and then somewhere there is

[*] Relaxed speedstep capability checks

Enable it, and recompile.

	Dominik
