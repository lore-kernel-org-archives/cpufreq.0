From: aeriksson@fastmail.fm
Subject: Re: Pentium III Coppermine
Date: Fri, 15 Oct 2004 12:51:13 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041015105114.A4EC13F03@latitude.mynet.no-ip.org>
References: <33222.14179-2631-1010294146-1097668908@email.seznam.cz>
	<200410141622.05561.hladky.jiri@seznam.cz>
	<20041014152346.GA7447@dominikbrodowski.de>
	<200410151241.03188.hladky.jiri@seznam.cz>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-reply-to: <200410151241.03188.hladky.jiri@seznam.cz> 
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
To: hladky.jiri@seznam.cz
Cc: Dominik Brodowski <linux@dominikbrodowski.de>, cpufreq@www.linux.org.uk

On Fri, 15 Oct 2004 12:41:03 +0200 Jiri Hladky wrote:
>Hi Anders & Dominik,
>
>I have tried to search for CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK is source 
>files
>
>"locate speedstep | grep [.]c$ | xargs grep 
>CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK"
>
>but I had no success. It seems like I have to get new sources for cpufreq? My 
>current kernel is 2.6.5
>
>Thanks a lot!
>Jiri
>

Don't remember exactly when it entered the kernel. It was about that 
time frame.

You should find:
#ifdef CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK
static int relaxed_check = 0;
#else
#define relaxed_check 0
#endif


in arch/i386/kernel/cpu/cpufreq/speedstep-lib.c

/Anders
