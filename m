From: GoatZilla <goatzilla@gmail.com>
Subject: Re: [2.6. PATCH] Missing default governor choices
Date: Mon, 30 Aug 2004 12:15:50 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <39e348480408301015550c3ad3@mail.gmail.com>
References: <20040829123200.GA16050@dominikbrodowski.de>
Reply-To: GoatZilla <goatzilla@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040829123200.GA16050@dominikbrodowski.de>
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

Is there something wrong with wanting powersave activated as soon as possible?


If a user wants performance at bootup, he can choose the performance
governor as default.

If a user wants to maintain the startup speed at bootup, he can choose
the userspace governor as default.

If a user wants powersaving at bootup...  Too bad, go write a startup script?



It's not a big issue; I wrote a startup script for it myself.  I was
just left wondering why I had to write a startup script in the first
place.




On Sun, 29 Aug 2004 14:32:00 +0200, Dominik Brodowski
<linux@dominikbrodowski.de> wrote:
> > What's the reason for the powersave governor not being selectable as
> > default?
> 
> Because it doesn't matter much:
> - performance is available during boot so that CPUs starting up at less than
>   100% can be boosted to full performance very soon.
> - userspace is available to keep the CPU speed at what it was at boot, and
>   to allow existing userspace-based setups to work [it offers an equivalent
>   interface compared to the one of the old 2.4. cpufreq interface]
> 
> All other settings [including min/max ranges, governor for "continuing" use] can
> and should be done by either a startup script and/or a userspace daemon.
> 
>         Dominik
>
