From: Daniele Bonomi <dbonomi@crema.unimi.it>
Subject: Re: [Bug 3600] New: Cpu recognization fails after upgrade from
 2.6.7 to 2.6.9
Date: Wed, 20 Oct 2004 18:05:37 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041020180537.17d0dd7c@paraclito.crema>
References: <200410201413.i9KED718023481@fire-1.osdl.org>
	<20041020154744.GA5372@dreamland.darkstar.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20041020154744.GA5372@dreamland.darkstar.lan>
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
To: cpufreq@www.linux.org.uk

On Wed, 20 Oct 2004 17:47:44 +0200 Kronos <kronos@kronoz.cjb.net> wrote:

> Hi,
> I saw something similar on my notebook. In my case when the notebook
> is turned on while using battery BIOS sets CPU speed to a frequency
> lower than the defaul (800MHz for me). It seems that powernow driver
> is confused by the BIOS fiddling with CPU speed and fails to load. I
> had the same symptoms: PST not found and wrong min/max frequencies.
> 
> Disabling "Automatic CPU power saving" (or something like that) in the
> BIOS cures the problem for me. Note that this option do not affect
> power management under linux (or windows), it just controls the CPU
> before a real OS comes up.

I tried but it didn't worked for me.
For me doesn't work even if i'm plugged in...

Thanks for your help.
Gufo

-- 
  ,___,	  While most peoples' opinions change, the conviction of their
  (9v9)   	     correctness never does
  (_^((\     	Gpg Key at filibusta.crema.unimi.it/~dbonomi/db.asc
-^-"-"-\\-^--	FP = C613 3CF3 94CD FA27 7900 D16C 3A6E 1CB5 585A CD71
