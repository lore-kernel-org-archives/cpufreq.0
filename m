From: Nebojsa Trpkovic <trx@inbox.ru>
Subject: Re: [PATCH] Another powernow-k7 patch for Desktop XP-M usage
Date: Fri, 15 Oct 2004 01:26:43 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <416F0B33.8050700@inbox.ru>
References: <200410121018.20518.Hendrik.Muhs@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <200410121018.20518.Hendrik.Muhs@web.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

Hendrik Muhs wrote:

>Hi,
>
>I have Athlon XP-M CPU running on Desktop board, which means my BIOS has no 
>PST tables. 
>
>After testing the available patches to fix this problem, I combined them an 
>wrote my own patch.
>
>The attached patch is for the latest stable kernel 2.6.8.1 and adds the 
>following parameters:
>
>- overwrite_table
>
>activates the manually settings, set it to >=1
>
>- multiplier
>
>specifies an array of multipliers, odd multipliers must be multiplied by 10: 
>3.5 -> 35
>
>- voltage
>
>specifies an array of VCore voltages in respect to the specified multipliers. 
>You have to specify them as mV:
>1.125 -> 1125
>
>- switch_latency
>
>sets the state transition latency in microseconds (default 200us)
>
>The patch does not allow overclocking: higher multipliers and/or voltages than 
>the maximum specified on CPU will be ignored. 
>You do not have to specify voltages, in this case the CPU default will be used 
>(on some boards voltage switching is not possible anyway).
>
>example usage:
>
>modprobe powernow-k7 overwrite_table=1 multiplier=3,4,5,6,7,8,9,10
>
>Disclaimer:
>It should not be possible to burn the CPU, but some combinations could crash 
>the system. I give no guaranty  that it works for your system and/or any 
>possibly resulting hardware damage.
>
>Have fun with it,
>
>Hendrik
>  
>

This is great! It works!

I had to manualy patch my powernow-k7.c but at the end I was able to 
change multiplier on the fly.
Only thing that made problems is switching latency and I had to set it 
to 850 (or more). Anything below 850 would freez system. Is 850 (or 900) 
us a lot?

One thing I just don't know how to do: How to set my max multiplier to 10.5?
I've tried
    modprobe powernow-k7 overwrite_table=1 multiplier=50,105 
switch_latency=850
but it gives 1900MHz (9.5x200MHz), and
    modprobe powernow-k7 overwrite_table=1 multiplier=5,12 
switch_latency=850
or
    modprobe powernow-k7 overwrite_table=1 multiplier=5,13 
switch_latency=850
locks compuers...

Any way to set it to 10.5?


Thank you.
