From: Davin Carter <davin.carter@wallst.com>
Subject: Powernow K7 question
Date: Sat, 10 Jul 2004 00:30:21 -0600
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <FE0E4E3EC4669A46A5D2E835957A9FFF141D96B6@uranus.wallst.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
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
To: "'cpufreq@www.linux.org.uk'" <cpufreq@www.linux.org.uk>


I have a mobile athlon 2400+ cpu on a shuttle AK32-E motherboard running
Suse 9.0.  
The module powernow-k7 is loaded.
The kernel messages when loading the module are:
Powernow:  AMD K7 CPU detected.
Powernow: PowerNOW? Technology present.  Can Scale: frequency and voltage.

I do not see any cpu information in /proc/cpufreq or /proc/sys/cpu/0/*.  

I also looked through this list and found a utility
http://poup.poupinou.org/cpufreq/powernow-k7/dump_psb.c
<http://poup.poupinou.org/cpufreq/powernow-k7/dump_psb.c> , which should
dump some table data.  Running the utility produced no output.  
Is powernow-k7 missing some data that should be supplied by the motherboard?
Do you know of a good link for this?
Also, is it possible to change the core voltage with the powernow module
without any table data?. The current core voltage is not correct for the
cpu.  The motherboard thinks the core should be 1.55V instead of 1.35V.   I
can drop the core by 100mv in bios, but would at lease like to drop by
another 100mv.

> _________________________________________________________
> Davin Carter
> Wall Street On Demand
> 
> davin.carter@WallSt.com <mailto:davin.carter@WallSt.com
> <mailto:davin.carter@WallSt.com> >
> phone 303.417.9999 x205
> fax 303.440.2982
> 
> 
> 
> 
