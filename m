From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH] Another powernow-k7 patch for Desktop XP-M usage
Date: Wed, 20 Oct 2004 11:43:04 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041020094304.GC22405@poupinou.org>
References: <200410121018.20518.Hendrik.Muhs@web.de>
	<416F0B33.8050700@inbox.ru>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <416F0B33.8050700@inbox.ru>
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
To: Nebojsa Trpkovic <trx@inbox.ru>
Cc: cpufreq@www.linux.org.uk

Hi,

On Fri, Oct 15, 2004 at 01:26:43AM +0200, Nebojsa Trpkovic wrote:
> I had to manualy patch my powernow-k7.c but at the end I was able to 
> change multiplier on the fly.
> Only thing that made problems is switching latency and I had to set it 
> to 850 (or more). Anything below 850 would freez system. Is 850 (or 900) 
> us a lot?

It's a very large latency, preventing to actually making any kind
of dynamic frequencies really usefull, and since there is no voltage
scaling, it's IMHO not so usefull for power consuption purpose (though
this may help for cooling purpose).

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
