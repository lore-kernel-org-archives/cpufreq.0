From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: powernow-k8 manual voltage selection ?
Date: Mon, 20 Dec 2004 15:12:03 +0100
Message-ID: <20041220141203.GO2140@poupinou.org>
References: <E1CfpfX-000ID6-00.trx-inbox-ru@f17.mail.ru>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <E1CfpfX-000ID6-00.trx-inbox-ru@f17.mail.ru>
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
To: Nebojsa Trpkovic <trx@inbox.ru>
Cc: cpufreq@www.linux.org.uk

Hi,

On Sun, Dec 19, 2004 at 04:15:31AM +0300, Nebojsa Trpkovic wrote:
> Hello.
> 
> I just got my new box and I'm testing it all day long :)
> It's Socket754 AMD Athlon (Newcastle) 3000+. I've spotted that it can run stable (>=1h in prime95) at voltages much lover than it's by default. Default is:
> 1.500V @2.0GHz
> 1.100V @1.0GHz
> And my tests show something like this (I haven't tested all frequencies yet):
> 1.525V @2.5GHz
> 1.400V @2.4GHz
> 1.325V @2.3GHz
> 1.250V @2.2GHz
> 1.200V @2.1GHz
> 1.150V @2.0GHz  <---
> 1.075V @1.9GHz 
> ... and so on.

How you have done this?  By powernow-k8 or via BIOS setting?  If the
latter, I will not trust this input yet. You can verify this is OK via
cpufrequtils at
http://www.kernel.org/pub/linux/utils/kernel/cpufreq/cpufrequtils-0.1.tar.bz2
then go to cpufrequtils-0.1/debug/x86_64 and issue a make, then ./powernow-k8-decode
as root.  You must have the msr kernel driver loaded to get it working.

> My question is: 
> Is there some way (PATCH) to specify manualy voltages for every FID my CPU can run? 

This has been discussed some times ago.  You have to do it yourself (or
maybe ask someone to give you some advice or browse the cpufreq archive,
etc).
Such patch will never reach mainline (but may be posted to this list for
reference purpose only).

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
