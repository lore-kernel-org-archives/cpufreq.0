From: Nebojsa Trpkovic <trx@inbox.ru>
Subject: Re: [PATCH] Another powernow-k7 patch for Desktop XP-M usage
Date: Thu, 21 Oct 2004 02:56:57 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <41770959.6060403@inbox.ru>
References: <200410121018.20518.Hendrik.Muhs@web.de>
	<416F0B33.8050700@inbox.ru> <20041020094304.GC22405@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20041020094304.GC22405@poupinou.org>
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

Bruno Ducrot wrote:

>Hi,
>
>On Fri, Oct 15, 2004 at 01:26:43AM +0200, Nebojsa Trpkovic wrote:  
>  
>
>It's a very large latency, preventing to actually making any kind
>of dynamic frequencies really usefull, and since there is no voltage
>scaling, it's IMHO not so usefull for power consuption purpose (though
>this may help for cooling purpose).
>
>  
>

Well, I have only two working states (1GHz and 2.1GHz) that I chage by 
cpudyn. I poll CPU usage once per 500ms because 1GHz Barton is strong 
enough to respond to all my interactive needs without instant switching 
to 2.1GHz. Switching to 2.1GHz is done by some realy huge load 
(compiling gentoo...) and spikes are neutralized.
So, as I calculated, in the worst scenario there can be only 2 frequency 
changes during 1 second, and loosing of ~2ms (~1700ns) per  1 second for 
transition purposes is not so big deal (~0.2% of cpu time).

And, yes, I use it for cooling, but to be cool, too ;)
