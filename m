From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH] cpufreq_ondemand.c: minimum frequency limit
Date: Thu, 25 Nov 2004 12:11:31 +0100
Message-ID: <20041125111131.GA16620@poupinou.org>
References: <Pine.LNX.4.61.0411251053140.12476@flora>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.61.0411251053140.12476@flora>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Burelli Luca 435260/IF <burellil@dei.unipd.it>
Cc: Dave Jones <davej@codemonkey.org.uk>, cpufreq@www.linux.org.uk

Hi,

On Thu, Nov 25, 2004 at 11:32:31AM +0100, Burelli Luca 435260/IF wrote:
> Hello,
...

> 	I had to implement this because I found extremely annoying to 
> have a 2.8GHz box behave like a 350MHz PII just because I had stopped to 
> read a PDF page; I usually keep my min_freq_percent setting at 33.

Why not just tweaking
/sys/devices/system/cpu/cpu*/cpufreq/scaling_{min,max}_freq instead?

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
